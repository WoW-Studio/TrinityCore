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
#include "halls_of_lightning.h"
#include "SpellInfo.h"

enum IonarSpells
{
    SPELL_BALL_LIGHTNING       = 52780,
    SPELL_STATIC_OVERLOAD      = 52658,

    SPELL_DISPERSE             = 52770,
    SPELL_SUMMON_SPARK         = 52746,
    SPELL_SPARK_DESPAWN        = 52776,

    //Spark of Ionar
    SPELL_SPARK_VISUAL_TRIGGER = 52667,
};

enum IonarEvents
{
    EVENT_BALL_LIGHTNING       = 1,
    EVENT_STATIC_OVERLOAD,
    EVENT_CALLBACK_SPARKS,
};

enum IonarYells
{
    SAY_AGGRO = 0,
    SAY_SPLIT = 1,
    SAY_SLAY  = 2,
    SAY_DEATH = 3
};

enum Creatures
{
    NPC_SPARK_OF_IONAR = 28926
};

class boss_ionar : public CreatureScript
{
public:
    boss_ionar() : CreatureScript("boss_ionar") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_ionarAI(creature);
    }

    struct boss_ionarAI : public BossAI
    {
        boss_ionarAI(Creature* creature) : BossAI(creature, DATA_IONAR), Summons(me)
        {
            instance = creature->GetInstanceScript();
        }

        EventMap events;
        InstanceScript* instance;
        SummonList Summons;

        uint8 DisperseCounter;
        bool Dispersed;

        uint32 DisperseHealth;

        void Reset() override
        {
            _Reset();
            events.Reset();
            events.ScheduleEvent(EVENT_STATIC_OVERLOAD, 5000, 6000);
            events.ScheduleEvent(EVENT_BALL_LIGHTNING, 10000, 11000);

            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);

            if (!me->IsVisible())
                me->SetVisible(true);

            if (instance)
                instance->SetBossState(DATA_IONAR, NOT_STARTED);

            DisperseHealth = 45 + urand(0, 10);
            Dispersed = false;

            summons.DespawnAll();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _EnterCombat();

            Talk(SAY_AGGRO);

            if (instance)
                instance->SetBossState(DATA_IONAR, IN_PROGRESS);
        }

        void KilledUnit(Unit* /*victim*/) override
        {
            Talk(SAY_SLAY);
        }

        void JustDied(Unit* /*killer*/) override
        {
            _JustDied();

            Talk(SAY_DEATH);

            summons.DespawnAll();

            if (instance)
                instance->SetBossState(DATA_IONAR, DONE);
        }

        void CallBackSparks()
        {
            if (summons.empty())
                return;

            Position pos = me->GetPosition();

            for (ObjectGuid guid : summons)
            {
                if (Creature* spark = ObjectAccessor::GetCreature(*me, guid))
                {
                    if (spark->IsAlive())
                    {
                        spark->SetSpeed(MOVE_RUN, 2.0f);
                        spark->GetMotionMaster()->Clear();
                        spark->GetMotionMaster()->MovePoint(0, pos);
                    }
                    else
                        spark->DespawnOrUnsummon();
                }
            }
        }

        void JustSummoned(Creature* summoned) override
        {
            if (summoned->GetEntry() == NPC_SPARK_OF_IONAR)
            {
                summons.Summon(summoned);
                summoned->SetSpeed(MOVE_RUN, 0.7f);
                summoned->CastSpell(summoned, SPELL_SPARK_VISUAL_TRIGGER, true);

                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                {
                    summoned->SetInCombatWith(target);
                    summoned->GetMotionMaster()->Clear();
                    summoned->GetMotionMaster()->MoveFollow(target, 0.0f, 0.0f);
                }
            }
        }

        void SummonedCreatureDespawn(Creature* summoned) override
        {
            if (summoned->GetEntry() == NPC_SPARK_OF_IONAR)
            {
                summons.Despawn(summoned);

                if (summons.empty())
                {
                    me->SetVisible(true);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);

                    if (me->GetVictim())
                        me->GetMotionMaster()->MoveChase(me->GetVictim());
                }
            }
        }

        void SpellHit(Unit* /*caster*/, const SpellInfo* spell) override
        {
            if (spell->Id == SPELL_DISPERSE)
            {
                for (uint8 i = 0; i < 5; ++i)
                    me->CastSpell(me, SPELL_SUMMON_SPARK, true);

                me->AttackStop();
                me->SetVisible(false);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_DISABLE_MOVE);

                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();

                events.ScheduleEvent(EVENT_CALLBACK_SPARKS, 25000);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (me->GetHealthPct() < DisperseHealth && !Dispersed)
            {
                Dispersed = true;

                Talk(SAY_SPLIT);

                if (me->IsNonMeleeSpellCast(false))
                    me->InterruptNonMeleeSpells(false);

                DoCast(SPELL_DISPERSE);

                DisperseCounter++;
            }

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_STATIC_OVERLOAD:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                        DoCast(target, SPELL_STATIC_OVERLOAD);
                    events.ScheduleEvent(EVENT_STATIC_OVERLOAD, 6000);
                    break;
                case EVENT_BALL_LIGHTNING:
                    DoCastVictim(SPELL_BALL_LIGHTNING);
                    events.ScheduleEvent(EVENT_BALL_LIGHTNING, 11000);
                    break;
                case EVENT_CALLBACK_SPARKS:
                    CallBackSparks();
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
};

class npc_spark_of_ionar : public CreatureScript
{
public:
    npc_spark_of_ionar() : CreatureScript("npc_spark_of_ionar") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_spark_of_ionarAI(creature);
    }

    struct npc_spark_of_ionarAI : public ScriptedAI
    {
        npc_spark_of_ionarAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;
        uint32 CheckTimer;

        void Reset() override
        {
            me->SetReactState(REACT_PASSIVE);
            CheckTimer = 2000;
        }

        void MovementInform(uint32 type, uint32 pointId) override
        {
            if (type != POINT_MOTION_TYPE || !instance)
                return;

            if (pointId == 0)
                me->DespawnOrUnsummon();
        }

        void UpdateAI(uint32 diff) override
        {
            if (CheckTimer <= diff)
            {
                if (instance)
                {
                    if (Creature* ionar = ObjectAccessor::GetCreature(*me, instance->GetGuidData(DATA_IONAR)))
                    {
                        if (me->GetDistance(ionar) > 50.0f)
                        {
                            Position pos = ionar->GetPosition();

                            me->SetSpeed(MOVE_RUN, 2.0f);
                            me->GetMotionMaster()->Clear();
                            me->GetMotionMaster()->MovePoint(0, pos);
                        }
                    }
                }

                CheckTimer = 2000;
            }
            else CheckTimer -= diff;
        }
    };
};

void AddSC_boss_ionar()
{
    new boss_ionar();
    new npc_spark_of_ionar();
}