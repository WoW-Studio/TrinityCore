/*
* Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "halls_of_lightning.h"

enum LokenSpells
{
    SPELL_ARC_LIGHTNING          = 52921,
    SPELL_LIGHTNING_NOVA         = 52960,
    SPELL_PULSING_SHOCKWAVE      = 52961,
    SPELL_PULSING_SHOCKWAVE_AURA = 59414
};

enum LokenEvents
{
    EVENT_INTRO                  = 1,
    EVENT_ARC_LIGHTNING,
    EVENT_LIGHTNING_NOVA,
    EVENT_PULSING_SHOCKWAVE
};

enum LokenYells
{
    SAY_INTRO_1  = 0,
    SAY_INTRO_2  = 1,
    SAY_AGGRO    = 2,
    SAY_NOVA     = 3,
    SAY_SLAY     = 4,
    SAY_75HEALTH = 5,
    SAY_50HEALTH = 6,
    SAY_25HEALTH = 7,
    SAY_DEATH    = 8,
    EMOTE_NOVA   = 9
};

enum Misc
{
    ACHIEV_TIMELY_DEATH_START_EVENT = 20384
};

enum LokenPhases
{
    PHASE_INTRO  = 1,
    PHASE_COMBAT = 2,
};

int yellHealth[3] =
{
    75,
    50,
    25
};

class boss_loken : public CreatureScript
{
public:
    boss_loken() : CreatureScript("boss_loken") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return GetInstanceAI<boss_lokenAI>(creature);
    }

    struct boss_lokenAI : public BossAI
    {
        boss_lokenAI(Creature* creature) : BossAI(creature, DATA_LOKEN)
        {
            instance = creature->GetInstanceScript();
        }

        EventMap events;
        InstanceScript* instance;

        uint8 introStep;
        uint8 yellCounter;

        void Reset() override
        {
            _Reset();
            events.Reset();

            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
            me->SetReactState(REACT_AGGRESSIVE);

            introStep = 0;
            yellCounter = 0;

            instance->SetBossState(DATA_LOKEN, NOT_STARTED);
            instance->DoStopTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMELY_DEATH_START_EVENT);
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                if (me->IsWithinDistInMap(who, 50.0f) && !events.IsInPhase(PHASE_INTRO) && !events.IsInPhase(PHASE_COMBAT))
                {
                    events.SetPhase(PHASE_INTRO);
                    events.ScheduleEvent(EVENT_INTRO, 1000, 0, PHASE_INTRO);

                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                    me->SetReactState(REACT_PASSIVE);
                }
            }
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();

            Talk(SAY_AGGRO);

            me->AddAura(SPELL_PULSING_SHOCKWAVE, me);
            DoCast(SPELL_PULSING_SHOCKWAVE_AURA);
            me->ClearUnitState(UNIT_STATE_CASTING);

            instance->SetBossState(DATA_LOKEN, IN_PROGRESS);
            instance->DoStartTimedAchievement(ACHIEVEMENT_TIMED_TYPE_EVENT, ACHIEV_TIMELY_DEATH_START_EVENT);
        }

        void JustDied(Unit* /*killer*/) override
        {
            _JustDied();

            Talk(SAY_DEATH);

            instance->SetBossState(DATA_LOKEN, DONE);
            instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PULSING_SHOCKWAVE_AURA);
        }

        void KilledUnit(Unit* who) override
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
                Talk(SAY_SLAY);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!events.IsInPhase(PHASE_INTRO))
            if (!UpdateVictim())
                return;

            if (yellCounter < 3 && me->GetHealthPct() < yellHealth[yellCounter])
            {
                if (yellCounter == 0)
                    Talk(SAY_75HEALTH);
                if (yellCounter == 1)
                    Talk(SAY_50HEALTH);
                if (yellCounter == 2)
                    Talk(SAY_25HEALTH);

                yellCounter++;
            }

            events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_INTRO:
                    switch (introStep)
                    {
                    case 0:
                        Talk(SAY_INTRO_1);
                        events.ScheduleEvent(EVENT_INTRO, 21000, 0, PHASE_INTRO);
                        introStep++;
                        break;
                    case 1:
                        Talk(SAY_INTRO_2);
                        events.ScheduleEvent(EVENT_INTRO, 17000, 0, PHASE_INTRO);
                        introStep++;
                        break;
                    case 2:
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                        me->SetReactState(REACT_AGGRESSIVE);

                        events.SetPhase(PHASE_COMBAT);
                        events.ScheduleEvent(EVENT_ARC_LIGHTNING, 15000, 0, PHASE_COMBAT);
                        events.ScheduleEvent(EVENT_LIGHTNING_NOVA, 20000, 0, PHASE_COMBAT);

                        DoZoneInCombat();
                        break;
                    }
                    break;

                case EVENT_ARC_LIGHTNING:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                        DoCast(target, SPELL_ARC_LIGHTNING);
                    events.ScheduleEvent(EVENT_ARC_LIGHTNING, 15000, 0, PHASE_COMBAT);
                    break;
                case EVENT_LIGHTNING_NOVA:
                    Talk(SAY_NOVA);
                    Talk(EMOTE_NOVA);

                    me->RemoveAurasDueToSpell(SPELL_PULSING_SHOCKWAVE);

                    DoCastAOE(SPELL_LIGHTNING_NOVA);
                    events.ScheduleEvent(EVENT_LIGHTNING_NOVA, 21000, 0, PHASE_COMBAT);
                    events.ScheduleEvent(EVENT_PULSING_SHOCKWAVE, 4000, 0, PHASE_COMBAT);
                    break;
                case EVENT_PULSING_SHOCKWAVE:
                    DoCast(SPELL_PULSING_SHOCKWAVE);
                    me->ClearUnitState(UNIT_STATE_CASTING);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }

    };
};

class spell_loken_pulsing_shockwave : public SpellScriptLoader
{
public:
    spell_loken_pulsing_shockwave() : SpellScriptLoader("spell_loken_pulsing_shockwave") { }

    class spell_loken_pulsing_shockwave_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_loken_pulsing_shockwave_SpellScript);

        void CalculateDamage(SpellEffIndex /*effIndex*/)
        {
            if (!GetHitUnit())
                return;

            float distance = GetCaster()->GetDistance2d(GetHitUnit());
            if (distance > 1.0f)
                SetHitDamage(int32(GetHitDamage() * distance));
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_loken_pulsing_shockwave_SpellScript::CalculateDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_loken_pulsing_shockwave_SpellScript();
    }
};

void AddSC_boss_loken()
{
    new boss_loken();
    new spell_loken_pulsing_shockwave();
}