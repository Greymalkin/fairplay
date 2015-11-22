--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.registration_team DROP CONSTRAINT registration_team_meet_id_afd8addf4559835_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_team_team_awards DROP CONSTRAINT registration_te_team_id_8c83035989929a5_fk_registration_team_id;
ALTER TABLE ONLY public.registration_levelpricing DROP CONSTRAINT registration_levelpric_meet_id_115d7a881a305b69_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_level DROP CONSTRAINT registration_level_meet_id_79e26cf14dba7833_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registration_level_id_5e3be821e1ee54f1_fk_registration_level_id;
ALTER TABLE ONLY public.registration_gymnastpricing DROP CONSTRAINT registration_gymnastpr_meet_id_7b473f46ba2dd238_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registration_gymnast_meet_id_5b593943a0976008_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registration_g_team_id_484edccddf45e9ae_fk_registration_team_id;
ALTER TABLE ONLY public.registration_coach DROP CONSTRAINT registration_coach_meet_id_5b3b5749392da007_fk_meet_meet_id;
ALTER TABLE ONLY public.registration_coach DROP CONSTRAINT registration_co_team_id_ff9acda6c42ce06_fk_registration_team_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registra_shirt_id_1150a9e6cf6f6e9c_fk_registration_shirtsize_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registr_division_id_5ceb56d84a68ea54_fk_competition_division_id;
ALTER TABLE ONLY public.registration_team_team_awards DROP CONSTRAINT regis_teamaward_id_6a8c54a8895b5951_fk_competition_teamaward_id;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT regi_starting_event_id_692a4893cddc5ab8_fk_competition_event_id;
ALTER TABLE ONLY public.gymnastics_teamawards_teams DROP CONSTRAINT gymnastics_teama_team_id_74c95fa6e7d1f9bd_fk_gymnastics_team_id;
ALTER TABLE ONLY public.gymnastics_teamawardrank DROP CONSTRAINT gymnastics_teama_team_id_275982647a9acf9c_fk_gymnastics_team_id;
ALTER TABLE ONLY public.gymnastics_teamaward_groups DROP CONSTRAINT gymnastics_tea_group_id_54379628c6785775_fk_gymnastics_group_id;
ALTER TABLE ONLY public.gymnastics_teamawards_groups DROP CONSTRAINT gymnastics_tea_group_id_19a18f6add60c9e5_fk_gymnastics_group_id;
ALTER TABLE ONLY public.gymnastics_session_groups DROP CONSTRAINT gymnastics_session_id_720abb1ad7e10302_fk_gymnastics_session_id;
ALTER TABLE ONLY public.gymnastics_session_groups DROP CONSTRAINT gymnastics_ses_group_id_1cea550db0d031af_fk_gymnastics_group_id;
ALTER TABLE ONLY public.gymnastics_event DROP CONSTRAINT gymnastics_ev_sign_id_303945d2622b85f2_fk_gymnastics_ledsign_id;
ALTER TABLE ONLY public.gymnastics_athleteevent DROP CONSTRAINT gymnastics_athlete_id_175c925096f62499_fk_gymnastics_athlete_id;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymnastics_athle_team_id_31b2ff280aa6c84d_fk_gymnastics_team_id;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymnastics_ath_group_id_6fe6ea166f267729_fk_gymnastics_group_id;
ALTER TABLE ONLY public.gymnastics_athleteevent DROP CONSTRAINT gymnastics_ath_event_id_1a458a81dc9006c2_fk_gymnastics_event_id;
ALTER TABLE ONLY public.gymnastics_teamaward_groups DROP CONSTRAINT gymnas_teamaward_id_61fe94ad646346ea_fk_gymnastics_teamaward_id;
ALTER TABLE ONLY public.gymnastics_teamawardrank DROP CONSTRAINT gymna_team_award_id_2b5be0530ae01af7_fk_gymnastics_teamaward_id;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymna_starting_event_id_7f52c11682c3d1f0_fk_gymnastics_event_id;
ALTER TABLE ONLY public.gymnastics_teamawards_groups DROP CONSTRAINT gymn_teamawards_id_5753a37bcfe6aa9a_fk_gymnastics_teamawards_id;
ALTER TABLE ONLY public.gymnastics_teamawards_teams DROP CONSTRAINT gymn_teamawards_id_1a96b65abadc28b3_fk_gymnastics_teamawards_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_16d28d56fe638851_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT djang_content_type_id_c15841a83c86e8a_fk_django_content_type_id;
ALTER TABLE ONLY public.competition_teamaward DROP CONSTRAINT competition_teamaward_meet_id_66de8f76dcf41a3e_fk_meet_meet_id;
ALTER TABLE ONLY public.competition_teamawardrank DROP CONSTRAINT competition_tea_team_id_fc6a630a35a6b04_fk_registration_team_id;
ALTER TABLE ONLY public.competition_teamaward_levels DROP CONSTRAINT competition_t_level_id_2a55a41c366c887_fk_registration_level_id;
ALTER TABLE ONLY public.competition_session DROP CONSTRAINT competition_session_meet_id_592a51773f743639_fk_meet_meet_id;
ALTER TABLE ONLY public.competition_event DROP CONSTRAINT competition_event_meet_id_1b5eb1be617cce79_fk_meet_meet_id;
ALTER TABLE ONLY public.competition_division DROP CONSTRAINT competition_division_meet_id_5cb0b8fe548624aa_fk_meet_meet_id;
ALTER TABLE ONLY public.competition_athleteevent DROP CONSTRAINT competition_a_event_id_59ce81fdbb52c15e_fk_competition_event_id;
ALTER TABLE ONLY public.competition_event DROP CONSTRAINT competition__sign_id_5308d02a072a2123_fk_competition_ledsign_id;
ALTER TABLE ONLY public.competition_division DROP CONSTRAINT competition__level_id_591fc54590140e21_fk_registration_level_id;
ALTER TABLE ONLY public.competition_session_divisions DROP CONSTRAINT competiti_session_id_607fa95496b3d6b1_fk_competition_session_id;
ALTER TABLE ONLY public.competition_ledshowmessage DROP CONSTRAINT competiti_led_sign_id_e4edccee0581860_fk_competition_ledsign_id;
ALTER TABLE ONLY public.competition_athleteevent DROP CONSTRAINT competiti_gymnast_id_a98006c43a31d58_fk_registration_gymnast_id;
ALTER TABLE ONLY public.competition_ledshowmessage DROP CONSTRAINT competit_led_show_id_2a0dbd4eadcda691_fk_competition_ledshow_id;
ALTER TABLE ONLY public.competition_teamaward_divisions DROP CONSTRAINT competi_division_id_4aa05dcc200aaa2d_fk_competition_division_id;
ALTER TABLE ONLY public.competition_session_divisions DROP CONSTRAINT competi_division_id_21b143babbcbe418_fk_competition_division_id;
ALTER TABLE ONLY public.competition_teamaward_divisions DROP CONSTRAINT compe_teamaward_id_72948ab44c5484a5_fk_competition_teamaward_id;
ALTER TABLE ONLY public.competition_teamaward_levels DROP CONSTRAINT compe_teamaward_id_282ab6868bd6f50b_fk_competition_teamaward_id;
ALTER TABLE ONLY public.competition_teamawardrank DROP CONSTRAINT compe_team_award_id_f24c188ade69c0e_fk_competition_teamaward_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permiss_user_id_14664e676efa66a2_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_466a7c53304d3d14_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_3869042d0080229b_fk_auth_group_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user__permission_id_353621f9a56f98c0_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permission_id_6a1aedd5e7a8cc98_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_group_id_517bd90ff136fc91_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_content_type_id_251a926a5b095dcf_fk_django_content_type_id;
ALTER TABLE ONLY public.registration_team DROP CONSTRAINT "D5edc2b373a7ecbc5164c44a47440089";
ALTER TABLE ONLY public.registration_team DROP CONSTRAINT "D2d9fb7d6183205603281ea42e3fb644";
DROP INDEX public.registration_team_level_awards_f6a7ca40;
DROP INDEX public.registration_team_level_awards_0763afb4;
DROP INDEX public.registration_team_c74ea229;
DROP INDEX public.registration_team_57413943;
DROP INDEX public.registration_team_0596c34a;
DROP INDEX public.registration_levelpricing_57413943;
DROP INDEX public.registration_level_57413943;
DROP INDEX public.registration_gymnastpricing_57413943;
DROP INDEX public.registration_gymnast_f6a7ca40;
DROP INDEX public.registration_gymnast_bbc11087;
DROP INDEX public.registration_gymnast_a199d76c;
DROP INDEX public.registration_gymnast_9ff3405c;
DROP INDEX public.registration_gymnast_80e0bd5f;
DROP INDEX public.registration_gymnast_57413943;
DROP INDEX public.registration_coach_f6a7ca40;
DROP INDEX public.registration_coach_57413943;
DROP INDEX public.gymnastics_teamawards_teams_f6a7ca40;
DROP INDEX public.gymnastics_teamawards_teams_342c934d;
DROP INDEX public.gymnastics_teamawards_groups_342c934d;
DROP INDEX public.gymnastics_teamawards_groups_0e939a4f;
DROP INDEX public.gymnastics_teamawardrank_f6a7ca40;
DROP INDEX public.gymnastics_teamawardrank_11043aa6;
DROP INDEX public.gymnastics_teamaward_groups_0e939a4f;
DROP INDEX public.gymnastics_teamaward_groups_0763afb4;
DROP INDEX public.gymnastics_session_groups_7fc8ef54;
DROP INDEX public.gymnastics_session_groups_0e939a4f;
DROP INDEX public.gymnastics_event_0dee419f;
DROP INDEX public.gymnastics_athleteevent_975a0aa5;
DROP INDEX public.gymnastics_athleteevent_4437cfac;
DROP INDEX public.gymnastics_athlete_f6a7ca40;
DROP INDEX public.gymnastics_athlete_bbc11087;
DROP INDEX public.gymnastics_athlete_0e939a4f;
DROP INDEX public.django_session_de54fa62;
DROP INDEX public.django_admin_log_e8701ad4;
DROP INDEX public.django_admin_log_417f1b1c;
DROP INDEX public.competition_teamawardrank_f6a7ca40;
DROP INDEX public.competition_teamawardrank_11043aa6;
DROP INDEX public.competition_teamaward_levels_80e0bd5f;
DROP INDEX public.competition_teamaward_levels_0763afb4;
DROP INDEX public.competition_teamaward_divisions_9ff3405c;
DROP INDEX public.competition_teamaward_divisions_0763afb4;
DROP INDEX public.competition_teamaward_57413943;
DROP INDEX public.competition_session_divisions_9ff3405c;
DROP INDEX public.competition_session_divisions_7fc8ef54;
DROP INDEX public.competition_session_57413943;
DROP INDEX public.competition_ledshowmessage_64d8a6fa;
DROP INDEX public.competition_ledshowmessage_035d209c;
DROP INDEX public.competition_event_57413943;
DROP INDEX public.competition_event_0dee419f;
DROP INDEX public.competition_division_80e0bd5f;
DROP INDEX public.competition_division_57413943;
DROP INDEX public.competition_athleteevent_c0f3deba;
DROP INDEX public.competition_athleteevent_4437cfac;
DROP INDEX public.auth_user_user_permissions_e8701ad4;
DROP INDEX public.auth_user_user_permissions_8373b171;
DROP INDEX public.auth_user_groups_e8701ad4;
DROP INDEX public.auth_user_groups_0e939a4f;
DROP INDEX public.auth_permission_417f1b1c;
DROP INDEX public.auth_group_permissions_8373b171;
DROP INDEX public.auth_group_permissions_0e939a4f;
ALTER TABLE ONLY public.registration_team DROP CONSTRAINT registration_team_pkey;
ALTER TABLE ONLY public.registration_team_team_awards DROP CONSTRAINT registration_team_level_awards_team_id_teamaward_id_key;
ALTER TABLE ONLY public.registration_team_team_awards DROP CONSTRAINT registration_team_level_awards_pkey;
ALTER TABLE ONLY public.registration_shirtsize DROP CONSTRAINT registration_shirtsize_pkey;
ALTER TABLE ONLY public.registration_levelpricing DROP CONSTRAINT registration_levelpricing_pkey;
ALTER TABLE ONLY public.registration_level DROP CONSTRAINT registration_level_pkey;
ALTER TABLE ONLY public.registration_gymnastpricing DROP CONSTRAINT registration_gymnastpricing_pkey;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registration_gymnast_pkey;
ALTER TABLE ONLY public.registration_gymnast DROP CONSTRAINT registration_gymnast_athlete_id_key;
ALTER TABLE ONLY public.registration_coach DROP CONSTRAINT registration_coach_pkey;
ALTER TABLE ONLY public.meet_meet DROP CONSTRAINT meet_meet_pkey;
ALTER TABLE ONLY public.gymnastics_teamawards_teams DROP CONSTRAINT gymnastics_teamawards_teams_teamawards_id_team_id_key;
ALTER TABLE ONLY public.gymnastics_teamawards_teams DROP CONSTRAINT gymnastics_teamawards_teams_pkey;
ALTER TABLE ONLY public.gymnastics_teamawards DROP CONSTRAINT gymnastics_teamawards_pkey;
ALTER TABLE ONLY public.gymnastics_teamawards_groups DROP CONSTRAINT gymnastics_teamawards_groups_teamawards_id_group_id_key;
ALTER TABLE ONLY public.gymnastics_teamawards_groups DROP CONSTRAINT gymnastics_teamawards_groups_pkey;
ALTER TABLE ONLY public.gymnastics_teamawardrank DROP CONSTRAINT gymnastics_teamawardrank_pkey;
ALTER TABLE ONLY public.gymnastics_teamaward DROP CONSTRAINT gymnastics_teamaward_pkey;
ALTER TABLE ONLY public.gymnastics_teamaward_groups DROP CONSTRAINT gymnastics_teamaward_groups_teamaward_id_group_id_key;
ALTER TABLE ONLY public.gymnastics_teamaward_groups DROP CONSTRAINT gymnastics_teamaward_groups_pkey;
ALTER TABLE ONLY public.gymnastics_team DROP CONSTRAINT gymnastics_team_pkey;
ALTER TABLE ONLY public.gymnastics_session DROP CONSTRAINT gymnastics_session_pkey;
ALTER TABLE ONLY public.gymnastics_session_groups DROP CONSTRAINT gymnastics_session_groups_session_id_group_id_key;
ALTER TABLE ONLY public.gymnastics_session_groups DROP CONSTRAINT gymnastics_session_groups_pkey;
ALTER TABLE ONLY public.gymnastics_message DROP CONSTRAINT gymnastics_message_pkey;
ALTER TABLE ONLY public.gymnastics_meetsettings DROP CONSTRAINT gymnastics_meetsettings_pkey;
ALTER TABLE ONLY public.gymnastics_ledsign DROP CONSTRAINT gymnastics_ledsign_sign_id_key;
ALTER TABLE ONLY public.gymnastics_ledsign DROP CONSTRAINT gymnastics_ledsign_pkey;
ALTER TABLE ONLY public.gymnastics_group DROP CONSTRAINT gymnastics_group_pkey;
ALTER TABLE ONLY public.gymnastics_event DROP CONSTRAINT gymnastics_event_pkey;
ALTER TABLE ONLY public.gymnastics_athleteevent DROP CONSTRAINT gymnastics_athleteevent_pkey;
ALTER TABLE ONLY public.gymnastics_athleteevent DROP CONSTRAINT gymnastics_athleteevent_athlete_id_6382e848cce5e03a_uniq;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymnastics_athlete_usag_id_key;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymnastics_athlete_pkey;
ALTER TABLE ONLY public.gymnastics_athlete DROP CONSTRAINT gymnastics_athlete_athlete_id_key;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_627e21ab8179124e_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.competition_teamawardrank DROP CONSTRAINT competition_teamawardrank_pkey;
ALTER TABLE ONLY public.competition_teamaward DROP CONSTRAINT competition_teamaward_pkey;
ALTER TABLE ONLY public.competition_teamaward_levels DROP CONSTRAINT competition_teamaward_levels_teamaward_id_level_id_key;
ALTER TABLE ONLY public.competition_teamaward_levels DROP CONSTRAINT competition_teamaward_levels_pkey;
ALTER TABLE ONLY public.competition_teamaward_divisions DROP CONSTRAINT competition_teamaward_divisions_teamaward_id_division_id_key;
ALTER TABLE ONLY public.competition_teamaward_divisions DROP CONSTRAINT competition_teamaward_divisions_pkey;
ALTER TABLE ONLY public.competition_session DROP CONSTRAINT competition_session_pkey;
ALTER TABLE ONLY public.competition_session_divisions DROP CONSTRAINT competition_session_divisions_session_id_division_id_key;
ALTER TABLE ONLY public.competition_session_divisions DROP CONSTRAINT competition_session_divisions_pkey;
ALTER TABLE ONLY public.competition_ledsign DROP CONSTRAINT competition_ledsign_pkey;
ALTER TABLE ONLY public.competition_ledshowmessage DROP CONSTRAINT competition_ledshowmessage_pkey;
ALTER TABLE ONLY public.competition_ledshow DROP CONSTRAINT competition_ledshow_pkey;
ALTER TABLE ONLY public.competition_event DROP CONSTRAINT competition_event_pkey;
ALTER TABLE ONLY public.competition_division DROP CONSTRAINT competition_division_pkey;
ALTER TABLE ONLY public.competition_athleteevent DROP CONSTRAINT competition_athleteevent_pkey;
ALTER TABLE ONLY public.competition_athleteevent DROP CONSTRAINT competition_athleteevent_gymnast_id_9218ffc9fb3da41_uniq;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_key;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.registration_team_team_awards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_shirtsize ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_levelpricing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_level ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_gymnastpricing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_gymnast ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.registration_coach ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.meet_meet ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamawards_teams ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamawards_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamawards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamawardrank ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamaward_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_teamaward ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_team ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_session_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_session ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_meetsettings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_ledsign ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_event ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_athleteevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.gymnastics_athlete ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_teamawardrank ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_teamaward_levels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_teamaward_divisions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_teamaward ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_session_divisions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_session ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_ledsign ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_ledshowmessage ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_ledshow ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_event ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_division ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.competition_athleteevent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.registration_team_level_awards_id_seq;
DROP TABLE public.registration_team_team_awards;
DROP SEQUENCE public.registration_team_id_seq;
DROP TABLE public.registration_team;
DROP SEQUENCE public.registration_shirtsize_id_seq;
DROP TABLE public.registration_shirtsize;
DROP SEQUENCE public.registration_levelpricing_id_seq;
DROP TABLE public.registration_levelpricing;
DROP SEQUENCE public.registration_level_id_seq;
DROP TABLE public.registration_level;
DROP SEQUENCE public.registration_gymnastpricing_id_seq;
DROP TABLE public.registration_gymnastpricing;
DROP SEQUENCE public.registration_gymnast_id_seq;
DROP TABLE public.registration_gymnast;
DROP SEQUENCE public.registration_coach_id_seq;
DROP TABLE public.registration_coach;
DROP SEQUENCE public.meet_meet_id_seq;
DROP TABLE public.meet_meet;
DROP SEQUENCE public.gymnastics_teamawards_teams_id_seq;
DROP TABLE public.gymnastics_teamawards_teams;
DROP SEQUENCE public.gymnastics_teamawards_id_seq;
DROP SEQUENCE public.gymnastics_teamawards_groups_id_seq;
DROP TABLE public.gymnastics_teamawards_groups;
DROP TABLE public.gymnastics_teamawards;
DROP SEQUENCE public.gymnastics_teamawardrank_id_seq;
DROP TABLE public.gymnastics_teamawardrank;
DROP SEQUENCE public.gymnastics_teamaward_id_seq;
DROP SEQUENCE public.gymnastics_teamaward_groups_id_seq;
DROP TABLE public.gymnastics_teamaward_groups;
DROP TABLE public.gymnastics_teamaward;
DROP SEQUENCE public.gymnastics_team_id_seq;
DROP TABLE public.gymnastics_team;
DROP SEQUENCE public.gymnastics_session_id_seq;
DROP SEQUENCE public.gymnastics_session_groups_id_seq;
DROP TABLE public.gymnastics_session_groups;
DROP TABLE public.gymnastics_session;
DROP SEQUENCE public.gymnastics_message_id_seq;
DROP TABLE public.gymnastics_message;
DROP SEQUENCE public.gymnastics_meetsettings_id_seq;
DROP TABLE public.gymnastics_meetsettings;
DROP SEQUENCE public.gymnastics_ledsign_id_seq;
DROP TABLE public.gymnastics_ledsign;
DROP SEQUENCE public.gymnastics_group_id_seq;
DROP TABLE public.gymnastics_group;
DROP SEQUENCE public.gymnastics_event_id_seq;
DROP TABLE public.gymnastics_event;
DROP SEQUENCE public.gymnastics_athleteevent_id_seq;
DROP TABLE public.gymnastics_athleteevent;
DROP SEQUENCE public.gymnastics_athlete_id_seq;
DROP TABLE public.gymnastics_athlete;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.competition_teamawardrank_id_seq;
DROP TABLE public.competition_teamawardrank;
DROP SEQUENCE public.competition_teamaward_levels_id_seq;
DROP TABLE public.competition_teamaward_levels;
DROP SEQUENCE public.competition_teamaward_id_seq;
DROP SEQUENCE public.competition_teamaward_divisions_id_seq;
DROP TABLE public.competition_teamaward_divisions;
DROP TABLE public.competition_teamaward;
DROP SEQUENCE public.competition_session_id_seq;
DROP SEQUENCE public.competition_session_divisions_id_seq;
DROP TABLE public.competition_session_divisions;
DROP TABLE public.competition_session;
DROP SEQUENCE public.competition_ledsign_id_seq;
DROP TABLE public.competition_ledsign;
DROP SEQUENCE public.competition_ledshowmessage_id_seq;
DROP TABLE public.competition_ledshowmessage;
DROP SEQUENCE public.competition_ledshow_id_seq;
DROP TABLE public.competition_ledshow;
DROP SEQUENCE public.competition_event_id_seq;
DROP TABLE public.competition_event;
DROP SEQUENCE public.competition_division_id_seq;
DROP TABLE public.competition_division;
DROP SEQUENCE public.competition_athleteevent_id_seq;
DROP TABLE public.competition_athleteevent;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: bhall
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO bhall;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: bhall
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO fairplay;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO fairplay;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO fairplay;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO fairplay;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO fairplay;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO fairplay;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO fairplay;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO fairplay;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO fairplay;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO fairplay;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO fairplay;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO fairplay;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: competition_athleteevent; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_athleteevent (
    id integer NOT NULL,
    score double precision,
    rank smallint,
    event_id integer NOT NULL,
    gymnast_id integer NOT NULL,
    CONSTRAINT competition_athleteevent_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.competition_athleteevent OWNER TO fairplay;

--
-- Name: competition_athleteevent_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_athleteevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_athleteevent_id_seq OWNER TO fairplay;

--
-- Name: competition_athleteevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_athleteevent_id_seq OWNED BY competition_athleteevent.id;


--
-- Name: competition_division; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_division (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    min_age smallint NOT NULL,
    max_age smallint NOT NULL,
    level_id integer NOT NULL,
    meet_id integer NOT NULL,
    short_name character varying(10) NOT NULL,
    CONSTRAINT competition_division_max_age_check CHECK ((max_age >= 0)),
    CONSTRAINT competition_division_min_age_check CHECK ((min_age >= 0))
);


ALTER TABLE public.competition_division OWNER TO fairplay;

--
-- Name: competition_division_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_division_id_seq OWNER TO fairplay;

--
-- Name: competition_division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_division_id_seq OWNED BY competition_division.id;


--
-- Name: competition_event; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_event (
    id integer NOT NULL,
    "order" smallint NOT NULL,
    name character varying(255) NOT NULL,
    initials character varying(2) NOT NULL,
    meet_id integer NOT NULL,
    sign_id integer NOT NULL,
    CONSTRAINT competition_event_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.competition_event OWNER TO fairplay;

--
-- Name: competition_event_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_event_id_seq OWNER TO fairplay;

--
-- Name: competition_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_event_id_seq OWNED BY competition_event.id;


--
-- Name: competition_ledshow; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_ledshow (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.competition_ledshow OWNER TO fairplay;

--
-- Name: competition_ledshow_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_ledshow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_ledshow_id_seq OWNER TO fairplay;

--
-- Name: competition_ledshow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_ledshow_id_seq OWNED BY competition_ledshow.id;


--
-- Name: competition_ledshowmessage; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_ledshowmessage (
    id integer NOT NULL,
    message text NOT NULL,
    led_show_id integer NOT NULL,
    led_sign_id integer NOT NULL
);


ALTER TABLE public.competition_ledshowmessage OWNER TO fairplay;

--
-- Name: competition_ledshowmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_ledshowmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_ledshowmessage_id_seq OWNER TO fairplay;

--
-- Name: competition_ledshowmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_ledshowmessage_id_seq OWNED BY competition_ledshowmessage.id;


--
-- Name: competition_ledsign; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_ledsign (
    id integer NOT NULL,
    device character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.competition_ledsign OWNER TO fairplay;

--
-- Name: competition_ledsign_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_ledsign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_ledsign_id_seq OWNER TO fairplay;

--
-- Name: competition_ledsign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_ledsign_id_seq OWNED BY competition_ledsign.id;


--
-- Name: competition_session; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_session (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    meet_id integer NOT NULL
);


ALTER TABLE public.competition_session OWNER TO fairplay;

--
-- Name: competition_session_divisions; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_session_divisions (
    id integer NOT NULL,
    session_id integer NOT NULL,
    division_id integer NOT NULL
);


ALTER TABLE public.competition_session_divisions OWNER TO fairplay;

--
-- Name: competition_session_divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_session_divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_session_divisions_id_seq OWNER TO fairplay;

--
-- Name: competition_session_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_session_divisions_id_seq OWNED BY competition_session_divisions.id;


--
-- Name: competition_session_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_session_id_seq OWNER TO fairplay;

--
-- Name: competition_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_session_id_seq OWNED BY competition_session.id;


--
-- Name: competition_teamaward; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_teamaward (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    award_percentage double precision NOT NULL,
    meet_id integer NOT NULL,
    "order" smallint NOT NULL,
    CONSTRAINT competition_teamaward_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.competition_teamaward OWNER TO fairplay;

--
-- Name: competition_teamaward_divisions; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_teamaward_divisions (
    id integer NOT NULL,
    teamaward_id integer NOT NULL,
    division_id integer NOT NULL
);


ALTER TABLE public.competition_teamaward_divisions OWNER TO fairplay;

--
-- Name: competition_teamaward_divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_teamaward_divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_teamaward_divisions_id_seq OWNER TO fairplay;

--
-- Name: competition_teamaward_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_teamaward_divisions_id_seq OWNED BY competition_teamaward_divisions.id;


--
-- Name: competition_teamaward_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_teamaward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_teamaward_id_seq OWNER TO fairplay;

--
-- Name: competition_teamaward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_teamaward_id_seq OWNED BY competition_teamaward.id;


--
-- Name: competition_teamaward_levels; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_teamaward_levels (
    id integer NOT NULL,
    teamaward_id integer NOT NULL,
    level_id integer NOT NULL
);


ALTER TABLE public.competition_teamaward_levels OWNER TO fairplay;

--
-- Name: competition_teamaward_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_teamaward_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_teamaward_levels_id_seq OWNER TO fairplay;

--
-- Name: competition_teamaward_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_teamaward_levels_id_seq OWNED BY competition_teamaward_levels.id;


--
-- Name: competition_teamawardrank; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE competition_teamawardrank (
    id integer NOT NULL,
    rank smallint,
    score double precision,
    team_id integer NOT NULL,
    team_award_id integer NOT NULL,
    CONSTRAINT competition_teamawardrank_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.competition_teamawardrank OWNER TO fairplay;

--
-- Name: competition_teamawardrank_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE competition_teamawardrank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_teamawardrank_id_seq OWNER TO fairplay;

--
-- Name: competition_teamawardrank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE competition_teamawardrank_id_seq OWNED BY competition_teamawardrank.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO fairplay;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO fairplay;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO fairplay;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO fairplay;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO fairplay;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO fairplay;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO fairplay;

--
-- Name: gymnastics_athlete; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_athlete (
    id integer NOT NULL,
    athlete_id smallint NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    team_id integer NOT NULL,
    "position" smallint NOT NULL,
    group_id integer NOT NULL,
    starting_event_id integer,
    overall_score double precision,
    rank smallint,
    scratched boolean NOT NULL,
    birth_date date,
    usag_id character varying(20),
    CONSTRAINT gymnastics_athlete_athlete_id_check CHECK ((athlete_id >= 0)),
    CONSTRAINT gymnastics_athlete_position_check CHECK (("position" >= 0)),
    CONSTRAINT gymnastics_athlete_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.gymnastics_athlete OWNER TO fairplay;

--
-- Name: gymnastics_athlete_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_athlete_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_athlete_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_athlete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_athlete_id_seq OWNED BY gymnastics_athlete.id;


--
-- Name: gymnastics_athleteevent; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_athleteevent (
    id integer NOT NULL,
    score double precision,
    athlete_id integer NOT NULL,
    event_id integer NOT NULL,
    rank smallint,
    CONSTRAINT gymnastics_athleteevent_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.gymnastics_athleteevent OWNER TO fairplay;

--
-- Name: gymnastics_athleteevent_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_athleteevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_athleteevent_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_athleteevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_athleteevent_id_seq OWNED BY gymnastics_athleteevent.id;


--
-- Name: gymnastics_event; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_event (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sign_id integer NOT NULL,
    "order" smallint NOT NULL,
    initials character varying(2) NOT NULL,
    CONSTRAINT gymnastics_event_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.gymnastics_event OWNER TO fairplay;

--
-- Name: gymnastics_event_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_event_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_event_id_seq OWNED BY gymnastics_event.id;


--
-- Name: gymnastics_group; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_group (
    id integer NOT NULL,
    age_group character varying(255) NOT NULL,
    level character varying(20) NOT NULL,
    "order" smallint NOT NULL,
    CONSTRAINT gymnastics_group_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.gymnastics_group OWNER TO fairplay;

--
-- Name: gymnastics_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_group_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_group_id_seq OWNED BY gymnastics_group.id;


--
-- Name: gymnastics_ledsign; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_ledsign (
    id integer NOT NULL,
    sign_id smallint NOT NULL,
    device character varying(255) NOT NULL,
    CONSTRAINT gymnastics_ledsign_sign_id_check CHECK ((sign_id >= 0))
);


ALTER TABLE public.gymnastics_ledsign OWNER TO fairplay;

--
-- Name: gymnastics_ledsign_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_ledsign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_ledsign_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_ledsign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_ledsign_id_seq OWNED BY gymnastics_ledsign.id;


--
-- Name: gymnastics_meetsettings; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_meetsettings (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    date date NOT NULL,
    event_award_percentage double precision NOT NULL,
    all_around_award_percentage double precision NOT NULL
);


ALTER TABLE public.gymnastics_meetsettings OWNER TO fairplay;

--
-- Name: gymnastics_meetsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_meetsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_meetsettings_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_meetsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_meetsettings_id_seq OWNED BY gymnastics_meetsettings.id;


--
-- Name: gymnastics_message; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_message (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.gymnastics_message OWNER TO fairplay;

--
-- Name: gymnastics_message_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_message_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_message_id_seq OWNED BY gymnastics_message.id;


--
-- Name: gymnastics_session; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_session (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.gymnastics_session OWNER TO fairplay;

--
-- Name: gymnastics_session_groups; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_session_groups (
    id integer NOT NULL,
    session_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.gymnastics_session_groups OWNER TO fairplay;

--
-- Name: gymnastics_session_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_session_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_session_groups_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_session_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_session_groups_id_seq OWNED BY gymnastics_session_groups.id;


--
-- Name: gymnastics_session_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_session_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_session_id_seq OWNED BY gymnastics_session.id;


--
-- Name: gymnastics_team; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_team (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    qualified boolean NOT NULL
);


ALTER TABLE public.gymnastics_team OWNER TO fairplay;

--
-- Name: gymnastics_team_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_team_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_team_id_seq OWNED BY gymnastics_team.id;


--
-- Name: gymnastics_teamaward; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamaward (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    award_percentage double precision NOT NULL
);


ALTER TABLE public.gymnastics_teamaward OWNER TO fairplay;

--
-- Name: gymnastics_teamaward_groups; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamaward_groups (
    id integer NOT NULL,
    teamaward_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.gymnastics_teamaward_groups OWNER TO fairplay;

--
-- Name: gymnastics_teamaward_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamaward_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamaward_groups_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamaward_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamaward_groups_id_seq OWNED BY gymnastics_teamaward_groups.id;


--
-- Name: gymnastics_teamaward_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamaward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamaward_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamaward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamaward_id_seq OWNED BY gymnastics_teamaward.id;


--
-- Name: gymnastics_teamawardrank; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamawardrank (
    id integer NOT NULL,
    rank smallint,
    team_id integer NOT NULL,
    team_award_id integer NOT NULL,
    score double precision,
    CONSTRAINT gymnastics_teamawardrank_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.gymnastics_teamawardrank OWNER TO fairplay;

--
-- Name: gymnastics_teamawardrank_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamawardrank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamawardrank_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamawardrank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamawardrank_id_seq OWNED BY gymnastics_teamawardrank.id;


--
-- Name: gymnastics_teamawards; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamawards (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.gymnastics_teamawards OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_groups; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamawards_groups (
    id integer NOT NULL,
    teamawards_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.gymnastics_teamawards_groups OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamawards_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamawards_groups_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamawards_groups_id_seq OWNED BY gymnastics_teamawards_groups.id;


--
-- Name: gymnastics_teamawards_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamawards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamawards_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamawards_id_seq OWNED BY gymnastics_teamawards.id;


--
-- Name: gymnastics_teamawards_teams; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE gymnastics_teamawards_teams (
    id integer NOT NULL,
    teamawards_id integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.gymnastics_teamawards_teams OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE gymnastics_teamawards_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gymnastics_teamawards_teams_id_seq OWNER TO fairplay;

--
-- Name: gymnastics_teamawards_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE gymnastics_teamawards_teams_id_seq OWNED BY gymnastics_teamawards_teams.id;


--
-- Name: meet_meet; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE meet_meet (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    short_name character varying(100) NOT NULL,
    host character varying(200) NOT NULL,
    date date NOT NULL,
    event_award_percentage double precision NOT NULL,
    all_around_award_percentage double precision NOT NULL,
    max_sessions_per_day integer NOT NULL,
    flow_thresh_min integer NOT NULL,
    flow_thresh_max integer NOT NULL,
    is_current_meet boolean NOT NULL,
    notes text
);


ALTER TABLE public.meet_meet OWNER TO fairplay;

--
-- Name: meet_meet_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE meet_meet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meet_meet_id_seq OWNER TO fairplay;

--
-- Name: meet_meet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE meet_meet_id_seq OWNED BY meet_meet.id;


--
-- Name: registration_coach; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_coach (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    usag character varying(225),
    usag_expire_date date,
    safety_expire_date date,
    background_expire_date date,
    team_id integer NOT NULL,
    notes text,
    is_flagged boolean NOT NULL,
    is_verified boolean NOT NULL,
    meet_id integer NOT NULL
);


ALTER TABLE public.registration_coach OWNER TO fairplay;

--
-- Name: registration_coach_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_coach_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_coach_id_seq OWNER TO fairplay;

--
-- Name: registration_coach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_coach_id_seq OWNED BY registration_coach.id;


--
-- Name: registration_gymnast; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_gymnast (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    usag character varying(225),
    dob date,
    age smallint,
    is_us_citizen boolean NOT NULL,
    level_id integer,
    team_id integer NOT NULL,
    is_scratched boolean NOT NULL,
    notes text,
    is_flagged boolean NOT NULL,
    is_verified boolean NOT NULL,
    athlete_id smallint,
    meet_id integer NOT NULL,
    overall_score double precision,
    rank smallint,
    division_id integer,
    starting_event_id integer,
    shirt_id integer,
    CONSTRAINT registration_gymnast_age_check CHECK ((age >= 0)),
    CONSTRAINT registration_gymnast_athlete_id_check CHECK ((athlete_id >= 0)),
    CONSTRAINT registration_gymnast_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.registration_gymnast OWNER TO fairplay;

--
-- Name: registration_gymnast_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_gymnast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_gymnast_id_seq OWNER TO fairplay;

--
-- Name: registration_gymnast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_gymnast_id_seq OWNED BY registration_gymnast.id;


--
-- Name: registration_gymnastpricing; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_gymnastpricing (
    id integer NOT NULL,
    price smallint NOT NULL,
    name character varying(100) NOT NULL,
    meet_id integer NOT NULL,
    CONSTRAINT registration_gymnastpricing_price_check CHECK ((price >= 0))
);


ALTER TABLE public.registration_gymnastpricing OWNER TO fairplay;

--
-- Name: registration_gymnastpricing_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_gymnastpricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_gymnastpricing_id_seq OWNER TO fairplay;

--
-- Name: registration_gymnastpricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_gymnastpricing_id_seq OWNED BY registration_gymnastpricing.id;


--
-- Name: registration_level; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_level (
    id integer NOT NULL,
    level character varying(5) NOT NULL,
    "order" smallint NOT NULL,
    meet_id integer NOT NULL,
    CONSTRAINT registration_level_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.registration_level OWNER TO fairplay;

--
-- Name: registration_level_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_level_id_seq OWNER TO fairplay;

--
-- Name: registration_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_level_id_seq OWNED BY registration_level.id;


--
-- Name: registration_levelpricing; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_levelpricing (
    id integer NOT NULL,
    price smallint NOT NULL,
    name character varying(100) NOT NULL,
    meet_id integer NOT NULL,
    CONSTRAINT registration_levelpricing_price_check CHECK ((price >= 0))
);


ALTER TABLE public.registration_levelpricing OWNER TO fairplay;

--
-- Name: registration_levelpricing_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_levelpricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_levelpricing_id_seq OWNER TO fairplay;

--
-- Name: registration_levelpricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_levelpricing_id_seq OWNED BY registration_levelpricing.id;


--
-- Name: registration_shirtsize; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_shirtsize (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    "order" smallint NOT NULL,
    CONSTRAINT registration_shirtsize_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.registration_shirtsize OWNER TO fairplay;

--
-- Name: registration_shirtsize_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_shirtsize_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_shirtsize_id_seq OWNER TO fairplay;

--
-- Name: registration_shirtsize_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_shirtsize_id_seq OWNED BY registration_shirtsize.id;


--
-- Name: registration_team; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_team (
    id integer NOT NULL,
    gym character varying(100) NOT NULL,
    address_1 character varying(100),
    address_2 character varying(100),
    city character varying(100),
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(225),
    gymnast_cost numeric(6,2) NOT NULL,
    level_cost numeric(6,2) NOT NULL,
    total_cost numeric(6,2) NOT NULL,
    started timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    payment_postmark date,
    registration_complete timestamp with time zone,
    paid_in_full boolean NOT NULL,
    notes text,
    postal_code character varying(100),
    state character varying(100),
    phone character varying(100),
    usag character varying(225),
    team character varying(100) NOT NULL,
    meet_id integer NOT NULL,
    qualified boolean NOT NULL,
    per_level_cost_id integer,
    per_gymnast_cost_id integer
);


ALTER TABLE public.registration_team OWNER TO fairplay;

--
-- Name: registration_team_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_team_id_seq OWNER TO fairplay;

--
-- Name: registration_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_team_id_seq OWNED BY registration_team.id;


--
-- Name: registration_team_team_awards; Type: TABLE; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE TABLE registration_team_team_awards (
    id integer NOT NULL,
    team_id integer NOT NULL,
    teamaward_id integer NOT NULL
);


ALTER TABLE public.registration_team_team_awards OWNER TO fairplay;

--
-- Name: registration_team_level_awards_id_seq; Type: SEQUENCE; Schema: public; Owner: fairplay
--

CREATE SEQUENCE registration_team_level_awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_team_level_awards_id_seq OWNER TO fairplay;

--
-- Name: registration_team_level_awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fairplay
--

ALTER SEQUENCE registration_team_level_awards_id_seq OWNED BY registration_team_team_awards.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_athleteevent ALTER COLUMN id SET DEFAULT nextval('competition_athleteevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_division ALTER COLUMN id SET DEFAULT nextval('competition_division_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_event ALTER COLUMN id SET DEFAULT nextval('competition_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_ledshow ALTER COLUMN id SET DEFAULT nextval('competition_ledshow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_ledshowmessage ALTER COLUMN id SET DEFAULT nextval('competition_ledshowmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_ledsign ALTER COLUMN id SET DEFAULT nextval('competition_ledsign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_session ALTER COLUMN id SET DEFAULT nextval('competition_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_session_divisions ALTER COLUMN id SET DEFAULT nextval('competition_session_divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward ALTER COLUMN id SET DEFAULT nextval('competition_teamaward_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_divisions ALTER COLUMN id SET DEFAULT nextval('competition_teamaward_divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_levels ALTER COLUMN id SET DEFAULT nextval('competition_teamaward_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamawardrank ALTER COLUMN id SET DEFAULT nextval('competition_teamawardrank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athlete ALTER COLUMN id SET DEFAULT nextval('gymnastics_athlete_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athleteevent ALTER COLUMN id SET DEFAULT nextval('gymnastics_athleteevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_event ALTER COLUMN id SET DEFAULT nextval('gymnastics_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_group ALTER COLUMN id SET DEFAULT nextval('gymnastics_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_ledsign ALTER COLUMN id SET DEFAULT nextval('gymnastics_ledsign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_meetsettings ALTER COLUMN id SET DEFAULT nextval('gymnastics_meetsettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_message ALTER COLUMN id SET DEFAULT nextval('gymnastics_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_session ALTER COLUMN id SET DEFAULT nextval('gymnastics_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_session_groups ALTER COLUMN id SET DEFAULT nextval('gymnastics_session_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_team ALTER COLUMN id SET DEFAULT nextval('gymnastics_team_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamaward ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamaward_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamaward_groups ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamaward_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawardrank ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamawardrank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamawards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_groups ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamawards_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_teams ALTER COLUMN id SET DEFAULT nextval('gymnastics_teamawards_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY meet_meet ALTER COLUMN id SET DEFAULT nextval('meet_meet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_coach ALTER COLUMN id SET DEFAULT nextval('registration_coach_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast ALTER COLUMN id SET DEFAULT nextval('registration_gymnast_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnastpricing ALTER COLUMN id SET DEFAULT nextval('registration_gymnastpricing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_level ALTER COLUMN id SET DEFAULT nextval('registration_level_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_levelpricing ALTER COLUMN id SET DEFAULT nextval('registration_levelpricing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_shirtsize ALTER COLUMN id SET DEFAULT nextval('registration_shirtsize_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team ALTER COLUMN id SET DEFAULT nextval('registration_team_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team_team_awards ALTER COLUMN id SET DEFAULT nextval('registration_team_level_awards_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add LED sign	7	add_ledsign
20	Can change LED sign	7	change_ledsign
21	Can delete LED sign	7	delete_ledsign
22	Can add event	8	add_event
23	Can change event	8	change_event
24	Can delete event	8	delete_event
25	Can add team	9	add_team
26	Can change team	9	change_team
27	Can delete team	9	delete_team
28	Can add group	10	add_group
29	Can change group	10	change_group
30	Can delete group	10	delete_group
31	Can add athlete	11	add_athlete
32	Can change athlete	11	change_athlete
33	Can delete athlete	11	delete_athlete
34	Can add athlete event	12	add_athleteevent
35	Can change athlete event	12	change_athleteevent
36	Can delete athlete event	12	delete_athleteevent
40	Can add session	14	add_session
41	Can change session	14	change_session
42	Can delete session	14	delete_session
43	Can add team award	15	add_teamaward
44	Can change team award	15	change_teamaward
45	Can delete team award	15	delete_teamaward
46	Can add message	16	add_message
47	Can change message	16	change_message
48	Can delete message	16	delete_message
49	Can add team award rank	17	add_teamawardrank
50	Can change team award rank	17	change_teamawardrank
51	Can delete team award rank	17	delete_teamawardrank
55	Can add Team	19	add_team
56	Can change Team	19	change_team
57	Can delete Team	19	delete_team
58	Can add Coach	20	add_coach
59	Can change Coach	20	change_coach
60	Can delete Coach	20	delete_coach
61	Can add Gymnast	21	add_gymnast
62	Can change Gymnast	21	change_gymnast
63	Can delete Gymnast	21	delete_gymnast
64	Can add Level	22	add_level
65	Can change Level	22	change_level
66	Can delete Level	22	delete_level
67	Can add Meet Configuration	23	add_meet
68	Can change Meet Configuration	23	change_meet
69	Can delete Meet Configuration	23	delete_meet
70	Can add LED sign	31	add_ledsign
71	Can change LED sign	31	change_ledsign
72	Can delete LED sign	31	delete_ledsign
73	Can add event	24	add_event
74	Can change event	24	change_event
75	Can delete event	24	delete_event
76	Can add division	27	add_division
77	Can change division	27	change_division
78	Can delete division	27	delete_division
79	Can add session	29	add_session
80	Can change session	29	change_session
81	Can delete session	29	delete_session
82	Can add team award	30	add_teamaward
83	Can change team award	30	change_teamaward
84	Can delete team award	30	delete_teamaward
85	Can add team award rank	26	add_teamawardrank
86	Can change team award rank	26	change_teamawardrank
87	Can delete team award rank	26	delete_teamawardrank
103	Can add Gymnast Pricing	36	add_gymnastpricing
104	Can change Gymnast Pricing	36	change_gymnastpricing
105	Can delete Gymnast Pricing	36	delete_gymnastpricing
106	Can add Level Pricing	35	add_levelpricing
107	Can change Level Pricing	35	change_levelpricing
108	Can delete Level Pricing	35	delete_levelpricing
109	Can add Shirt Size	37	add_shirtsize
110	Can change Shirt Size	37	change_shirtsize
111	Can delete Shirt Size	37	delete_shirtsize
115	Can add athlete event	41	add_athleteevent
116	Can change athlete event	41	change_athleteevent
117	Can delete athlete event	41	delete_athleteevent
118	Can add athlete	21	add_athlete
119	Can change athlete	21	change_athlete
120	Can delete athlete	21	delete_athlete
121	Can add led show	43	add_ledshow
122	Can change led show	43	change_ledshow
123	Can delete led show	43	delete_ledshow
124	Can add led show message	42	add_ledshowmessage
125	Can change led show message	42	change_ledshowmessage
126	Can delete led show message	42	delete_ledshowmessage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_permission_id_seq', 126, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$xzQrrS8N6GSf$MYZy2huJTghcuW8JJsm0Yidk64tpfMwE4iMoFhD6LNk=	2015-11-17 21:08:05.755364-05	t	admin			plee@automatastudios.com	t	t	2014-12-10 21:44:05.993191-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: competition_athleteevent; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_athleteevent (id, score, rank, event_id, gymnast_id) FROM stdin;
3736	9.80000000000000071	16	1	226
3760	9.09999999999999964	21	1	104
3694	8.80000000000000071	25	1	250
3695	8.30000000000000071	21	2	250
3761	7.09999999999999964	27	2	104
3802	11.9000000000000004	1	1	2
3658	10.5	4	1	170
3664	11.8000000000000007	2	1	44
3748	11	6	1	234
3808	10.5999999999999996	9	1	5
3814	7.59999999999999964	24	1	6
3665	9.30000000000000071	9	2	44
3749	8.19999999999999929	19	2	234
3809	7.79999999999999982	21	2	5
3815	7.29999999999999982	23	2	6
3810	9.90000000000000036	9	3	5
3666	9.59999999999999964	12	3	44
3750	8.19999999999999929	17	3	234
3816	7	24	3	6
3751	11.5999999999999996	3	4	234
3817	9.09999999999999964	17	4	6
3811	7.70000000000000018	23	4	5
3667	7.40000000000000036	24	4	44
3818	11.3000000000000007	4	5	6
3752	9.59999999999999964	14	5	234
3812	9.09999999999999964	16	5	5
3668	8.40000000000000036	20	5	44
3753	11.9000000000000004	1	6	234
3669	11.4000000000000004	4	6	44
3813	10.5999999999999996	8	6	5
3819	10.0999999999999996	10	6	6
3772	10.4000000000000004	9	1	257
3773	7.29999999999999982	20	2	257
3774	8.69999999999999929	17	3	257
3775	10.5999999999999996	9	4	257
3776	7	24	5	257
3777	8	21	6	257
3820	10.6999999999999993	5	1	201
3718	7	21	1	156
3719	11.4000000000000004	2	2	156
3821	8	18	2	201
3720	8.80000000000000071	13	3	156
3822	7.09999999999999964	21	3	201
3823	11.6999999999999993	3	4	201
3721	8.30000000000000071	18	4	156
3824	8.59999999999999964	19	5	201
3722	8.59999999999999964	20	5	156
3825	8	16	6	201
3723	8	17	6	156
3676	7.29999999999999982	7	1	62
3677	7.5	6	2	62
3678	11.6999999999999993	1	3	62
3679	10.3000000000000007	4	4	62
3680	9.5	5	5	62
3681	9.90000000000000036	3	6	62
3670	9.69999999999999929	8	1	75
3784	7.90000000000000036	13	1	239
3671	10.0999999999999996	4	2	75
3785	10	6	2	239
3743	10.4000000000000004	3	2	276
3797	8.19999999999999929	9	2	178
3725	7.5	11	2	176
3672	10.9000000000000004	5	3	75
3786	9.40000000000000036	9	3	239
3798	8.69999999999999929	12	3	178
3726	7.59999999999999964	13	3	176
3746	7.20000000000000018	3	5	276
3747	11.8000000000000007	3	6	276
3727	11.3000000000000007	2	4	176
5329	10.1999999999999993	4	4	222
3799	9.30000000000000071	7	4	178
3787	9.09999999999999964	9	4	239
3673	8.69999999999999929	10	4	75
3728	11.9000000000000004	1	5	176
3744	9.09999999999999964	3	3	276
3745	9.69999999999999929	3	4	276
3800	8.30000000000000071	7	5	178
3674	7.90000000000000036	9	5	75
3788	7.59999999999999964	10	5	239
3675	9.40000000000000036	7	6	75
3729	8	11	6	176
3801	7.70000000000000018	13	6	178
3689	9	11	2	78
3690	7.79999999999999982	13	3	78
3691	10.8000000000000007	3	4	78
3692	10.0999999999999996	8	5	78
3693	9.19999999999999929	10	6	78
3779	11.9000000000000004	1	2	177
3780	11.3000000000000007	4	3	177
3781	9.80000000000000071	6	4	177
3782	10.9000000000000004	4	5	177
3783	9.09999999999999964	6	6	177
4510	9.40000000000000036	4	1	129
3682	8	12	1	208
4918	7.09999999999999964	16	1	24
3683	7.90000000000000036	15	2	208
3684	11.3000000000000007	2	3	208
4242	7.29999999999999982	14	3	20
3685	10.3000000000000007	7	4	208
3686	7	15	5	208
4684	11.8000000000000007	1	1	308
5199	10.3000000000000007	1	6	309
3766	11.4000000000000004	2	1	300
3700	9.80000000000000071	8	1	102
5014	7.09999999999999964	18	1	137
3767	9.90000000000000036	6	2	300
3701	9.40000000000000036	11	2	102
3768	11.8000000000000007	1	3	300
3954	10.5	6	3	210
5316	7.09999999999999964	20	3	50
3769	10.1999999999999993	11	4	300
5270	11	2	5	145
3918	8.90000000000000036	18	3	67
3919	10.5999999999999996	8	4	67
3925	9.09999999999999964	15	4	110
3926	8.69999999999999929	20	5	110
3920	7.29999999999999982	28	5	67
3927	8.59999999999999964	20	6	110
3921	8.19999999999999929	23	6	67
3916	7.20000000000000018	28	1	67
3917	11	4	2	67
3923	9	15	2	110
3994	10.6999999999999993	3	1	184
3995	9.5	12	2	184
3924	10.8000000000000007	9	3	110
3892	8.19999999999999929	16	1	109
3862	7.79999999999999982	18	1	294
3832	7.70000000000000018	19	1	200
3964	7.40000000000000036	21	1	56
3863	11.1999999999999993	5	2	294
3851	9.19999999999999929	13	2	291
3965	8.59999999999999964	14	2	56
3893	7.40000000000000036	18	2	109
3833	7	23	2	200
3834	10.4000000000000004	7	3	200
3864	10.1999999999999993	9	3	294
3894	10.0999999999999996	10	3	109
3966	9.19999999999999929	14	3	56
3967	7.59999999999999964	21	4	56
3865	7.40000000000000036	23	4	294
3836	11.1999999999999993	2	5	200
3866	10.6999999999999993	5	5	294
3896	10.1999999999999993	7	5	109
3968	8.09999999999999964	18	5	56
3854	8.09999999999999964	19	5	291
3897	11.5	3	6	109
3969	11	7	6	56
3867	10.1999999999999993	10	6	294
3855	7.59999999999999964	23	6	291
3988	10.9000000000000004	4	1	7
3991	10.3000000000000007	6	4	7
3992	8.59999999999999964	18	5	7
3940	10.1999999999999993	7	1	112
3941	8	10	2	112
3942	11.1999999999999993	4	3	112
3944	8.40000000000000036	6	5	112
3945	9.19999999999999929	9	6	112
3886	11.8000000000000007	2	1	108
3976	7.20000000000000018	17	1	113
3928	7.20000000000000018	18	1	111
3827	10.1999999999999993	7	2	281
3887	9.69999999999999929	8	2	108
3929	8.90000000000000036	12	2	111
3977	7.79999999999999982	14	2	113
3978	11.9000000000000004	1	3	113
3888	11.4000000000000004	3	3	108
3930	7.79999999999999982	14	3	111
3828	7.5	16	3	281
3829	10.0999999999999996	5	4	281
3980	8.80000000000000071	12	5	113
3890	8.40000000000000036	14	5	108
3932	7.79999999999999982	15	5	111
3891	11.5	2	6	108
3873	10.5	3	6	243
3831	10.5	4	6	281
3981	10.5	5	6	113
3933	10.4000000000000004	6	6	111
3856	11.5	1	1	16
3970	8.59999999999999964	8	1	77
3857	11.0999999999999996	1	2	16
3971	7.29999999999999982	10	2	77
3972	11.8000000000000007	1	3	77
3858	8.80000000000000071	6	3	16
3859	8.09999999999999964	7	4	16
3974	11.1999999999999993	4	5	77
3861	10.3000000000000007	4	6	16
3869	10.9000000000000004	3	2	243
3870	9.40000000000000036	3	3	243
3871	11.4000000000000004	3	4	243
3872	8.09999999999999964	3	5	243
3975	7.90000000000000036	10	6	77
4000	9.40000000000000036	6	1	183
4001	8.59999999999999964	13	2	183
3982	10.5999999999999996	3	1	211
3874	7.90000000000000036	13	1	106
3952	7.79999999999999982	15	1	210
3875	11.8000000000000007	1	2	106
3953	11.3000000000000007	3	2	210
3983	10.1999999999999993	5	2	211
3877	11.4000000000000004	5	4	106
3985	10.8000000000000007	7	4	211
3955	7.40000000000000036	20	4	210
3770	10.9000000000000004	3	5	300
3986	9.30000000000000071	8	5	211
3956	9.19999999999999929	10	5	210
3878	7.20000000000000018	19	5	106
4089	11.4000000000000004	6	6	97
3987	10.3000000000000007	9	6	211
3957	8.19999999999999929	16	6	210
3879	7.20000000000000018	19	6	106
3838	11	3	1	209
3839	11.0999999999999996	3	2	209
4314	11	1	3	96
3841	7.09999999999999964	4	4	209
3842	11	2	5	209
3843	10.5	4	6	209
5092	11.8000000000000007	2	1	246
4390	11.5	4	1	126
3898	10	12	1	272
5068	9.69999999999999929	13	1	245
4204	9.40000000000000036	16	1	27
3904	8.09999999999999964	21	1	99
3905	11.8000000000000007	2	2	99
5369	9.69999999999999929	9	2	53
3899	9.30000000000000071	11	2	272
3901	9.5	15	4	272
3907	8.19999999999999929	20	4	99
3908	7.09999999999999964	21	5	99
3909	7.5	22	6	99
3910	9.59999999999999964	4	1	101
4115	8	23	2	198
4092	10.9000000000000004	8	3	115
4116	8.59999999999999964	21	3	198
4164	7	28	3	3
4117	8.40000000000000036	20	4	198
4093	7.59999999999999964	23	4	115
4165	7.59999999999999964	24	4	3
4094	11.5999999999999996	3	5	115
4166	9.09999999999999964	18	5	3
4118	8.40000000000000036	22	5	198
4119	11.6999999999999993	3	6	198
4162	8	26	1	3
4091	11.9000000000000004	1	2	115
4163	10.6999999999999993	6	2	3
4167	11.3000000000000007	6	6	3
4095	11.1999999999999993	7	6	115
4090	9	22	1	115
4108	7.40000000000000036	16	1	197
4018	9.90000000000000036	12	1	91
4019	11.5	1	2	91
4139	11.4000000000000004	3	2	216
4140	11.1999999999999993	3	3	216
4020	8.09999999999999964	20	3	91
4021	11.1999999999999993	3	4	91
4141	9.69999999999999929	16	4	216
4022	10.6999999999999993	3	5	91
4023	11.1999999999999993	6	6	91
4143	10.1999999999999993	9	6	216
4168	9.19999999999999929	9	1	9
4024	8.19999999999999929	13	1	258
4174	8	16	1	259
4175	11.5	1	2	259
4025	10	7	2	258
4169	9.80000000000000071	9	2	9
4170	10.4000000000000004	7	3	9
4176	8.40000000000000036	15	3	259
4026	7.59999999999999964	20	3	258
4027	10.5999999999999996	5	4	258
4171	8.80000000000000071	11	4	9
4172	11	6	5	9
4028	10.5999999999999996	8	5	258
4029	11.5999999999999996	2	6	258
4173	7.20000000000000018	21	6	9
4132	11.5	1	1	8
4133	7.59999999999999964	4	2	8
4134	7.20000000000000018	7	3	8
4135	11	3	4	8
4136	9.90000000000000036	3	5	8
4137	11.0999999999999996	1	6	8
4078	7.29999999999999982	16	1	279
4079	7.09999999999999964	16	2	279
4080	8.09999999999999964	12	3	279
4082	9.69999999999999929	9	5	279
4083	11.0999999999999996	3	6	279
4060	11.6999999999999993	2	1	58
4061	9.30000000000000071	7	2	58
4062	8.09999999999999964	8	3	58
4064	11.5	2	5	58
4065	7.90000000000000036	8	6	58
4156	9.30000000000000071	7	1	116
4054	8.59999999999999964	9	1	80
4121	11.9000000000000004	1	2	307
4055	8.90000000000000036	11	2	80
4158	11.0999999999999996	3	3	116
4002	9.5	7	3	183
4056	9	11	3	80
4057	7.40000000000000036	14	4	80
4159	7.20000000000000018	15	4	116
4003	7	16	4	183
4058	8.30000000000000071	8	5	80
4004	7.40000000000000036	12	5	183
4160	7.29999999999999982	13	5	116
4161	10.5	8	6	116
4005	7.20000000000000018	16	6	183
4120	8.5	7	1	307
4122	8.40000000000000036	7	3	307
4123	9.59999999999999964	4	4	307
4124	8.69999999999999929	6	5	307
4102	10.3000000000000007	6	1	51
4148	9.30000000000000071	3	5	247
4147	8	3	4	247
4017	11	3	6	42
4015	9.19999999999999929	3	4	42
4012	8.90000000000000036	3	1	42
4084	7	20	1	97
4041	8.69999999999999929	3	6	301
4149	9.09999999999999964	3	6	247
4010	11.6999999999999993	3	5	302
4103	9.30000000000000071	12	2	51
4104	9.40000000000000036	10	3	51
4008	10.0999999999999996	3	3	302
4086	8	16	3	97
4037	9	3	2	301
4087	10.8000000000000007	8	4	97
4014	8.19999999999999929	3	3	42
4039	8.19999999999999929	3	4	301
4145	10.9000000000000004	3	2	247
4009	9.80000000000000071	3	4	302
4088	7.40000000000000036	18	5	97
4038	11.3000000000000007	3	3	301
4146	7.09999999999999964	3	3	247
5069	7.90000000000000036	17	2	245
4040	9.19999999999999929	3	5	301
4068	11.8000000000000007	1	3	61
4050	10.1999999999999993	7	3	114
5082	9.40000000000000036	14	3	310
5142	8.90000000000000036	18	3	271
5449	11.9000000000000004	1	4	32
3949	10.3000000000000007	10	4	274
5371	9.80000000000000071	13	4	53
4052	11.5999999999999996	5	5	114
3710	9.90000000000000036	11	5	270
4006	8.5	3	1	302
4309	11.5	2	4	121
4231	9.59999999999999964	12	4	252
4310	10.0999999999999996	14	5	121
4232	8.59999999999999964	21	5	252
4311	10.4000000000000004	12	6	121
4233	9	19	6	252
4306	11.3000000000000007	6	1	121
4307	9.19999999999999929	12	2	121
4230	9	17	3	252
4180	7.59999999999999964	15	1	253
4308	7	27	3	121
4319	11.8000000000000007	1	2	87
4283	9.30000000000000071	10	2	10
4295	9.19999999999999929	11	2	119
4320	10	7	3	87
4296	8.59999999999999964	16	3	119
4326	7.5	20	3	88
4327	11.5	5	4	88
4297	9.40000000000000036	14	4	119
4321	8.69999999999999929	21	4	87
4285	7.09999999999999964	25	4	10
4322	11.9000000000000004	2	5	87
4328	10.4000000000000004	8	5	88
4286	10.0999999999999996	12	5	10
4298	7.40000000000000036	24	5	119
4329	9.80000000000000071	13	6	88
4323	9.69999999999999929	14	6	87
4299	8.19999999999999929	19	6	119
4301	11.4000000000000004	4	2	120
4302	10	11	3	120
4303	11.5999999999999996	2	4	120
4304	7.70000000000000018	22	5	120
4305	9.69999999999999929	11	6	120
4210	10.0999999999999996	8	1	155
4199	8.30000000000000071	17	2	158
4200	9.69999999999999929	9	3	158
4212	9.09999999999999964	12	3	155
4213	8.40000000000000036	17	4	155
4177	8	20	4	259
4201	7.5	21	4	158
4178	9.19999999999999929	15	5	259
4214	8.59999999999999964	17	5	155
4202	7.79999999999999982	21	5	158
4203	9.09999999999999964	13	6	158
4288	11.5999999999999996	2	1	118
4289	11.9000000000000004	1	2	118
4291	10.8000000000000007	3	4	118
4292	9.59999999999999964	3	5	118
4293	7.90000000000000036	12	6	118
4330	10.9000000000000004	3	1	298
4331	9.09999999999999964	8	2	298
4333	9.59999999999999964	6	4	298
4334	11.5	2	5	298
4335	9.59999999999999964	6	6	298
4342	11.6999999999999993	1	1	17
4343	8.59999999999999964	9	2	17
4349	11.8000000000000007	1	2	229
4345	10.9000000000000004	2	4	17
4346	10	7	5	17
4347	7.20000000000000018	9	6	17
4252	11.5999999999999996	1	1	268
4192	10	3	1	304
4240	7.40000000000000036	15	1	20
4193	10.8000000000000007	3	2	304
4241	9.40000000000000036	8	2	20
4253	8.90000000000000036	10	2	268
4195	11	2	4	304
4243	10.5	3	4	20
4348	10.6999999999999993	1	1	229
4255	10.3000000000000007	5	4	268
4196	11.8000000000000007	2	5	304
4256	10.9000000000000004	4	5	268
4351	10.6999999999999993	1	4	229
4259	7.5	2	2	228
4350	10.3000000000000007	1	3	229
4260	7.40000000000000036	2	3	228
4244	8.19999999999999929	9	5	20
4262	7.79999999999999982	1	5	228
4263	8.40000000000000036	2	6	228
4257	11.5	4	6	268
4245	11.0999999999999996	6	6	20
4197	10.1999999999999993	9	6	304
4186	10	4	1	303
4187	8	5	2	303
4189	11.0999999999999996	2	4	303
4190	9.40000000000000036	4	5	303
4191	7.79999999999999982	6	6	303
4222	11.9000000000000004	1	1	25
4246	8.30000000000000071	12	1	117
4223	9.80000000000000071	8	2	25
4247	8.69999999999999929	15	2	117
4249	9.19999999999999929	16	4	117
4225	8.30000000000000071	18	4	25
4250	9.09999999999999964	12	5	117
4226	7.40000000000000036	17	5	25
4251	11.0999999999999996	7	6	117
4227	10.3000000000000007	10	6	25
4312	11.5	1	1	96
4313	11.4000000000000004	2	2	96
4315	10.3000000000000007	2	4	96
4316	11	1	5	96
4317	11.1999999999999993	3	6	96
4264	8.69999999999999929	18	1	313
4265	7	21	2	313
4070	9.19999999999999929	16	5	61
3951	10.5	6	6	274
5373	10.0999999999999996	9	6	53
4035	7.59999999999999964	19	6	315
3730	8.40000000000000036	5	1	317
3791	9.40000000000000036	4	2	318
5238	8.80000000000000071	5	3	31
3733	8.30000000000000071	4	4	317
5240	8.59999999999999964	4	5	31
4368	7.79999999999999982	24	3	122
4369	9	16	4	122
4453	7.09999999999999964	28	4	163
4454	11	8	5	163
4370	7.5	26	5	122
4371	9.69999999999999929	14	6	122
4455	8.5	21	6	163
4366	11.3000000000000007	7	1	122
4367	9.09999999999999964	14	2	122
4451	8.69999999999999929	18	2	163
4438	7.90000000000000036	14	1	162
4452	11.0999999999999996	7	3	163
4360	9.40000000000000036	15	1	11
4498	8.69999999999999929	17	1	41
4415	11.6999999999999993	2	2	43
4499	11.3000000000000007	3	2	41
4487	8.69999999999999929	14	2	84
4361	7.29999999999999982	24	2	11
4488	10.3000000000000007	6	3	84
4500	9.69999999999999929	11	3	41
4416	8.19999999999999929	18	3	43
4489	10.9000000000000004	7	4	84
4363	9.80000000000000071	12	4	11
4417	9.30000000000000071	15	4	43
4501	8	22	4	41
4418	10.1999999999999993	10	5	43
4364	10.0999999999999996	13	5	11
4502	7.09999999999999964	25	5	41
4503	11.6999999999999993	3	6	41
4419	9.90000000000000036	12	6	43
4365	8.80000000000000071	17	6	11
4373	9.80000000000000071	10	2	123
4523	7.29999999999999982	19	2	40
4374	8.80000000000000071	16	3	123
4524	7.5	22	3	40
4375	8.90000000000000036	19	4	123
4525	7.5	22	4	40
4526	8.80000000000000071	15	5	40
4376	7.90000000000000036	21	5	123
4377	8.69999999999999929	18	6	123
4378	7.59999999999999964	19	1	173
4379	9.19999999999999929	11	2	173
4380	8.5	14	3	173
4381	8.5	15	4	173
4382	11.8000000000000007	1	5	173
4383	7.59999999999999964	19	6	173
4457	9.40000000000000036	7	2	74
4403	7.40000000000000036	12	2	205
4458	10.0999999999999996	6	3	74
4404	10.0999999999999996	8	3	205
4459	11.3000000000000007	1	4	74
4405	9.80000000000000071	6	4	205
4406	8.69999999999999929	4	5	205
4460	7.40000000000000036	11	5	74
4461	10.9000000000000004	3	6	74
4353	10.5	1	6	229
4407	10.1999999999999993	5	6	205
4469	10.3000000000000007	5	2	240
4470	10	7	3	240
4471	9.30000000000000071	12	4	240
4472	11.8000000000000007	1	5	240
4473	10.1999999999999993	7	6	240
4409	10.9000000000000004	2	2	280
4427	9.30000000000000071	7	2	266
4410	11.3000000000000007	2	3	280
4428	7.20000000000000018	9	3	266
4411	11.4000000000000004	1	4	280
4429	7.90000000000000036	8	4	266
4412	11.0999999999999996	5	5	280
4430	9.09999999999999964	8	5	266
4413	11.8000000000000007	1	6	280
4431	8.09999999999999964	9	6	266
4355	9.90000000000000036	5	2	297
4352	7.40000000000000036	2	5	229
4356	9.59999999999999964	7	3	297
4357	10	5	4	297
4358	8.19999999999999929	8	5	297
4359	10.5	3	6	297
4505	10.6999999999999993	4	2	81
4463	9.59999999999999964	7	2	21
4511	8.69999999999999929	12	2	129
4512	11.8000000000000007	1	3	129
4464	9.90000000000000036	6	3	21
4506	8.90000000000000036	12	3	81
4513	11.1999999999999993	1	4	129
4507	10.3000000000000007	6	4	81
4465	9.5	9	4	21
4514	11.9000000000000004	1	5	129
4508	10.6999999999999993	5	5	81
4466	8.09999999999999964	10	5	21
4515	11.5	3	6	129
4467	8.80000000000000071	11	6	21
4509	8.30000000000000071	15	6	81
4397	11.5	3	2	305
4398	11.8000000000000007	1	3	305
4399	11.9000000000000004	1	4	305
4400	9.90000000000000036	3	5	305
4401	9.5	2	6	305
4385	7.79999999999999982	18	2	125
4386	10.8000000000000007	4	3	125
4387	10.3000000000000007	10	4	125
4388	7.90000000000000036	15	5	125
4389	11.9000000000000004	1	6	125
4391	11.8000000000000007	1	2	126
3735	8.80000000000000071	5	6	317
4774	11.5	2	1	37
4480	8	8	1	128
5387	10.5999999999999996	2	2	100
4517	9.5	7	2	35
4949	7.20000000000000018	12	2	55
4776	9.09999999999999964	6	3	37
4572	7.20000000000000018	11	3	223
4597	10.6999999999999993	4	4	36
4667	7.09999999999999964	26	2	85
4534	9.90000000000000036	11	1	12
4529	9.30000000000000071	8	2	72
4559	9.09999999999999964	12	2	293
4535	7.59999999999999964	22	2	12
4536	11.3000000000000007	3	3	12
4530	10.8000000000000007	4	3	72
4560	9.80000000000000071	10	3	293
4531	11.5999999999999996	2	4	72
4537	10.6999999999999993	9	4	12
4561	10.5999999999999996	10	4	293
4532	11.9000000000000004	1	5	72
4538	11	6	5	12
4562	10.3000000000000007	9	5	293
4533	10.8000000000000007	5	6	72
4563	10.0999999999999996	9	6	293
4539	7.59999999999999964	22	6	12
4648	11.5	4	1	260
4660	7.40000000000000036	20	1	235
4661	10.5	7	2	235
4650	8.90000000000000036	15	3	260
4663	11.8000000000000007	1	4	235
4651	7.29999999999999982	24	4	260
4664	11.3000000000000007	1	5	235
4527	11.6999999999999993	1	6	40
4653	7	24	6	260
4600	10.5999999999999996	6	1	13
4636	8.5	12	1	202
4638	11.6999999999999993	1	3	202
4548	10.9000000000000004	4	3	292
4549	10.1999999999999993	7	4	292
4639	8.69999999999999929	12	4	202
4550	9.80000000000000071	12	5	292
4604	9.69999999999999929	13	5	13
4551	10.3000000000000007	6	6	292
4605	9.30000000000000071	12	6	13
4553	10.4000000000000004	4	2	76
4565	7.79999999999999982	15	2	48
4554	11.5999999999999996	2	3	76
4566	8.5	11	3	48
4567	11.9000000000000004	1	4	48
4555	7.79999999999999982	18	4	76
4556	11.3000000000000007	5	5	76
4568	9.19999999999999929	10	5	48
4569	9.19999999999999929	11	6	48
4557	8.80000000000000071	13	6	76
4625	8.5	9	2	46
4595	10.8000000000000007	1	2	36
4626	7.09999999999999964	10	3	46
4627	9.69999999999999929	5	4	46
4628	9.69999999999999929	7	5	46
4629	10.6999999999999993	2	6	46
4673	7.79999999999999982	16	2	22
4674	10.6999999999999993	4	3	22
4675	7.5	13	4	22
4676	11.5999999999999996	3	5	22
4677	11	7	6	22
4685	9.80000000000000071	4	2	308
4613	7.90000000000000036	7	2	267
4686	11.3000000000000007	2	3	308
4614	9.09999999999999964	6	3	267
4623	11.0999999999999996	3	6	244
4621	7.59999999999999964	3	4	244
4678	10.9000000000000004	6	1	130
4687	9.40000000000000036	5	4	308
4596	10.9000000000000004	3	3	36
4541	11.6999999999999993	3	2	242
4581	8.69999999999999929	3	6	299
4577	7.5	3	2	299
4620	8	3	3	244
4573	8.30000000000000071	9	4	223
4615	7.70000000000000018	7	4	267
4579	7.5	3	4	299
4544	8.90000000000000036	3	5	242
4580	10.1999999999999993	3	5	299
4545	11.6999999999999993	3	6	242
4542	11.4000000000000004	3	3	242
4679	7	22	2	130
4616	10.9000000000000004	2	5	267
4688	8.5	7	5	308
4689	8.40000000000000036	4	6	308
4617	8	5	6	267
4588	11.5999999999999996	3	1	311
4690	10.5999999999999996	9	1	316
4691	10.1999999999999993	8	2	316
4589	8.19999999999999929	16	2	311
4681	9.69999999999999929	14	4	130
4693	9.30000000000000071	16	4	316
4576	11.8000000000000007	3	1	299
4591	8	21	4	311
4682	11.6999999999999993	4	5	130
4694	10.5999999999999996	8	5	316
4592	9.19999999999999929	17	5	311
4593	10.1999999999999993	8	6	311
4695	9.5	12	6	316
4683	7.09999999999999964	23	6	130
4594	9.80000000000000071	6	1	36
5030	11.3000000000000007	2	5	138
4574	9.5	7	5	223
4778	7.40000000000000036	12	5	37
3939	9.59999999999999964	5	6	275
4485	8.40000000000000036	10	6	128
4276	11	3	1	33
4630	7.40000000000000036	9	1	248
4631	10.9000000000000004	5	2	248
4618	7.29999999999999982	3	1	244
4734	7.90000000000000036	23	3	131
4705	10.9000000000000004	7	4	124
4735	8.80000000000000071	17	4	131
4706	11.8000000000000007	2	5	124
4736	10.6999999999999993	11	5	131
4707	9.90000000000000036	13	6	124
4737	8.40000000000000036	22	6	131
4732	10.6999999999999993	10	1	131
4703	10.0999999999999996	8	2	124
4733	9.59999999999999964	9	2	131
4768	7.20000000000000018	17	1	283
4704	9.40000000000000036	15	3	124
4750	11.3000000000000007	3	1	217
4708	9.69999999999999929	13	1	39
4786	8.5	19	1	132
4859	10.6999999999999993	5	2	287
4781	10.1999999999999993	6	2	73
4787	9.69999999999999929	7	2	132
4709	8.69999999999999929	13	2	39
4841	8.59999999999999964	16	2	220
4751	8.30000000000000071	18	2	217
4763	7	25	2	284
4764	11.8000000000000007	1	3	284
4710	11.6999999999999993	2	3	39
4752	9	13	3	217
4842	8.80000000000000071	14	3	220
4788	8.59999999999999964	15	3	132
4782	7.90000000000000036	19	3	73
4860	7	23	3	287
4789	11.5	4	4	132
4783	11.0999999999999996	6	4	73
4765	10.3000000000000007	11	4	284
4861	9.5	13	4	287
4711	8.90000000000000036	18	4	39
4843	8.90000000000000036	19	4	220
4712	11.9000000000000004	3	5	39
4862	10.6999999999999993	7	5	287
4766	10.1999999999999993	11	5	284
4784	9.30000000000000071	15	5	73
4754	8.80000000000000071	17	5	217
4790	7.90000000000000036	23	5	132
4791	10.8000000000000007	7	6	132
4785	9.19999999999999929	16	6	73
4767	8.19999999999999929	18	6	284
4863	7.70000000000000018	21	6	287
4845	7.29999999999999982	24	6	220
4755	7	25	6	217
4853	9.19999999999999929	12	2	286
4865	7	22	2	295
4866	10.8000000000000007	4	3	295
4854	8.30000000000000071	19	3	286
4867	9.90000000000000036	13	4	295
4855	9.80000000000000071	15	4	286
4868	10.5999999999999996	6	5	295
4856	9.59999999999999964	10	5	286
4869	11.4000000000000004	4	6	295
4857	9.5	12	6	286
4806	11.5999999999999996	2	3	285
4824	10.0999999999999996	8	3	174
4807	11.1999999999999993	4	4	285
4825	8.40000000000000036	16	4	174
4826	11.5	2	5	174
4808	9.19999999999999929	14	5	285
4809	7.20000000000000018	20	6	285
4714	10	4	1	261
4715	7.09999999999999964	7	2	261
4716	7.70000000000000018	5	3	261
4718	11.4000000000000004	1	5	261
4719	7.29999999999999982	6	6	261
4720	11.9000000000000004	1	1	47
4834	9.80000000000000071	7	1	93
4846	7.90000000000000036	13	1	18
4835	9.40000000000000036	10	2	93
4721	8.80000000000000071	13	2	47
4847	7	17	2	18
4836	11.4000000000000004	4	3	93
4848	10.8000000000000007	5	3	18
4722	7	18	3	47
4724	11.5999999999999996	3	5	47
4850	11.5999999999999996	4	5	18
4838	7.40000000000000036	17	5	93
4839	11.9000000000000004	1	6	93
4725	8.90000000000000036	12	6	47
4851	7.70000000000000018	18	6	18
4792	8.69999999999999929	8	1	23
4793	11.8000000000000007	1	2	23
4794	7.79999999999999982	13	3	23
4796	7.20000000000000018	14	5	23
4797	8.59999999999999964	14	6	23
4798	10.6999999999999993	2	1	306
4799	8	6	2	306
4800	10.4000000000000004	4	3	306
4802	8.80000000000000071	5	5	306
4803	8.59999999999999964	3	6	306
4816	10.5999999999999996	4	1	212
4817	7	20	2	212
4818	8.80000000000000071	13	3	212
4820	7.79999999999999982	16	5	212
4821	11.8000000000000007	2	6	212
4744	10.5	10	1	314
4745	10.4000000000000004	6	2	314
4746	9.5	13	3	314
4748	7.09999999999999964	22	5	314
4749	8.19999999999999929	17	6	314
4944	10.9000000000000004	1	3	38
4422	8.69999999999999929	6	3	34
4423	11.1999999999999993	2	4	34
3913	8.59999999999999964	7	4	101
4280	11.5	3	5	33
3914	7.29999999999999982	8	5	101
4635	9.59999999999999964	6	6	248
5020	9.90000000000000036	14	1	83
4913	10.6999999999999993	4	2	203
4914	7	22	3	203
4916	8.40000000000000036	21	5	203
4917	7.59999999999999964	23	6	203
5044	11.5	3	1	175
4990	11.1999999999999993	5	1	262
4931	10.6999999999999993	6	2	288
4877	10.1999999999999993	8	2	236
5045	8.40000000000000036	16	2	175
4992	10.5999999999999996	6	3	262
4878	8.59999999999999964	18	3	236
5046	7.90000000000000036	21	3	175
4932	7.29999999999999982	23	3	288
5047	11	5	4	175
4879	10.6999999999999993	8	4	236
4933	9.90000000000000036	14	4	288
4993	9.40000000000000036	18	4	262
4934	9.59999999999999964	9	5	288
5048	9.09999999999999964	13	5	175
5049	9.09999999999999964	16	6	175
4995	9	17	6	262
4935	8.40000000000000036	19	6	288
4881	8.19999999999999929	20	6	236
4882	7.09999999999999964	20	1	237
5034	9.5	10	3	289
5035	10.0999999999999996	8	4	289
4885	9.90000000000000036	9	4	237
5036	10.1999999999999993	10	5	289
4886	9.90000000000000036	11	5	237
5037	11.9000000000000004	1	6	289
4887	9.69999999999999929	10	6	237
5038	10.3000000000000007	2	1	66
5039	7.59999999999999964	5	2	66
5041	8.5	5	4	66
5042	8.09999999999999964	7	5	66
4901	11.9000000000000004	2	2	135
4902	9.19999999999999929	11	3	135
4903	7.09999999999999964	14	4	135
4904	7	13	5	135
4905	10.3000000000000007	4	6	135
4895	11.4000000000000004	1	2	134
4896	9.09999999999999964	9	3	134
4897	10.4000000000000004	4	4	134
4898	8.59999999999999964	13	5	134
4899	8.69999999999999929	15	6	134
4960	10.1999999999999993	5	1	94
4985	10.5999999999999996	3	2	60
4961	9.80000000000000071	4	2	94
4986	10.8000000000000007	3	3	60
4987	11.0999999999999996	3	4	60
4963	7.5	9	4	94
5051	11.5	2	2	152
4964	11.3000000000000007	3	5	94
4988	9	9	5	60
4989	9.5	7	6	60
4965	8.40000000000000036	8	6	94
5050	11.1999999999999993	4	1	152
4966	10.4000000000000004	7	1	95
4967	8.80000000000000071	8	2	95
4969	11.8000000000000007	1	4	95
4970	11.4000000000000004	3	5	95
4971	11.8000000000000007	1	6	95
4925	10.5	5	2	79
4919	8.40000000000000036	14	2	24
4926	9.19999999999999929	10	3	79
4920	7.20000000000000018	15	3	24
4921	10.4000000000000004	4	4	24
4927	9.19999999999999929	10	4	79
4928	10.1999999999999993	6	5	79
4922	9.59999999999999964	7	5	24
4929	11.6999999999999993	1	6	79
4923	11.6999999999999993	2	6	24
4889	11.6999999999999993	2	2	133
5015	9.59999999999999964	9	2	137
5016	11	3	3	137
4890	7.09999999999999964	19	3	133
4891	9.59999999999999964	13	4	133
5017	9.40000000000000036	15	4	137
4892	10.5	4	5	133
5018	9.19999999999999929	9	5	137
4893	8.80000000000000071	13	6	133
5019	8.40000000000000036	15	6	137
5009	9.59999999999999964	10	2	312
4937	9.19999999999999929	12	2	273
4938	9.30000000000000071	15	3	273
5010	7.90000000000000036	22	3	312
5011	11	5	4	312
4939	10.4000000000000004	9	4	273
5012	9.80000000000000071	12	5	312
4940	7.20000000000000018	20	5	273
4941	11.3000000000000007	2	6	273
5013	7.59999999999999964	20	6	312
4997	8.80000000000000071	5	2	30
4998	9.90000000000000036	3	3	30
4999	7	6	4	30
5000	8.40000000000000036	6	5	30
5001	9.80000000000000071	2	6	30
5139	9.5	16	6	172
5135	7.20000000000000018	25	2	172
5136	9.40000000000000036	16	3	172
5137	11.4000000000000004	3	4	172
5110	9.69999999999999929	8	1	195
5138	11.9000000000000004	1	5	172
5128	9.80000000000000071	12	1	45
5129	8	20	2	45
5130	10.5	5	3	45
5131	10.6999999999999993	8	4	45
5132	8.5	19	5	45
5133	10.8000000000000007	6	6	45
5213	10.0999999999999996	9	2	238
5214	11.6999999999999993	1	3	238
5215	10.4000000000000004	10	4	238
5217	7.90000000000000036	22	6	238
5146	11	3	1	157
5122	8.19999999999999929	14	1	263
5123	8.59999999999999964	13	2	263
5147	7.79999999999999982	19	2	157
5124	7.79999999999999982	18	3	263
5148	7.70000000000000018	19	3	157
5125	11.8000000000000007	2	4	263
5149	9.5	10	4	157
5150	10.4000000000000004	9	5	157
5126	9	16	5	263
5127	11.5	4	6	263
5151	7.59999999999999964	18	6	157
5218	9.59999999999999964	5	1	290
5104	9	6	1	14
5105	11.5999999999999996	1	2	14
5219	9.09999999999999964	3	2	290
5106	10.9000000000000004	2	3	14
5220	8.80000000000000071	4	3	290
5221	11.9000000000000004	1	4	290
5107	7.59999999999999964	6	4	14
5108	10.5999999999999996	2	5	14
5222	8.59999999999999964	6	5	290
5109	10	2	6	14
5223	8.19999999999999929	5	6	290
5188	11.9000000000000004	1	1	296
5206	9.30000000000000071	9	1	179
5189	9.19999999999999929	8	2	296
5207	7.09999999999999964	14	2	179
5190	11.5999999999999996	1	3	296
5208	11.5999999999999996	2	3	179
5192	7	12	5	296
5210	7	14	5	179
5193	11.4000000000000004	1	6	296
5211	10.1999999999999993	6	6	179
5158	10.6999999999999993	4	1	206
5116	9.59999999999999964	10	1	141
5182	7.5	15	1	221
5183	10.5999999999999996	2	2	221
5159	10.1999999999999993	6	2	206
5117	9.5	9	2	141
5160	10.6999999999999993	6	3	206
5184	9.80000000000000071	8	3	221
5118	8.59999999999999964	10	3	141
5119	11.3000000000000007	2	4	141
5185	9.90000000000000036	6	4	221
5161	8.80000000000000071	13	4	206
5162	11.6999999999999993	2	5	206
5186	10.1999999999999993	7	5	221
5120	7.59999999999999964	16	5	141
5062	11.3000000000000007	2	1	241
5152	8.59999999999999964	9	1	207
5063	9.59999999999999964	5	2	241
5153	9.40000000000000036	6	2	207
5064	9.69999999999999929	4	3	241
5154	8.59999999999999964	7	3	207
5155	11.1999999999999993	2	4	207
5065	7.29999999999999982	10	4	241
5066	11.5999999999999996	1	5	241
5156	8.59999999999999964	10	5	207
5074	10.5999999999999996	6	1	153
5075	10.6999999999999993	3	2	153
5052	11.5	3	3	152
5076	7.40000000000000036	9	3	153
5053	8.30000000000000071	8	4	152
5077	7.09999999999999964	9	4	153
5054	11.5	1	5	152
5078	10.8000000000000007	5	5	153
5056	11.1999999999999993	2	1	140
5057	10	6	2	140
5058	7.20000000000000018	16	3	140
5059	8.30000000000000071	11	4	140
5060	8.09999999999999964	11	5	140
5194	10.5	3	1	309
5195	11.8000000000000007	2	2	309
5196	11.1999999999999993	3	3	309
5197	10.8000000000000007	3	4	309
5198	11.3000000000000007	1	5	309
5224	9.19999999999999929	10	1	142
5200	7	19	1	26
5201	10.5	4	2	26
5225	9.40000000000000036	10	2	142
5226	8.5	14	3	142
5203	8.30000000000000071	19	4	26
5204	10.3000000000000007	6	5	26
5205	7.40000000000000036	17	6	26
5086	11.1999999999999993	2	1	278
5087	11.5	1	2	278
5089	11.3000000000000007	1	4	278
5090	9	4	5	278
5091	11.6999999999999993	2	6	278
5080	9.5	15	1	310
5081	8.80000000000000071	14	2	310
5083	11	4	4	310
5084	8.40000000000000036	19	5	310
5380	9.80000000000000071	15	1	232
5398	11.0999999999999996	5	1	15
5399	8.59999999999999964	15	2	15
5400	7	21	3	15
5401	9.09999999999999964	16	4	15
5402	11.0999999999999996	5	5	15
5403	11.8000000000000007	2	6	15
5350	11.5	2	1	264
5356	8.80000000000000071	14	1	219
5351	7.09999999999999964	21	2	264
5357	7	24	2	219
5352	11.5	2	3	264
5358	10.4000000000000004	8	3	219
5353	11	4	4	264
5359	8.30000000000000071	20	4	219
5360	9.5	11	5	219
5354	8.40000000000000036	16	5	264
5355	10.6999999999999993	8	6	264
5361	9.19999999999999929	15	6	219
5296	10.0999999999999996	7	1	204
5242	8.59999999999999964	11	1	218
5297	9.90000000000000036	8	2	204
5243	7.79999999999999982	20	2	218
5244	9.30000000000000071	11	3	218
5298	7.79999999999999982	17	3	204
5245	8.5	14	4	218
5299	8.09999999999999964	19	4	204
5300	11.5	3	5	204
5246	11.1999999999999993	5	5	218
5301	10.0999999999999996	8	6	204
5247	8.40000000000000036	15	6	218
5254	10	3	1	57
5255	11.3000000000000007	2	2	57
5256	7.40000000000000036	6	3	57
5257	11.3000000000000007	2	4	57
5258	9.80000000000000071	4	5	57
5259	8.59999999999999964	4	6	57
5404	10.9000000000000004	4	1	182
5290	10.4000000000000004	6	1	181
5326	7.40000000000000036	14	1	222
5291	10	5	2	181
5327	7.29999999999999982	13	2	222
5292	9.19999999999999929	10	3	181
5328	7	14	3	222
5293	10.0999999999999996	5	4	181
5330	8.59999999999999964	5	5	222
5295	8.30000000000000071	10	6	181
5331	7.29999999999999982	14	6	222
5332	9.69999999999999929	9	1	19
5284	8	12	1	180
5333	10.5	3	2	19
5285	7	18	2	180
5286	7.59999999999999964	15	3	180
5334	7.5	17	3	19
5287	8.5	16	4	180
5288	10.4000000000000004	6	5	180
5336	8.90000000000000036	11	5	19
5337	8.80000000000000071	14	6	19
5289	8.40000000000000036	17	6	180
5320	11.6999999999999993	2	1	265
5308	10.5999999999999996	5	1	154
5309	10.5	4	2	154
5321	9.90000000000000036	6	2	265
5310	11	5	3	154
5322	10.8000000000000007	6	3	265
5397	7.90000000000000036	3	6	269
5312	10.5	6	5	154
5261	7	23	2	52
5324	7.90000000000000036	9	5	265
5393	11.4000000000000004	3	2	269
5394	11.9000000000000004	3	3	269
5396	8.09999999999999964	3	5	269
5263	7.59999999999999964	22	4	52
5325	9.80000000000000071	4	6	265
5313	9.69999999999999929	5	6	154
5230	7.70000000000000018	14	1	143
5231	11.5999999999999996	2	2	143
5233	9.69999999999999929	8	4	143
5234	7	16	5	143
5235	8.69999999999999929	13	6	143
5374	10.5	5	1	150
5302	9.09999999999999964	11	1	146
5338	7.79999999999999982	14	1	147
5314	7.29999999999999982	17	1	50
5375	9.80000000000000071	7	2	150
5315	9.09999999999999964	13	2	50
5303	8.90000000000000036	14	2	146
5267	7.20000000000000018	19	2	145
5304	9.90000000000000036	8	3	146
5376	9.69999999999999929	9	3	150
5340	9.09999999999999964	11	3	147
5268	7.09999999999999964	18	3	145
5269	11.9000000000000004	1	4	145
5377	11.5999999999999996	2	4	150
5317	10.9000000000000004	6	4	50
5341	9.59999999999999964	14	4	147
5227	9.09999999999999964	17	4	142
5342	11.3000000000000007	1	5	147
5318	9.19999999999999929	11	5	50
5228	8.80000000000000071	13	5	142
5306	7	20	5	146
5229	11.8000000000000007	3	6	142
5271	11.6999999999999993	4	6	145
5379	9.90000000000000036	11	6	150
5307	8.69999999999999929	14	6	146
5319	7	20	6	50
5279	9.5	4	2	98
5280	9.09999999999999964	4	3	98
5281	7.79999999999999982	3	4	98
5282	10.6999999999999993	3	5	98
5260	8.69999999999999929	19	1	52
5264	11.9000000000000004	2	5	52
5265	9.90000000000000036	10	6	52
4234	11.5	1	1	4
4474	11.1999999999999993	2	1	127
5164	10.4000000000000004	5	1	255
4756	10.3000000000000007	6	1	161
4096	10	7	1	251
4726	9.59999999999999964	9	1	231
4444	9.5	10	1	230
4126	9.09999999999999964	11	1	193
4150	8.19999999999999929	12	1	227
5464	10.1999999999999993	12	1	82
3880	7.90000000000000036	13	1	107
5176	7	18	1	191
5165	11.6999999999999993	1	2	255
4181	11.5999999999999996	2	2	253
3881	11.5999999999999996	3	2	107
5111	11.5999999999999996	4	2	195
5177	11.5	5	2	191
4445	11.5	6	2	230
4109	11.3000000000000007	7	2	197
4235	11.1999999999999993	8	2	4
4439	11	9	2	162
4727	10.4000000000000004	10	2	231
4097	10.0999999999999996	11	2	251
3659	9.40000000000000036	13	2	170
4769	9.30000000000000071	14	2	283
4151	8.80000000000000071	15	2	227
4475	8.69999999999999929	16	2	127
4757	7.5	17	2	161
4127	7.09999999999999964	18	2	193
4770	11.8000000000000007	1	3	283
4182	11.5	2	3	253
5178	10.9000000000000004	3	3	191
4728	10.6999999999999993	4	3	231
3660	10.5999999999999996	5	3	170
4758	10.5	6	3	161
4476	9.90000000000000036	7	3	127
3882	9.80000000000000071	8	3	107
4128	9.30000000000000071	9	3	193
4446	8.90000000000000036	10	3	230
4110	8.69999999999999929	11	3	197
4440	8.59999999999999964	12	3	162
4236	7.59999999999999964	13	3	4
5166	7.59999999999999964	14	3	255
4098	7.59999999999999964	15	3	251
3996	7.5	16	3	184
5112	7.20000000000000018	17	3	195
4152	7.09999999999999964	18	3	227
3997	11.8000000000000007	1	4	184
4441	11.4000000000000004	2	4	162
3883	11.1999999999999993	3	4	107
4183	11	4	4	253
4153	10.8000000000000007	5	4	227
4111	10.6999999999999993	6	4	197
5180	11.3000000000000007	1	5	191
4477	9.80000000000000071	7	4	127
3661	9.5	8	4	170
5113	9	9	4	195
4771	8.90000000000000036	10	4	283
5179	8.80000000000000071	11	4	191
4129	8.19999999999999929	12	4	193
4099	7.90000000000000036	13	4	251
4237	7.79999999999999982	14	4	4
4729	7.5	15	4	231
3662	7.90000000000000036	15	5	170
4447	7.5	16	4	230
3998	9.30000000000000071	7	5	184
5167	7.20000000000000018	17	4	255
4759	7	18	4	161
4772	10.5999999999999996	3	5	283
4731	11.9000000000000004	2	6	231
4448	9.19999999999999929	8	5	230
3884	8.80000000000000071	9	5	107
4154	8.80000000000000071	10	5	227
5114	8.69999999999999929	11	5	195
3999	11.5999999999999996	3	6	184
5115	7.40000000000000036	15	6	195
4443	9	9	6	162
4479	7	18	6	127
4112	8.30000000000000071	12	5	197
4100	8.30000000000000071	13	5	251
4238	8	14	5	4
4185	11.9000000000000004	1	6	253
4449	8.90000000000000036	11	6	230
3885	11	4	6	107
4155	10.4000000000000004	6	6	227
4239	9.90000000000000036	7	6	4
4113	9.19999999999999929	8	6	197
4131	9	10	6	193
4101	8.69999999999999929	12	6	251
5181	7.79999999999999982	13	6	191
5169	7.5	14	6	255
4773	7.29999999999999982	16	6	283
4761	7.09999999999999964	17	6	161
5434	10.5999999999999996	7	1	71
5459	9.69999999999999929	11	2	90
5435	7.79999999999999982	17	2	71
5460	9.69999999999999929	12	3	90
5436	7.09999999999999964	24	3	71
5437	10.9000000000000004	6	4	71
5461	10.6999999999999993	7	4	90
5405	10.4000000000000004	3	2	182
5442	8.80000000000000071	19	3	233
4760	7.40000000000000036	17	5	161
4908	7.5	26	3	136
5349	10.6999999999999993	11	6	196
5277	7.70000000000000018	24	6	249
3805	11.9000000000000004	1	4	2
5413	11	6	4	70
5384	11.3000000000000007	7	5	232
3697	10.1999999999999993	9	4	250
4184	7.29999999999999982	18	5	253
5276	7.29999999999999982	27	5	249
4909	9.5	13	4	136
5383	7.90000000000000036	21	4	232
5422	11.6999999999999993	3	1	151
4450	9.80000000000000071	17	1	163
5445	7	28	6	233
5347	7.90000000000000036	22	4	196
5023	7.40000000000000036	25	4	83
5425	7.20000000000000018	27	4	151
5168	11	2	5	255
4261	9.90000000000000036	2	4	228
5468	11.5999999999999996	4	5	82
5021	11.5999999999999996	3	2	83
4702	11.5999999999999996	4	1	124
3807	11.5	5	6	2
5272	9.59999999999999964	18	1	249
3699	7.70000000000000018	25	6	250
4228	11	8	1	252
3806	10.1999999999999993	13	5	2
5344	9	23	1	196
5410	11.5	5	1	70
5415	11.6999999999999993	1	6	70
5470	11	9	1	254
5381	9.40000000000000036	11	2	232
3713	9.09999999999999964	13	2	103
5443	9.69999999999999929	10	4	233
4229	8.80000000000000071	16	2	252
5423	8.5	19	2	151
3717	11.6999999999999993	2	6	103
3712	9.19999999999999929	19	1	103
5440	10.3000000000000007	11	1	233
3741	10.9000000000000004	8	6	226
3737	8.5	20	2	226
4906	11.9000000000000004	2	1	136
4907	7	28	2	136
4114	10.1999999999999993	13	1	198
4668	11.9000000000000004	1	3	85
5472	10.1999999999999993	11	3	254
3663	10.5	5	6	170
5274	10	12	3	249
5424	8.59999999999999964	20	3	151
3714	8.19999999999999929	22	3	103
3922	9.09999999999999964	20	1	110
5412	11.8000000000000007	2	3	70
3715	9.40000000000000036	14	4	103
5022	11.6999999999999993	4	3	83
4666	8.90000000000000036	24	1	85
5444	10.9000000000000004	9	5	233
3716	8.69999999999999929	19	5	103
3740	8.09999999999999964	23	5	226
3804	11.5	5	3	2
5466	11.0999999999999996	6	3	82
4442	10.4000000000000004	4	5	162
4130	9.69999999999999929	5	5	193
5348	7.90000000000000036	24	5	196
4911	10.9000000000000004	9	6	136
4910	9.90000000000000036	15	5	136
5134	7.40000000000000036	27	1	172
4669	11.0999999999999996	4	4	85
3738	9.90000000000000036	13	3	226
4670	11.5999999999999996	5	5	85
5469	10.8000000000000007	10	6	82
5273	11.9000000000000004	2	2	249
3803	10.8000000000000007	5	2	2
4318	11.0999999999999996	4	1	87
5427	9.59999999999999964	15	6	151
5345	10.5999999999999996	7	2	196
5385	9.40000000000000036	17	6	232
5411	8	22	2	70
5441	9.5	10	2	233
5471	8.80000000000000071	17	2	254
5465	7.5	24	2	82
5426	11.5	6	5	151
5382	11.8000000000000007	3	3	232
3696	10.3000000000000007	10	3	250
5346	9.80000000000000071	14	3	196
3762	7.70000000000000018	25	3	104
5475	9.19999999999999929	18	6	254
4478	9.5	6	5	127
5275	11.0999999999999996	5	4	249
3698	9.90000000000000036	16	5	250
4671	7.40000000000000036	26	6	85
3739	9.59999999999999964	11	4	226
3764	10.8000000000000007	10	5	104
3763	8.80000000000000071	18	4	104
5473	8.69999999999999929	19	4	254
5467	7.20000000000000018	26	4	82
4730	7.90000000000000036	16	5	231
5414	10.5999999999999996	12	5	70
5024	9.30000000000000071	17	5	83
5474	7.59999999999999964	25	5	254
5025	11.5999999999999996	4	6	83
3765	7.09999999999999964	27	6	104
4258	10.6999999999999993	2	1	228
5462	9	14	5	90
5428	8	15	1	92
5438	10.6999999999999993	4	5	71
4324	9.19999999999999929	16	1	88
5458	11.6999999999999993	1	1	90
4282	10.9000000000000004	8	1	10
3850	7	24	1	291
5433	9.80000000000000071	9	6	92
3852	9.30000000000000071	13	3	291
5432	11.3000000000000007	4	5	92
5439	11.5999999999999996	2	6	71
5430	10.8000000000000007	5	3	92
5431	11.9000000000000004	1	4	92
4912	11.9000000000000004	1	1	203
4414	10.9000000000000004	7	1	43
4762	8.40000000000000036	20	1	284
4294	8.09999999999999964	21	1	119
4780	8	22	1	73
4558	7.79999999999999982	23	1	293
4325	8.40000000000000036	17	2	88
4284	10	8	3	10
4362	7	25	3	11
4753	11.8000000000000007	1	4	217
4844	8.59999999999999964	18	5	220
4864	10.9000000000000004	6	1	295
4876	10.4000000000000004	8	1	236
3990	8.09999999999999964	16	3	7
3989	8.40000000000000036	16	2	7
4603	8.5	13	4	13
5040	9.30000000000000071	3	3	66
4640	10.6999999999999993	7	5	202
4198	11.0999999999999996	2	1	158
4211	9.59999999999999964	10	2	155
4717	7.29999999999999982	7	4	261
4578	9.90000000000000036	3	3	299
4138	8.69999999999999929	15	1	216
4852	8	17	1	286
4804	8.69999999999999929	10	1	285
4637	11.1999999999999993	3	2	202
4823	11.0999999999999996	4	2	174
5429	10.9000000000000004	5	2	92
5033	10.6999999999999993	6	2	289
4805	8.90000000000000036	12	2	285
4601	8.40000000000000036	14	2	13
4547	8.40000000000000036	15	2	292
4883	7.70000000000000018	21	2	237
4602	11	3	3	13
4884	10.6999999999999993	6	3	237
4486	10.3000000000000007	10	1	84
4528	9.59999999999999964	14	1	72
4858	8.59999999999999964	18	1	287
4840	7.5	25	1	220
4915	8.80000000000000071	20	4	203
4179	11.0999999999999996	5	6	259
5043	7.09999999999999964	7	6	66
4490	8.30000000000000071	22	5	84
4491	10	11	6	84
4300	7.09999999999999964	22	1	120
5212	7	23	1	238
4649	8.59999999999999964	15	2	260
4662	10.5999999999999996	5	3	235
4142	9.69999999999999929	8	5	216
4880	9.40000000000000036	12	5	236
4546	7.90000000000000036	17	1	292
4713	9.19999999999999929	15	6	39
4287	8.09999999999999964	20	6	10
4522	10.1999999999999993	10	1	40
4372	10	11	1	123
4930	9.59999999999999964	13	1	288
4991	11.5	2	2	262
3835	10.1999999999999993	11	4	200
3853	10	12	4	291
3895	9.69999999999999929	17	4	109
4994	8.30000000000000071	17	5	262
4652	8	20	5	260
5216	7	23	5	238
3837	11.4000000000000004	5	6	200
4665	9.40000000000000036	13	6	235
5463	9.19999999999999929	14	6	90
4822	11.3000000000000007	1	1	174
5032	7.79999999999999982	18	1	289
4215	11.5	3	6	155
4827	10.1999999999999993	7	6	174
3993	9.59999999999999964	11	6	7
4641	8.59999999999999964	14	6	202
4900	11.0999999999999996	3	1	135
4456	10.5999999999999996	5	1	74
3796	9.19999999999999929	10	1	178
3724	8.40000000000000036	11	1	176
4402	8.19999999999999929	12	1	205
4290	11.4000000000000004	3	3	118
5406	10.0999999999999996	7	3	182
5407	9.09999999999999964	8	4	182
5209	7.70000000000000018	11	4	179
5191	7.59999999999999964	12	4	296
3943	7.5	13	4	112
5294	9.90000000000000036	2	5	181
5408	8.09999999999999964	8	5	182
5409	11	2	6	182
3789	9.30000000000000071	8	6	239
3826	11.8000000000000007	3	1	281
3688	10.5999999999999996	5	1	78
4894	10.0999999999999996	6	1	134
4552	9.69999999999999929	8	1	76
4468	9.30000000000000071	11	1	240
4564	7.59999999999999964	14	1	48
3979	9.80000000000000071	7	4	113
3889	9.69999999999999929	8	4	108
4837	9.59999999999999964	9	4	93
4723	9.5	10	4	47
4849	9.5	11	4	18
5335	8.80000000000000071	14	4	19
4081	8.80000000000000071	15	4	279
3931	8.09999999999999964	17	4	111
3830	7	18	5	281
5121	8.69999999999999929	16	6	141
4984	10.3000000000000007	4	1	60
4426	9.80000000000000071	6	1	266
4408	8.90000000000000036	7	1	280
4624	7.09999999999999964	10	1	46
4332	8.90000000000000036	5	3	298
4962	8.40000000000000036	8	3	94
3973	10.6999999999999993	4	4	77
3860	10.6999999999999993	6	5	16
5067	10.5999999999999996	3	6	241
4354	11.3000000000000007	3	1	297
3778	8.40000000000000036	8	1	177
4968	11.6999999999999993	1	3	95
4344	11.6999999999999993	2	3	17
4063	10.3000000000000007	3	4	58
5311	10.1999999999999993	4	4	154
5323	8.69999999999999929	7	4	265
5079	11.1999999999999993	2	6	153
5055	8.19999999999999929	7	6	152
4007	8.5	3	2	302
4011	7	3	6	302
4540	10.1999999999999993	3	1	242
4543	10.6999999999999993	3	4	242
4036	9.09999999999999964	3	1	301
4013	9.09999999999999964	3	2	42
4016	7.29999999999999982	3	5	42
5392	7.20000000000000018	3	1	269
5395	8.80000000000000071	3	4	269
5187	10	8	6	221
5163	9.80000000000000071	9	6	206
5157	10.0999999999999996	5	6	207
4672	9.40000000000000036	5	1	22
4504	8.5	10	1	81
4462	8.09999999999999964	11	1	21
4924	7.79999999999999982	13	1	79
4157	9.19999999999999929	9	2	116
4194	10	5	3	304
4254	9.40000000000000036	8	3	268
5232	9.30000000000000071	9	3	143
4795	8.19999999999999929	12	4	23
4059	11.1999999999999993	5	6	80
3687	9.80000000000000071	10	6	208
5061	8.80000000000000071	12	6	140
4612	9	5	1	267
4396	8.90000000000000036	6	1	305
4188	9.80000000000000071	5	3	303
4801	9	6	4	306
4125	7.20000000000000018	7	6	307
5266	10.3000000000000007	7	1	145
4888	9.59999999999999964	9	1	133
4384	7.40000000000000036	16	1	125
4085	7.90000000000000036	16	2	97
5339	7.79999999999999982	17	2	147
3702	11.5	2	3	102
3984	10.5	5	3	211
5202	10.3000000000000007	7	3	26
3876	9.09999999999999964	12	3	106
4224	8.19999999999999929	15	3	25
4248	7.90000000000000036	17	3	117
4819	11.5	3	4	212
5305	11.4000000000000004	4	4	146
4105	10.3000000000000007	9	4	51
3703	9.80000000000000071	12	4	102
5378	10.3000000000000007	5	5	150
4106	10.0999999999999996	7	5	51
3704	8.40000000000000036	14	5	102
4107	11.5999999999999996	5	6	51
5343	10.9000000000000004	8	6	147
3771	9.69999999999999929	12	6	300
3705	7.20000000000000018	18	6	102
5278	9.19999999999999929	4	1	98
5088	10.8000000000000007	2	3	278
3840	9.30000000000000071	3	3	209
5283	11.8000000000000007	1	6	98
4030	11.9000000000000004	1	1	315
5008	11.4000000000000004	5	1	312
3706	10.9000000000000004	7	1	270
4066	10.4000000000000004	11	1	61
5446	9.69999999999999929	14	1	32
5368	7.79999999999999982	22	1	53
4048	7.59999999999999964	23	1	114
4205	11.5	3	2	27
4067	10.4000000000000004	5	2	61
3707	9	13	2	270
5447	8.30000000000000071	15	2	32
4031	7.90000000000000036	18	2	315
4049	7.29999999999999982	19	2	114
3906	11.6999999999999993	2	3	99
4266	11.4000000000000004	3	3	313
4206	11	4	3	27
4680	10.4000000000000004	6	3	130
4032	10.1999999999999993	8	3	315
5370	9.90000000000000036	10	3	53
4590	9.59999999999999964	11	3	311
5262	9.5	12	3	52
4392	9	16	3	126
4692	8.69999999999999929	20	3	316
5448	8.59999999999999964	21	3	32
3708	7	23	3	270
4393	11.0999999999999996	3	4	126
4033	10.4000000000000004	8	4	315
4051	10	11	4	114
4207	9.90000000000000036	12	4	27
4267	9.19999999999999929	17	4	313
4069	9.09999999999999964	18	4	61
4747	8.59999999999999964	19	4	314
4268	11.9000000000000004	1	5	313
4208	10.6999999999999993	7	5	27
5372	10.3000000000000007	9	5	53
5450	9.5	13	5	32
4034	9.30000000000000071	15	5	315
4394	8.90000000000000036	18	5	126
5085	11.1999999999999993	3	6	310
4053	11.1999999999999993	4	6	114
4209	10.1999999999999993	7	6	27
5451	9.69999999999999929	11	6	32
4395	9.40000000000000036	13	6	126
4269	9.19999999999999929	15	6	313
4071	7.59999999999999964	18	6	61
4828	11.4000000000000004	1	1	29
5236	11.4000000000000004	2	1	31
3790	11.1999999999999993	3	1	318
4216	9.30000000000000071	4	1	28
4996	7.5	6	1	30
4217	11.6999999999999993	1	2	28
3731	10.0999999999999996	2	2	317
5237	10	3	2	31
4829	8.30000000000000071	6	2	29
4830	11.9000000000000004	1	3	29
3732	11.6999999999999993	2	3	317
3792	8.90000000000000036	4	3	318
4218	8.30000000000000071	6	3	28
3793	11.8000000000000007	1	4	318
4219	10.5999999999999996	2	4	28
5239	9.80000000000000071	3	4	31
4831	7.59999999999999964	5	4	29
3734	11.8000000000000007	1	5	317
4832	11.1999999999999993	2	5	29
4220	8.59999999999999964	3	5	28
3794	8.40000000000000036	5	5	318
4221	10.8000000000000007	1	6	28
3795	9.59999999999999964	3	6	318
5241	9.09999999999999964	4	6	31
4833	7.5	6	6	29
3868	10.5999999999999996	3	1	243
4619	11.0999999999999996	3	2	244
4622	10.5	3	5	244
3742	9.69999999999999929	3	1	276
4144	8.80000000000000071	3	1	247
3946	10.8000000000000007	8	1	274
5140	8.90000000000000036	17	1	271
4936	8.30000000000000071	20	1	273
5093	11.1999999999999993	4	2	246
5141	10.1999999999999993	7	2	271
3947	7.20000000000000018	20	2	274
5070	10.8000000000000007	5	3	245
3948	10.0999999999999996	9	3	274
5094	9	17	3	246
3900	8.80000000000000071	19	3	272
5143	11.3000000000000007	2	4	271
5071	10.5999999999999996	6	4	245
5095	10.5	7	4	246
3709	7.59999999999999964	23	4	270
5072	11.8000000000000007	3	5	245
5144	11.1999999999999993	6	5	271
3902	9.90000000000000036	10	5	272
3950	9.40000000000000036	14	5	274
5096	7	23	5	246
5073	11.6999999999999993	1	6	245
5145	11.0999999999999996	5	6	271
3711	9.30000000000000071	14	6	270
3903	8.40000000000000036	16	6	272
5097	7.59999999999999964	21	6	246
3934	11.9000000000000004	1	1	275
5248	10.5	3	1	54
4516	10.5	4	1	35
5098	10.0999999999999996	5	1	277
4948	8.80000000000000071	7	1	55
5026	7.90000000000000036	9	1	138
5386	7.40000000000000036	10	1	100
4570	7.40000000000000036	11	1	223
5362	7.20000000000000018	12	1	215
5099	10.5	3	2	277
4571	10.4000000000000004	4	2	223
3935	10.0999999999999996	5	2	275
4481	9.59999999999999964	6	2	128
4775	9.30000000000000071	8	2	37
5363	8.5	9	2	215
5249	8.09999999999999964	10	2	54
5027	7.20000000000000018	11	2	138
5250	11.5	1	3	54
5028	11.1999999999999993	2	3	138
5100	10.1999999999999993	4	3	277
5388	10	5	3	100
5364	8.40000000000000036	7	3	215
4518	7.90000000000000036	8	3	35
3936	7.5	9	3	275
4950	7.29999999999999982	10	3	55
4482	7.09999999999999964	12	3	128
5251	11.4000000000000004	1	4	54
5389	11	2	4	100
4519	10.8000000000000007	3	4	35
4951	10.4000000000000004	5	4	55
5365	10.0999999999999996	6	4	215
4483	9.09999999999999964	7	4	128
3937	8.5	8	4	275
5101	8.09999999999999964	10	4	277
4777	8	11	4	37
5029	7.20000000000000018	12	4	138
5366	11.9000000000000004	1	5	215
5252	10.8000000000000007	3	5	54
5102	10.0999999999999996	4	5	277
4598	10	5	5	36
4484	9.90000000000000036	6	5	128
3938	8.80000000000000071	8	5	275
5390	8.19999999999999929	9	5	100
4952	8.19999999999999929	10	5	55
4520	8	11	5	35
4599	11.8000000000000007	1	6	36
4953	11.4000000000000004	2	6	55
5253	10.9000000000000004	3	6	54
5391	9.59999999999999964	4	6	100
5103	9.5	6	6	277
5367	9.09999999999999964	7	6	215
4575	9	8	6	223
5031	8.80000000000000071	9	6	138
4779	8.09999999999999964	11	6	37
4521	7.59999999999999964	12	6	35
4654	11.6999999999999993	1	1	224
3844	11.1999999999999993	2	1	213
4420	9.40000000000000036	5	1	34
4972	9.19999999999999929	6	1	214
4738	8.90000000000000036	7	1	225
4942	8.19999999999999929	8	1	38
3911	11.9000000000000004	1	2	101
4421	11.3000000000000007	2	2	34
4277	11.0999999999999996	3	2	33
4943	10.9000000000000004	4	2	38
4655	10.3000000000000007	6	2	224
3845	10.1999999999999993	7	2	213
4973	7.70000000000000018	8	2	214
4739	7.09999999999999964	9	2	225
4278	10.6999999999999993	2	3	33
4974	10.5	3	3	214
3846	10.4000000000000004	4	3	213
4632	10.4000000000000004	5	3	248
3912	8.19999999999999929	7	3	101
4740	8.09999999999999964	8	3	225
4656	8	9	3	224
4633	11.3000000000000007	1	4	248
4945	11.0999999999999996	3	4	38
3847	10.3000000000000007	4	4	213
4741	9.69999999999999929	5	4	225
4279	8.80000000000000071	6	4	33
4657	8.5	8	4	224
4975	7.70000000000000018	9	4	214
4946	11.9000000000000004	1	5	38
4634	11.9000000000000004	2	5	248
3848	11.4000000000000004	4	5	213
4658	9.90000000000000036	5	5	224
4976	9.69999999999999929	6	5	214
4424	9.59999999999999964	7	5	34
4281	11.9000000000000004	1	6	33
3915	11.5999999999999996	2	6	101
4977	11.0999999999999996	3	6	214
4947	10.5	4	6	38
3849	9.19999999999999929	7	6	213
4659	8.5	8	6	224
4425	7.79999999999999982	9	6	34
4742	7	9	5	225
4743	9.80000000000000071	5	6	225
4811	8.59999999999999964	16	2	65
4954	9.90000000000000036	15	1	190
3652	9.69999999999999929	16	1	192
5417	10.3000000000000007	5	2	185
4955	9.80000000000000071	6	2	190
3653	9.80000000000000071	7	2	192
5003	8.19999999999999929	17	2	69
5453	7.90000000000000036	18	2	199
4074	10.0999999999999996	6	3	64
5418	10.0999999999999996	7	3	185
4608	10	8	3	189
5172	8	17	3	256
4434	7.90000000000000036	18	3	194
3756	7.79999999999999982	19	3	282
4609	10	7	4	189
3654	9.40000000000000036	9	3	192
4585	9.80000000000000071	8	4	188
4957	9.69999999999999929	9	4	190
3961	9.5	10	4	63
3757	9.30000000000000071	11	4	282
5419	8.5	12	4	185
4270	11.6999999999999993	4	1	187
4810	11.6999999999999993	5	1	65
5452	9.30000000000000071	17	1	199
4584	7	20	3	188
4044	\N	21	3	86
4873	11.5	1	4	186
4339	10.5	2	4	159
4645	10.5	3	4	160
4273	10.4000000000000004	4	4	187
4075	10.3000000000000007	5	4	64
4495	10.1999999999999993	6	4	171
4981	8.30000000000000071	13	4	89
4699	8.30000000000000071	14	4	68
4435	8	15	4	194
3655	8	16	4	192
5173	7.59999999999999964	18	4	256
5455	7.5	19	4	199
4813	7.20000000000000018	20	4	65
4045	\N	21	4	86
4340	11.5	1	5	159
4814	11.4000000000000004	2	5	65
4076	11.1999999999999993	3	5	64
5420	11	4	5	185
5456	11	5	5	199
4874	10.8000000000000007	6	5	186
4496	10.8000000000000007	7	5	171
4610	10.8000000000000007	8	5	189
4436	10.5	9	5	194
4700	10.1999999999999993	10	5	68
4274	10	11	5	187
4586	9.90000000000000036	12	5	188
4958	9.80000000000000071	13	5	190
5174	9.69999999999999929	14	5	256
4982	9.30000000000000071	15	5	89
4646	9.30000000000000071	16	5	160
3962	9.19999999999999929	17	5	63
5006	8.90000000000000036	18	5	69
3758	8.80000000000000071	19	5	282
3656	8.69999999999999929	20	5	192
4046	\N	21	5	86
4497	11.9000000000000004	1	6	171
4073	9.5	8	2	64
4978	12	1	1	89
4042	12	2	1	86
4606	11.9000000000000004	3	1	189
4582	11.6999999999999993	6	1	188
4642	11.5999999999999996	7	1	160
4336	11.3000000000000007	8	1	159
4870	11.1999999999999993	9	1	186
5002	11	10	1	69
4696	10.8000000000000007	11	1	68
4492	10.5999999999999996	12	1	171
5171	9.5	9	2	256
3958	10.4000000000000004	13	1	63
3754	8.5	18	1	282
5416	7.70000000000000018	19	1	185
5170	7.5	20	1	256
4072	7.20000000000000018	21	1	64
4493	10.9000000000000004	1	2	171
4271	10.9000000000000004	2	2	187
4433	10.8000000000000007	3	2	194
4337	9.40000000000000036	10	2	159
4979	10.3000000000000007	4	2	89
4607	9.40000000000000036	11	2	189
4432	10.1999999999999993	14	1	194
4697	9.30000000000000071	12	2	68
4871	9.19999999999999929	13	2	186
4643	8.80000000000000071	14	2	160
3959	8.69999999999999929	15	2	63
4583	7.79999999999999982	19	2	188
3755	7.09999999999999964	20	2	282
4812	9.30000000000000071	10	3	65
4043	\N	21	2	86
4980	11.9000000000000004	1	3	89
4338	11.8000000000000007	2	3	159
4872	11.5999999999999996	3	3	186
5004	11.1999999999999993	4	3	69
4644	9.09999999999999964	11	3	160
4272	8.80000000000000071	12	3	187
4956	8.59999999999999964	13	3	190
4494	8.30000000000000071	14	3	171
3960	10.5	5	3	63
5005	7.79999999999999982	17	4	69
5454	8.30000000000000071	15	3	199
4698	8.19999999999999929	16	3	68
4647	11	7	6	160
4983	10.5	8	6	89
4077	10.1999999999999993	9	6	64
5421	10	10	6	185
4701	9.40000000000000036	11	6	68
5457	9.40000000000000036	12	6	199
4611	9.30000000000000071	13	6	189
4587	8.59999999999999964	14	6	188
4275	8.5	15	6	187
4437	8.40000000000000036	16	6	194
3963	8.09999999999999964	17	6	63
4959	8.09999999999999964	18	6	190
3657	7.29999999999999982	19	6	192
4341	7	20	6	159
4047	\N	21	6	86
4815	11.8000000000000007	2	6	65
5007	11.6999999999999993	3	6	69
3759	11.3000000000000007	4	6	282
4875	11.1999999999999993	5	6	186
5175	11.1999999999999993	6	6	256
\.


--
-- Name: competition_athleteevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_athleteevent_id_seq', 5475, true);


--
-- Data for Name: competition_division; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_division (id, name, min_age, max_age, level_id, meet_id, short_name) FROM stdin;
1	6-7	6	7	8	1	
2	8	8	8	8	1	
3	9 and up	9	18	8	1	
4	7-8	7	8	9	1	
5	9	9	9	9	1	
6	10-11	10	11	9	1	
7	12 and up	12	18	9	1	
8	8-9	8	9	3	1	
9	10	10	10	3	1	
10	11	11	11	3	1	
11	12 and up	12	18	3	1	
12	9-11	9	11	4	1	
13	12 and up	12	18	4	1	
14	11-12	11	12	5	1	
15	13-16	13	16	5	1	
16	13-14	13	14	6	1	
17	15-18	15	18	6	1	
18	15-16	15	16	7	1	
19	17-18	17	18	7	1	
\.


--
-- Name: competition_division_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_division_id_seq', 19, true);


--
-- Data for Name: competition_event; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_event (id, "order", name, initials, meet_id, sign_id) FROM stdin;
1	1	Floor	fe	1	1
4	4	Vault	vt	1	4
5	5	Parallel Bars	pb	1	5
6	6	High Bar	hb	1	6
3	2	Pommel Horse	ph	1	3
2	3	Rings	sr	1	2
\.


--
-- Name: competition_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_event_id_seq', 6, true);


--
-- Data for Name: competition_ledshow; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_ledshow (id, name) FROM stdin;
1	Welcome
\.


--
-- Name: competition_ledshow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_ledshow_id_seq', 2, true);


--
-- Data for Name: competition_ledshowmessage; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_ledshowmessage (id, message, led_show_id, led_sign_id) FROM stdin;
1	Welcome	1	6
2	Welcome	1	5
3	Welcome	1	4
\.


--
-- Name: competition_ledshowmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_ledshowmessage_id_seq', 9, true);


--
-- Data for Name: competition_ledsign; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_ledsign (id, device, name) FROM stdin;
6	lmn	Floor Sign
5	ijk	Pommel Sign
4	ghi	Rings Sign
3	efg	Vault Sign
2	def	Parallel Bars Sign
1	abc	High Bar Sign
\.


--
-- Name: competition_ledsign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_ledsign_id_seq', 6, true);


--
-- Data for Name: competition_session; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_session (id, name, meet_id) FROM stdin;
1	Session 1	1
2	Session 2	1
3	Session 3	1
4	Session 4	1
\.


--
-- Data for Name: competition_session_divisions; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_session_divisions (id, session_id, division_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	2	11
12	3	12
13	3	13
14	3	14
15	3	15
16	4	16
17	4	17
18	4	18
19	4	19
\.


--
-- Name: competition_session_divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_session_divisions_id_seq', 19, true);


--
-- Name: competition_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_session_id_seq', 4, true);


--
-- Data for Name: competition_teamaward; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_teamaward (id, name, award_percentage, meet_id, "order") FROM stdin;
1	Level 4	0.660000000000000031	1	0
\.


--
-- Data for Name: competition_teamaward_divisions; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_teamaward_divisions (id, teamaward_id, division_id) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Name: competition_teamaward_divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_teamaward_divisions_id_seq', 3, true);


--
-- Name: competition_teamaward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_teamaward_id_seq', 1, true);


--
-- Data for Name: competition_teamaward_levels; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_teamaward_levels (id, teamaward_id, level_id) FROM stdin;
1	1	8
\.


--
-- Name: competition_teamaward_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_teamaward_levels_id_seq', 1, true);


--
-- Data for Name: competition_teamawardrank; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY competition_teamawardrank (id, rank, score, team_id, team_award_id) FROM stdin;
10	10	177.900000000000006	11	1
11	11	177.5	1	1
12	12	174.900000000000006	4	1
1	1	202.800000000000011	7	1
2	2	194.799999999999955	17	1
3	3	191.299999999999983	6	1
4	4	189.600000000000023	9	1
5	5	188.399999999999977	16	1
6	6	186.099999999999966	5	1
7	7	185.900000000000006	13	1
8	8	183.5	12	1
9	9	183.400000000000006	14	1
\.


--
-- Name: competition_teamawardrank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('competition_teamawardrank_id_seq', 12, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2014-12-10 21:46:40.914518-05	1	1	1		7	1
2	2014-12-10 21:46:46.746319-05	1	Floor	1		8	1
3	2014-12-10 21:47:23.401634-05	1	Level 4 (7-8 year oldsyo)	1		10	1
4	2014-12-10 21:47:30.785879-05	1	Fairland	1		9	1
5	2014-12-10 21:48:45.788034-05	2	2	1		7	1
6	2014-12-10 21:48:50.554898-05	2	Rings	1		8	1
7	2014-12-10 21:49:57.942601-05	3	3	1		7	1
8	2014-12-10 21:50:00.168053-05	3	Pommel Horse	1		8	1
9	2014-12-10 21:50:35.151993-05	4	4	1		7	1
10	2014-12-10 21:50:37.243137-05	4	Vault	1		8	1
11	2014-12-10 21:51:13.394959-05	5	5	1		7	1
12	2014-12-10 21:51:18.226311-05	5	Parallel Bars	1		8	1
13	2014-12-10 21:51:42.750552-05	6	6	1		7	1
14	2014-12-10 21:51:45.76609-05	6	High Bar	1		8	1
15	2014-12-10 21:52:11.913014-05	2	Level 4 (6 year oldsyo)	1		10	1
16	2014-12-10 21:52:22.50485-05	3	Level 4 (9 and upyo)	1		10	1
17	2014-12-10 21:52:37.891996-05	4	Level 5 (7-8 year oldsyo)	1		10	1
18	2014-12-10 21:52:47.392061-05	5	Level 5 (9 year oldsyo)	1		10	1
19	2014-12-10 21:52:54.873383-05	6	Level 5 (10 and upyo)	1		10	1
20	2014-12-10 21:54:00.308971-05	2	Sportsplex	1		9	1
21	2014-12-10 21:54:19.618389-05	5	Level 5 (9yo)	2	Changed age_group.	10	1
22	2014-12-10 21:54:27.375733-05	6	Level 5 (10+yo)	2	Changed age_group.	10	1
23	2014-12-10 21:54:35.203774-05	4	Level 5 (7-8yo)	2	Changed age_group.	10	1
24	2014-12-10 21:54:41.99694-05	3	Level 4 (9+yo)	2	Changed age_group.	10	1
25	2014-12-10 21:54:48.969675-05	2	Level 4 (6yo)	2	Changed age_group.	10	1
26	2014-12-10 21:54:55.832687-05	1	Level 4 (7-8yo)	2	Changed age_group.	10	1
27	2014-12-10 21:55:23.915078-05	6	Level 5 (10+ yo)	2	Changed age_group.	10	1
28	2014-12-10 21:55:29.905622-05	2	Level 4 (6 yo)	2	Changed age_group.	10	1
29	2014-12-10 21:55:48.872706-05	1	Level 4 (7-8 yo)	2	Changed age_group.	10	1
30	2014-12-10 21:55:54.592201-05	3	Level 4 (9+ yo)	2	Changed age_group.	10	1
31	2014-12-10 21:56:01.358919-05	4	Level 5 (7-8 yo)	2	Changed age_group.	10	1
32	2014-12-10 21:56:39.594088-05	1	Fairland	2	Added athlete "102 Hall, Finn (Fairland)".	9	1
33	2014-12-10 22:51:08.905066-05	7	Floor	3		8	1
34	2014-12-10 22:51:37.198813-05	7	7	3		7	1
35	2014-12-10 22:57:12.810344-05	24	Level 4 (8 years)	3		10	1
36	2014-12-10 22:57:12.815859-05	23	Level 4 (6-7 years)	3		10	1
37	2014-12-10 22:57:12.817686-05	22	Level 4 (9-Up years)	3		10	1
38	2014-12-10 22:57:12.81927-05	3	Level 4 (9+  years)	3		10	1
39	2014-12-10 22:57:12.82086-05	2	Level 4 (6  years)	3		10	1
40	2014-12-10 22:57:12.822348-05	1	Level 4 (7-8  years)	3		10	1
41	2014-12-10 22:57:12.823816-05	9	Level 5 (12-Up years)	3		10	1
42	2014-12-10 22:57:12.82512-05	8	Level 5 (7-8 years)	3		10	1
43	2014-12-10 22:57:12.826578-05	7	Level 5 (10-11 years)	3		10	1
44	2014-12-10 22:57:12.827872-05	6	Level 5 (10+  years)	3		10	1
45	2014-12-10 22:57:12.829215-05	5	Level 5 (9 years)	3		10	1
46	2014-12-10 22:57:12.830539-05	4	Level 5 (7-8  years)	3		10	1
47	2014-12-10 22:57:12.83178-05	13	Level 6 (12-Up years)	3		10	1
48	2014-12-10 22:57:12.833065-05	12	Level 6 (8-9 years)	3		10	1
49	2014-12-10 22:57:12.834937-05	11	Level 6 (11 years)	3		10	1
50	2014-12-10 22:57:12.836318-05	10	Level 6 (10 years)	3		10	1
51	2014-12-10 22:57:12.837761-05	15	Level 7 (9-11 years)	3		10	1
52	2014-12-10 22:57:12.839191-05	14	Level 7 (12-Up years)	3		10	1
53	2014-12-10 22:57:12.840515-05	17	Level 8 (11-12 years)	3		10	1
54	2014-12-10 22:57:12.842317-05	16	Level 8 (13-16 years)	3		10	1
55	2014-12-10 22:57:12.844286-05	19	Level 9 (15-18 years)	3		10	1
56	2014-12-10 22:57:12.84591-05	18	Level 9 (13-14 years)	3		10	1
57	2014-12-10 22:57:12.847345-05	21	Level 10 (15-16 years)	3		10	1
58	2014-12-10 22:57:12.848904-05	20	Level 10 (17-18 years)	3		10	1
59	2014-12-10 23:01:19.737394-05	2	Sportsplex	3		9	1
60	2014-12-10 23:08:00.319483-05	40	Preston	2	Changed position for athlete "814 Egorov, Nicholai (Preston)". Changed position for athlete "815 Killian, Tyler (Preston)". Changed position for athlete "816 Killian, Cole (Preston)". Changed position for athlete "909 Kressman, Sam (Preston)". Changed position for athlete "910 Marsh, Christian (Preston)".	9	1
61	2014-12-10 23:11:15.443103-05	40	Preston	2	Changed position for athlete "813 Brown, IV (Preston)". Changed position for athlete "814 Egorov, Nicholai (Preston)".	9	1
63	2014-12-12 20:23:19.048117-05	2	Rings	2	Changed initials.	8	1
64	2014-12-12 20:23:24.333701-05	3	Pommel Horse	2	Changed initials.	8	1
65	2014-12-12 20:23:30.381734-05	4	Vault	2	Changed initials.	8	1
66	2014-12-12 20:23:36.796919-05	5	Parallel Bars	2	Changed initials.	8	1
67	2014-12-12 20:23:44.530724-05	6	High Bar	2	Changed initials.	8	1
68	2014-12-12 20:35:46.716496-05	1	Session 1	1		14	1
69	2014-12-12 20:51:18.690305-05	1	Floor	2	Changed initials.	8	1
70	2014-12-12 20:51:24.852493-05	2	Rings	2	Changed initials.	8	1
71	2014-12-12 20:51:30.673873-05	3	Pommel Horse	2	Changed initials.	8	1
72	2014-12-12 20:51:37.178091-05	4	Vault	2	Changed initials.	8	1
73	2014-12-12 20:51:47.580873-05	5	Parallel Bars	2	Changed initials.	8	1
74	2014-12-12 20:51:53.952661-05	6	High Bar	2	Changed initials.	8	1
75	2014-12-13 00:21:39.137138-05	1	Session 1	2	Changed groups.	14	1
76	2014-12-13 00:21:53.968394-05	2	Session 2	1		14	1
77	2014-12-13 00:22:06.351455-05	3	Session 3	1		14	1
78	2014-12-30 18:35:58.814981-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched.	11	1
79	2014-12-30 18:36:06.749206-05	2352	426 Alfaro, Santiago (Top Flight)	2	No fields changed.	11	1
80	2014-12-30 18:37:45.517575-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched.	11	1
81	2014-12-30 18:39:03.012796-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched.	11	1
82	2014-12-30 18:39:55.105497-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched.	11	1
83	2014-12-30 18:44:57.804353-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched.	11	1
84	2014-12-30 18:49:33.315551-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched. Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Floor - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Rings - 2.0". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Pommel Horse - None".	11	1
160	2015-07-27 17:09:12.658214-04	1	Test Team Gym ABC	2	Changed levels.	19	1
161	2015-07-27 17:09:53.024614-04	1	Test Team Gym ABC	2	Changed levels.	19	1
162	2015-07-27 17:12:24.162799-04	1	Test Team Gym ABC	2	Changed levels.	19	1
163	2015-07-27 17:14:07.28743-04	1	Test Team Gym ABC	2	Changed levels.	19	1
164	2015-07-27 17:14:24.53029-04	1	Test Team Gym ABC	2	No fields changed.	19	1
85	2014-12-30 18:56:24.812265-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched. Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Floor - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Pommel Horse - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Vault - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Parallel Bars - 10.9".	11	1
86	2014-12-30 18:57:26.269953-05	2352	426 Alfaro, Santiago (Top Flight)	2	No fields changed.	11	1
87	2014-12-30 18:57:50.928882-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Floor - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Pommel Horse - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Vault - None".	11	1
88	2014-12-30 18:58:27.64716-05	2352	426 Alfaro, Santiago (Top Flight)	2	No fields changed.	11	1
89	2014-12-30 18:59:59.597825-05	2352	426 Alfaro, Santiago (Top Flight)	2	Changed scratched. Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Floor - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Rings - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Pommel Horse - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Vault - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - Parallel Bars - None". Changed score for athlete event "426 Alfaro, Santiago (Top Flight) - High Bar - None".	11	1
90	2014-12-30 19:00:10.631524-05	2364	504 Allen, Evan (Docksiders)	2	Changed scratched.	11	1
91	2014-12-30 19:00:36.93831-05	2364	504 Allen, Evan (Docksiders)	2	Changed scratched. Changed score for athlete event "504 Allen, Evan (Docksiders) - Floor - None". Changed score for athlete event "504 Allen, Evan (Docksiders) - Rings - None". Changed score for athlete event "504 Allen, Evan (Docksiders) - Pommel Horse - None". Changed score for athlete event "504 Allen, Evan (Docksiders) - Vault - None". Changed score for athlete event "504 Allen, Evan (Docksiders) - Parallel Bars - None". Changed score for athlete event "504 Allen, Evan (Docksiders) - High Bar - None".	11	1
92	2014-12-30 19:11:10.153858-05	1	Session 1	2	Changed groups.	14	1
93	2014-12-30 19:11:22.578038-05	2	Session 2	2	Changed groups.	14	1
94	2014-12-30 19:11:30.563919-05	3	Session 3	2	Changed groups.	14	1
95	2014-12-30 19:43:58.502402-05	1	Session 1	2	Changed groups.	14	1
96	2014-12-30 19:44:18.717256-05	2	Session 2	2	Changed groups.	14	1
97	2014-12-30 19:44:29.263104-05	3	Session 3	2	Changed groups.	14	1
98	2014-12-31 19:47:37.798509-05	1	Session 1	2	Changed groups.	14	1
99	2014-12-31 19:48:14.156352-05	2	Session 2	2	Changed groups.	14	1
100	2014-12-31 19:48:23.069517-05	3	Session 3	2	Changed groups.	14	1
102	2015-03-13 22:17:13.608121-04	1	Session 1	3		14	1
103	2015-03-13 22:17:13.629414-04	2	Session 2	3		14	1
104	2015-03-13 22:17:13.631456-04	3	Session 3	3		14	1
105	2015-03-13 22:17:34.392524-04	266	Level 4 (6 years)	3		10	1
106	2015-03-13 22:17:34.400288-04	267	Level 4 (7-8 years)	3		10	1
107	2015-03-13 22:17:34.402002-04	265	Level 4 (9-10 years)	3		10	1
108	2015-03-13 22:17:34.403523-04	268	Level 4 (11& U years)	3		10	1
109	2015-03-13 22:17:34.405647-04	264	Level 5 (7-8 years)	3		10	1
110	2015-03-13 22:17:34.407585-04	262	Level 5 (9-10 years)	3		10	1
111	2015-03-13 22:17:34.409187-04	263	Level 5 (11&UP years)	3		10	1
112	2015-03-13 22:17:34.410472-04	261	Level 6 (7-8 years)	3		10	1
113	2015-03-13 22:17:34.411706-04	257	Level 6 (9-10 years)	3		10	1
114	2015-03-13 22:17:34.412951-04	256	Level 6 (11&UP years)	3		10	1
115	2015-03-13 22:17:34.4148-04	260	Level 7 (9-10 years)	3		10	1
116	2015-03-13 22:17:34.416376-04	258	Level 7 (11-12 years)	3		10	1
117	2015-03-13 22:17:34.417968-04	259	Level 7 (13&UP years)	3		10	1
118	2015-03-13 22:17:34.419307-04	251	Level 8 (11-12 years)	3		10	1
119	2015-03-13 22:17:34.420654-04	255	Level 8 (13-14 years)	3		10	1
120	2015-03-13 22:17:34.422057-04	254	Level 8 (15-18 years)	3		10	1
121	2015-03-13 22:17:34.423307-04	253	Level 9 (13-14 years)	3		10	1
122	2015-03-13 22:17:34.424634-04	252	Level 9 (15-18 years)	3		10	1
123	2015-03-13 22:17:34.426289-04	250	Level 10 (15-16 years)	3		10	1
124	2015-03-13 22:17:34.427568-04	249	Level 10 (17-18 years)	3		10	1
125	2015-03-13 22:22:32.616197-04	4	Session 1	1		14	1
126	2015-03-13 22:23:00.884913-04	5	Session 2	1		14	1
127	2015-03-13 22:23:22.303776-04	6	Session 3	1		14	1
128	2015-03-13 22:23:45.269571-04	7	Session 4	1		14	1
130	2015-07-26 11:04:27.994319-04	1	4	1		22	1
131	2015-07-26 11:08:42.394633-04	2	5	1		22	1
132	2015-07-26 11:08:48.15289-04	3	6	1		22	1
133	2015-07-26 11:08:53.795675-04	4	7	1		22	1
134	2015-07-26 11:08:59.962717-04	5	8	1		22	1
135	2015-07-26 11:09:04.978608-04	6	9	1		22	1
136	2015-07-26 11:09:16.398638-04	7	10	1		22	1
137	2015-07-26 13:52:42.538799-04	1	Test Team Gym ABC	1		19	1
138	2015-07-27 16:37:32.650329-04	1	Test Team Gym ABC	2	Changed levels.	19	1
139	2015-07-27 16:38:19.279969-04	8	4	1		22	1
140	2015-07-27 16:38:23.564375-04	9	5	1		22	1
141	2015-07-27 16:38:44.115349-04	1	Test Team Gym ABC	2	Changed levels.	19	1
142	2015-07-27 16:42:41.393246-04	1	Test Team Gym ABC	2	No fields changed.	19	1
143	2015-07-27 16:47:01.333402-04	1	Test Team Gym ABC	2	No fields changed.	19	1
144	2015-07-27 16:47:27.394467-04	1	Test Team Gym ABC	2	Changed levels.	19	1
145	2015-07-27 16:47:52.398072-04	1	Test Team Gym ABC	2	No fields changed.	19	1
146	2015-07-27 16:53:46.373392-04	1	Test Team Gym ABC	2	No fields changed.	19	1
147	2015-07-27 16:53:54.703868-04	1	Test Team Gym ABC	2	Changed levels.	19	1
148	2015-07-27 16:54:03.144156-04	1	Test Team Gym ABC	2	No fields changed.	19	1
149	2015-07-27 16:54:29.478941-04	1	Test Team Gym ABC	2	Changed levels.	19	1
150	2015-07-27 16:54:44.669446-04	1	Test Team Gym ABC	2	Changed levels.	19	1
151	2015-07-27 16:54:52.495055-04	1	Test Team Gym ABC	2	Changed levels.	19	1
152	2015-07-27 17:00:25.005358-04	1	Test Team Gym ABC	2	Changed levels.	19	1
153	2015-07-27 17:00:34.405925-04	1	Test Team Gym ABC	2	No fields changed.	19	1
154	2015-07-27 17:00:51.538993-04	1	Test Team Gym ABC	2	Changed levels.	19	1
155	2015-07-27 17:00:56.822957-04	1	Test Team Gym ABC	2	No fields changed.	19	1
156	2015-07-27 17:02:28.426253-04	1	Test Team Gym ABC	2	Changed levels.	19	1
157	2015-07-27 17:02:43.975411-04	1	Test Team Gym ABC	2	No fields changed.	19	1
158	2015-07-27 17:04:06.247137-04	1	Test Team Gym ABC	2	Changed levels.	19	1
159	2015-07-27 17:06:17.964181-04	1	Test Team Gym ABC	2	Changed levels.	19	1
165	2015-07-27 17:14:41.199852-04	1	Test Team Gym ABC	2	Changed levels.	19	1
166	2015-07-27 17:16:10.24456-04	1	Test Team Gym ABC	2	Changed levels.	19	1
167	2015-07-27 17:16:29.003981-04	1	Test Team Gym ABC	2	Changed levels.	19	1
168	2015-07-27 17:17:11.0706-04	1	Test Team Gym ABC	2	Changed levels.	19	1
169	2015-08-29 18:12:15.106538-04	1	Gymstrada (023979)	2	Changed name, address_1, city, state, postal_code, phone, email, usag and levels. Changed first_name, last_name, usag, usag_expire_date, safety_expire_date and background_expire_date for Coach "Hallinan, Kevin".	19	1
170	2015-08-29 18:31:56.240737-04	1	Gymstrada	2	Added Coach "Patterson, Stephen". Added Coach "Perdercini, Eric". Added Coach "Porche, Anthony". Added Gymnast "Brewer, CJ level 4". Added Gymnast "Gandia, Mason level 4". Added Gymnast "Good, Stone level 4".	19	1
171	2015-08-29 18:37:16.928386-04	1	Gymstrada	2	Added Gymnast "Bridges, Jayden level 5". Added Gymnast "Bridges, Justin level 5". Added Gymnast "Davis, Tristan level 5". Added Gymnast "Freeman, TJ level 5". Added Gymnast "Gatewood, Remy level 5". Added Gymnast "Guida, Jacob level 5".	19	1
172	2015-08-29 18:40:30.70251-04	1	Gymstrada	2	Added Gymnast "Haydysch, Connor (level 5)". Added Gymnast "Kellogg, Sean (level 5)". Added Gymnast "Lakin, Kai (level 5)".	19	1
173	2015-08-29 19:39:27.910894-04	1	Gymstrada	2	Added Gymnast "Ryan, Lochrie (L5)". Added Gymnast "Walker, Brennan (L5)". Added Gymnast "Carter, Matt (L6)". Added Gymnast "Harwood, Remy (L6)". Added Gymnast "Morrison, Caleb (L6)". Added Gymnast "Thurston , Jack (L6)". Added Gymnast "Granados, Zachary (L7)". Added Gymnast "Isbell, Matvei (L7)". Added Gymnast "Lippy, Elliot (L7)". Added Gymnast "Melton, Caleb (L7)". Added Gymnast "Noah, Simons (L7)".	19	1
174	2015-08-29 20:35:35.137236-04	1	Gymstrada	2	Added Gymnast "Gomez, Jarel (L8)". Added Gymnast "Shilling, Kyle (L8)". Added Gymnast "Golden, Aaron (L9)". Added Gymnast "Golden, Samuel (L9)". Added Gymnast "Moore, Xavier (L9)". Added Gymnast "Policarpo, Joao (L9)". Added Gymnast "Sipes, Owen (L9)". Added Gymnast "Woodard, Tyrus (L9)". Added Gymnast "Griffin, Solomon (L10)". Added Gymnast "Holloway, Ryan (L10)". Added Gymnast "Kasiski, Garrett (L10)". Added Gymnast "Ladner, Joey (L10)". Added Gymnast "McCord, Chris (L10)". Added Gymnast "Palacios, Isaac (L10)".	19	1
175	2015-08-29 21:36:32.72354-04	5	barbarella, My test coach	1		20	1
176	2015-08-29 22:25:01.741535-04	1	Gymstrada	2	Changed levels.	19	1
177	2015-08-29 22:26:21.76723-04	1	Gymstrada	2	No fields changed.	19	1
178	2015-08-29 22:58:48.715527-04	1	Gymstrada	2	No fields changed.	19	1
179	2015-08-29 22:59:18.428432-04	1	Gymstrada	2	Changed levels.	19	1
180	2015-08-29 22:59:23.660765-04	1	Gymstrada	2	No fields changed.	19	1
181	2015-08-29 22:59:34.762499-04	1	Gymstrada	2	Changed levels.	19	1
182	2015-08-29 23:02:03.159221-04	1	Gymstrada	2	Changed levels.	19	1
183	2015-08-29 23:02:22.003549-04	1	Gymstrada	2	No fields changed.	19	1
184	2015-08-29 23:02:43.36986-04	1	Gymstrada	2	Changed levels.	19	1
185	2015-08-29 23:02:55.899406-04	1	Gymstrada	2	No fields changed.	19	1
186	2015-08-29 23:20:59.728379-04	1	Gymstrada	2	No fields changed.	19	1
187	2015-08-29 23:21:18.16637-04	1	Gymstrada	2	Changed levels.	19	1
188	2015-08-29 23:21:36.308088-04	1	Gymstrada	2	No fields changed.	19	1
189	2015-08-30 14:40:37.288697-04	1	Gymstrada	2	Changed levels.	19	1
190	2015-08-30 14:40:54.788356-04	1	Gymstrada	2	Changed levels.	19	1
191	2015-08-30 14:41:21.866168-04	1	Gymstrada	2	Changed levels.	19	1
192	2015-08-30 14:41:30.839466-04	1	Gymstrada	2	No fields changed.	19	1
193	2015-08-30 14:42:14.731375-04	1	Gymstrada	2	Changed levels.	19	1
194	2015-08-30 14:52:24.529769-04	1	Gymstrada	2	Changed registration_complete.	19	1
195	2015-08-30 14:56:22.063758-04	1	Gymstrada	2	No fields changed.	19	1
196	2015-08-30 14:57:33.042201-04	1	Gymstrada	2	No fields changed.	19	1
197	2015-08-30 14:57:42.972597-04	1	Gymstrada	2	Changed levels.	19	1
198	2015-08-30 14:57:52.222219-04	1	Gymstrada	2	No fields changed.	19	1
199	2015-08-30 15:00:31.215774-04	1	Gymstrada	2	Changed levels.	19	1
200	2015-08-30 15:00:42.476553-04	1	Gymstrada	2	Changed levels.	19	1
201	2015-08-30 15:01:13.377053-04	1	Gymstrada	2	Changed levels.	19	1
202	2015-08-30 15:02:17.477566-04	1	Gymstrada	2	Changed levels.	19	1
203	2015-08-30 15:05:27.875989-04	1	Gymstrada	2	Changed levels.	19	1
204	2015-08-30 15:05:44.753881-04	1	Gymstrada	2	Changed levels.	19	1
205	2015-08-30 15:06:03.270236-04	1	Gymstrada	2	No fields changed.	19	1
206	2015-08-30 15:07:20.558285-04	1	Gymstrada	2	No fields changed.	19	1
207	2015-08-30 15:10:32.729156-04	1	Gymstrada	2	No fields changed.	19	1
208	2015-08-30 15:12:27.266182-04	1	Gymstrada	2	No fields changed.	19	1
209	2015-08-30 15:13:40.113679-04	1	Gymstrada	2	No fields changed.	19	1
210	2015-08-30 15:14:37.21239-04	1	Gymstrada	2	No fields changed.	19	1
211	2015-08-30 15:15:08.503718-04	1	Gymstrada	2	No fields changed.	19	1
212	2015-08-30 15:15:45.912073-04	1	Gymstrada	2	Changed levels.	19	1
213	2015-08-30 15:15:55.755573-04	1	Gymstrada	2	Changed levels.	19	1
214	2015-08-30 15:16:05.662655-04	1	Gymstrada	2	Changed levels.	19	1
215	2015-08-30 15:27:34.485247-04	275	Level 10 (15-16 years)	2	Changed order.	10	1
216	2015-08-30 15:27:34.492377-04	274	Level 10 (17-18 years)	2	Changed order.	10	1
217	2015-08-30 15:30:01.720197-04	275	Level 10 (15-16 years)	2	Changed order.	10	1
218	2015-08-30 15:30:01.724769-04	274	Level 10 (17-18 years)	2	Changed order.	10	1
219	2015-08-30 15:30:18.878843-04	289	Level JE (11-14 years)	2	Changed order.	10	1
220	2015-09-08 12:29:35.071753-04	2	Gymland Arena Gymnastics	1		19	1
221	2015-09-08 12:30:10.901076-04	2	Gymland Arena Gymnastics	2	No fields changed.	19	1
222	2015-09-08 12:36:17.264027-04	2	Gymland Arena Gymnastics	2	Added Gymnast "Thackston, Parker (L8)". Added Gymnast "Feltquate, Jakob (L8)". Added Gymnast "Spagnoletti, P.J. (L9)". Added Gymnast "Vaughn, Dylan (L9)". Added Gymnast "Smith, Brendan (L10)". Added Gymnast "Patrizio, Harrison (L10)".	19	1
223	2015-09-08 12:36:43.377415-04	2	Gymland Arena Gymnastics	2	No fields changed.	19	1
224	2015-09-08 12:37:21.702345-04	2	Gymland Arena Gymnastics	2	Changed email.	19	1
225	2015-09-10 12:29:54.405112-04	3	Gravity Forged Gymnastics	1		19	1
226	2015-09-10 12:30:00.020443-04	3	Gravity Forged Gymnastics	2	No fields changed.	19	1
227	2015-09-10 12:32:05.74379-04	3	Gravity Forged Gymnastics	2	Added Gymnast "Esberg, Adin (L6)".	19	1
228	2015-09-10 14:04:10.501188-04	3	Gravity Forged Gymnastics	2	Added Gymnast "Phillipps, Josh (L6)".	19	1
229	2015-09-10 14:05:54.566326-04	3	Gravity Forged Gymnastics	2	Added Gymnast "Shemaitat, Tyler (L6)".	19	1
230	2015-09-10 14:07:35.405839-04	3	Gravity Forged Gymnastics	2	Changed levels.	19	1
231	2015-09-10 14:07:45.749689-04	3	Gravity Forged Gymnastics	2	Changed levels.	19	1
232	2015-09-10 14:17:57.776447-04	1	Gymstrada	2	Changed payment_postmark. Deleted Coach "barbarella, My test coach".	19	1
233	2015-09-10 14:18:37.428244-04	1	Gymstrada	2	Changed levels.	19	1
234	2015-09-10 14:18:47.793174-04	1	Gymstrada	2	Changed paid_in_full.	19	1
286	2015-10-01 14:37:08.960679-04	139	Rippen, Stanley (L4)	2	Changed age.	21	1
235	2015-09-11 12:42:22.253409-04	2	Gymland Arena Gymnastics	2	Changed paid_in_full and payment_postmark.	19	1
236	2015-09-21 19:44:02.446095-04	4	North Shore Gymnastics	1		19	1
237	2015-09-21 19:48:55.318223-04	4	North Shore Gymnastics	2	Added Gymnast "Dahllof, Caleb (L4)". Added Gymnast "Fabian, Owen (L4)". Added Gymnast "Miller, Solomon (L4)". Added Gymnast "Robell, Peter (L5)".	19	1
238	2015-09-21 19:49:39.356583-04	4	North Shore Gymnastics	2	Changed payment_postmark and registration_complete.	19	1
239	2015-09-21 22:41:57.980681-04	5	Docksiders Gymnastics	1		19	1
240	2015-09-21 22:45:25.909659-04	5	Docksiders Gymnastics	2	Added Gymnast "Watkins, Tristan (L4)". Added Gymnast "Willis, Brent (L5)". Added Gymnast "Keefer, Gavin (L5)". Added Gymnast "McCready, Brandon (L5)". Added Gymnast "Irons, Isaiah (L6)".	19	1
241	2015-09-21 22:50:46.04064-04	5	Docksiders Gymnastics	2	Added Gymnast "Allen, Evan (L6)". Added Gymnast "Kirvan, Michael (L6)". Added Gymnast "Damm, Stephen (L6)".	19	1
242	2015-09-21 22:54:32.815789-04	5	Docksiders Gymnastics	2	Added Gymnast "Auchincloss, Alexander (L6)". Added Gymnast "O'Toole, Liam (L7)". Added Gymnast "Eid, Marcel (L7)". Added Gymnast "Joyner, Adam (L7)".	19	1
243	2015-09-21 23:20:55.492055-04	49	SCRATCHED Delafosse, John (L6)	2	Changed is_scratched.	21	1
244	2015-09-24 17:56:02.712189-04	67	Colin, Nate (L4)	2	Changed usag.	21	1
245	2015-09-24 17:56:33.084286-04	68	Magness, Charles (L4)	2	Changed usag.	21	1
246	2015-09-24 17:56:49.587176-04	69	Portaro, Marc (L4)	2	Changed usag.	21	1
247	2015-09-24 17:57:06.658181-04	70	Watkins, Tristan (L4)	2	Changed usag.	21	1
248	2015-09-24 17:57:20.151504-04	71	Willis, Brent (L5)	2	Changed usag.	21	1
249	2015-09-29 13:49:31.630725-04	6	APEX Gymnastics	1		19	1
250	2015-09-29 13:59:36.777764-04	6	APEX Gymnastics	2	Added Gymnast "Hanny, Benjamin (L8)". Added Gymnast "Falgiano, Colin (L8)". Added Gymnast "Sternberg, Paul (L8)". Added Gymnast "Clingman, Chase (L9)". Added Gymnast "Voegele, Logan (L10)". Added Gymnast "Clingman, Nathan (L10)". Changed tshirt for Gymnast "Durante, Tyler (L4)". Changed tshirt for Gymnast "Jekal, Daniel (L4)". Changed tshirt for Gymnast "Lin, Conner (L4)". Changed tshirt for Gymnast "Peppiatt, Michael (L4)". Changed tshirt for Gymnast "Rearden, Alex (L4)". Changed tshirt for Gymnast "York, Jacob (L4)". Changed tshirt for Gymnast "Hanny, Jesse (L5)". Changed tshirt for Gymnast "Hanny, Joshua (L5)". Changed tshirt for Gymnast "Wells, Ethan (L5)". Changed tshirt for Gymnast "Yoder, Tiernan (L5)". Changed tshirt for Gymnast "Morgan, Neil (L6)". Changed tshirt for Gymnast "Pelligrini, Josef (L6)". Changed tshirt and level for Gymnast "Pelligrini, David (L6)".	19	1
251	2015-09-29 14:00:37.941261-04	6	APEX Gymnastics	2	Changed notes.	19	1
252	2015-09-29 14:02:09.321734-04	6	APEX Gymnastics	2	Changed levels.	19	1
253	2015-09-29 14:02:27.802121-04	6	APEX Gymnastics	2	Changed paid_in_full.	19	1
254	2015-09-30 13:38:11.216573-04	7	Fairland	1		19	1
255	2015-09-30 13:59:14.174645-04	7	Fairland	2	Added Gymnast "Hayter, Jackson (L4)". Added Gymnast "Hayter, Miles (L5)". Added Gymnast "Henry, Maliel (L9)". Added Gymnast "Henry-Price, Joshua (L8)". Added Gymnast "Hewitt, Donovan (L9)". Added Gymnast "Jackson, Tyler (L4)". Added Gymnast "Jarrell, Christian (L10)". Added Gymnast "Kanthan, Kush (L7)". Added Gymnast "Louloudes, NIcholas (L9)". Added Gymnast "Mason, Jan (L4)". Added Gymnast "Mejia-Moreno, Giovanni (L5)". Added Gymnast "Ngo, Quinlan (L8)". Added Gymnast "Nguyen, Damon (L6)". Added Gymnast "Nguyen, Thanh (L6)". Added Gymnast "Nguyen, Thien (L4)". Added Gymnast "Ra-Akbar, Jadon (L8)". Added Gymnast "Rice, Cameron (L10)". Added Gymnast "Rippen, Stanley (L4)". Added Gymnast "Rollins, Zachary (L7)". Added Gymnast "Saine, Dawda (L6)". Added Gymnast "Singleton, Brandon (L8)". Added Gymnast "Singleton, Jason (L7)". Added Gymnast "Skerritt, Justin (L10)". Added Gymnast "Spurlock, Ibraheem (L8)". Added Gymnast "Syed, Aaban (L8)". Added Gymnast "Tran, Eric (L8)". Added Gymnast "Trinh, Brian (L9)". Added Gymnast "Trinh, Daniel (L9)". Added Gymnast "Venit, Michael (L8)". Added Gymnast "Wedge, Simon (L4)".	19	1
256	2015-09-30 14:01:33.02382-04	8	Beach Bounders Gymnastics	1		19	1
257	2015-09-30 14:13:14.682621-04	9	Fairfax Gymnastics Academy	1		19	1
258	2015-09-30 14:13:39.905749-04	9	Fairfax Gymnastics Academy	2	Changed registration_complete.	19	1
259	2015-09-30 14:16:17.866628-04	8	Beach Bounders Gymnastics	2	Changed paid_in_full.	19	1
260	2015-09-30 14:16:33.104042-04	8	Beach Bounders Gymnastics	2	Changed payment_postmark and registration_complete.	19	1
261	2015-09-30 14:16:49.855582-04	3	Gravity Forged Gymnastics	2	Changed payment_postmark.	19	1
262	2015-09-30 14:16:59.903175-04	3	Gravity Forged Gymnastics	2	Changed paid_in_full.	19	1
263	2015-09-30 14:22:53.845642-04	13	Shamenko, Vladimir	2	Changed safety_expire_date and background_expire_date.	20	1
264	2015-09-30 14:23:20.0543-04	14	Rowell, Denise	2	Changed safety_expire_date and background_expire_date.	20	1
265	2015-09-30 14:57:37.729446-04	11	Excalibur Gymnastics	1		19	1
266	2015-09-30 15:01:02.3827-04	11	Excalibur Gymnastics	2	Added Gymnast "Agundes-Wright, Ronan (L5)". Added Gymnast "Jones, William (L4)". Added Gymnast "Sault, Kenneth (L4)". Added Gymnast "Heald, Jason (L5)". Added Gymnast "Montes, Gunnar (L5)". Added Gymnast "Robertson, Connor (L5)".	19	1
267	2015-09-30 15:06:04.010226-04	11	Excalibur Gymnastics	2	Added Gymnast "Barber, Aaron (L6)". Added Gymnast "Bishop, James (L6)". Added Gymnast "Boyle, Logan (L6)". Added Gymnast "Shinn, Jacob (L6)". Added Gymnast "Sturgeon, Lawrence (L6)". Added Gymnast "Sullivan, Cameron (L6)". Added Gymnast "Warra, Makennen (L6)". Added Gymnast "Defoor, Dylan (L7)".	19	1
268	2015-09-30 15:06:45.804465-04	11	Excalibur Gymnastics	2	Changed levels.	19	1
269	2015-09-30 15:07:57.609736-04	11	Excalibur Gymnastics	2	Changed level for Gymnast "Agundes-Wright, Ronan (L4)".	19	1
270	2015-10-01 13:41:17.061158-04	12	Olympiad Gymnastics	1		19	1
271	2015-10-01 14:35:45.067812-04	109	Clark, Henry (L5)	2	Changed age.	21	1
272	2015-10-01 14:35:50.083712-04	132	Mejia-Moreno, Giovanni (L5)	2	Changed age.	21	1
273	2015-10-01 14:36:00.273813-04	123	Hayter, Miles (L5)	2	Changed age.	21	1
274	2015-10-01 14:36:18.01122-04	151	Wedge, Simon (L4)	2	Changed age.	21	1
275	2015-10-01 14:36:22.976195-04	150	Venit, Michael (L8)	2	Changed age.	21	1
276	2015-10-01 14:36:26.797197-04	149	Trinh, Daniel (L9)	2	Changed age.	21	1
277	2015-10-01 14:36:31.730652-04	148	Trinh, Brian (L9)	2	Changed age.	21	1
278	2015-10-01 14:36:36.625601-04	146	Syed, Aaban (L8)	2	Changed age.	21	1
279	2015-10-01 14:36:40.042115-04	147	Tran, Eric (L8)	2	Changed age.	21	1
280	2015-10-01 14:36:44.515941-04	145	Spurlock, Ibraheem (L8)	2	Changed age.	21	1
281	2015-10-01 14:36:48.241354-04	144	Skerritt, Justin (L10)	2	Changed age.	21	1
282	2015-10-01 14:36:52.83412-04	142	Singleton, Brandon (L8)	2	Changed age.	21	1
283	2015-10-01 14:36:56.889839-04	143	Singleton, Jason (L7)	2	Changed age.	21	1
284	2015-10-01 14:37:00.633328-04	140	Rollins, Zachary (L7)	2	Changed age.	21	1
285	2015-10-01 14:37:03.921013-04	141	Saine, Dawda (L6)	2	Changed age.	21	1
287	2015-10-01 14:37:13.096669-04	138	Rice, Cameron (L10)	2	Changed age.	21	1
288	2015-10-01 14:37:17.223358-04	137	Ra-Akbar, Jadon (L8)	2	Changed age.	21	1
289	2015-10-01 14:37:20.808296-04	136	Nguyen, Thien (L4)	2	Changed age.	21	1
290	2015-10-01 14:37:24.585358-04	135	Nguyen, Thanh (L6)	2	Changed age.	21	1
291	2015-10-01 14:37:28.520265-04	134	Nguyen, Damon (L6)	2	Changed age.	21	1
292	2015-10-01 14:37:31.770132-04	133	Ngo, Quinlan (L8)	2	Changed age.	21	1
293	2015-10-01 14:37:35.213381-04	131	Mason, Jan (L4)	2	Changed age.	21	1
294	2015-10-01 14:37:38.927341-04	130	Louloudes, NIcholas (L9)	2	Changed age.	21	1
295	2015-10-01 14:37:42.360649-04	129	Kanthan, Kush (L7)	2	Changed age.	21	1
296	2015-10-01 14:37:46.432092-04	128	Jarrell, Christian (L10)	2	Changed age.	21	1
297	2015-10-01 14:37:50.175573-04	127	Jackson, Tyler (L4)	2	Changed age.	21	1
298	2015-10-01 14:37:54.167585-04	126	Hewitt, Donovan (L9)	2	Changed age.	21	1
299	2015-10-01 14:37:57.927517-04	125	Henry-Price, Joshua (L8)	2	Changed age.	21	1
300	2015-10-01 14:38:01.7917-04	124	Henry, Maliel (L9)	2	Changed age.	21	1
301	2015-10-01 14:38:05.143333-04	122	Hayter, Jackson (L4)	2	Changed age.	21	1
302	2015-10-01 14:38:09.479252-04	121	Hall, Landon (L4)	2	Changed age.	21	1
303	2015-10-01 14:38:21.63946-04	118	Hall, Donovan (L6)	2	Changed age.	21	1
304	2015-10-01 14:38:25.663523-04	117	Graninger, Kenneth (L8)	2	Changed age.	21	1
305	2015-10-01 14:38:28.846804-04	115	Farias, Simon (L4)	2	Changed age.	21	1
306	2015-10-01 14:38:32.894773-04	116	Galvez, Julian (L8)	2	Changed age.	21	1
307	2015-10-01 14:38:39.142345-04	114	Durso, Reese (L9)	2	Changed age.	21	1
308	2015-10-01 14:38:43.405676-04	113	Dao, Jonathan (L6)	2	Changed age.	21	1
309	2015-10-01 14:38:46.829183-04	112	Cronin, Asher (L6)	2	Changed age.	21	1
310	2015-10-01 14:38:50.893708-04	111	Cowan, Drew (L6)	2	Changed age.	21	1
311	2015-10-01 14:38:55.069415-04	110	Cooper, Logan (L4)	2	Changed age.	21	1
312	2015-10-01 14:38:58.790193-04	108	Chung, Riley (L6)	2	Changed age.	21	1
313	2015-10-01 14:39:04.573428-04	107	Chu, Patrick (L4)	2	Changed age.	21	1
314	2015-10-01 14:39:09.357972-04	106	Chu, Damien (L8)	2	Changed age.	21	1
315	2015-10-01 14:39:13.684963-04	105	Bredland, Samuel (L4)	2	Changed age.	21	1
316	2015-10-01 14:39:18.141232-04	104	Bennet, Pierce (L4)	2	Changed age.	21	1
317	2015-10-01 14:39:22.068611-04	103	Bailey, Deven (L4)	2	Changed age.	21	1
318	2015-10-01 14:39:26.156852-04	102	Ayodele, Aaron (L8)	2	Changed age.	21	1
319	2015-10-01 14:43:37.838327-04	177	Bishop, James (L6)	2	Changed age.	21	1
320	2015-10-01 14:43:49.533396-04	183	Defoor, Dylan (L7)	2	Changed age.	21	1
321	2015-10-01 17:17:26.747552-04	13	Beach Bounders Gymnastics	1		19	1
322	2015-10-01 17:18:53.4781-04	98	Sternberg, Paul (L8)	2	Changed dob and age.	21	1
323	2015-10-01 22:29:00.254229-04	102	Ayodele, Aaron (L8)	2	Changed dob and tshirt.	21	1
324	2015-10-01 22:29:22.83564-04	103	Bailey, Deven (L4)	2	Changed dob and tshirt.	21	1
325	2015-10-01 22:29:46.744697-04	104	Bennet, Pierce (L4)	2	Changed dob, is_us_citizen and tshirt.	21	1
326	2015-10-01 22:30:11.104969-04	106	Chu, Damien (L8)	2	Changed dob and tshirt.	21	1
327	2015-10-01 22:31:24.109724-04	107	Chu, Patrick (L4)	2	Changed dob and tshirt.	21	1
328	2015-10-01 22:31:38.171767-04	108	Chung, Riley (L6)	2	Changed dob.	21	1
329	2015-10-01 22:31:58.117181-04	109	Clark, Henry (L5)	2	Changed dob.	21	1
330	2015-10-01 22:32:18.439726-04	110	Cooper, Logan (L4)	2	Changed dob and tshirt.	21	1
331	2015-10-01 22:32:54.041029-04	111	Cowan, Drew (L6)	2	Changed usag, dob and tshirt.	21	1
332	2015-10-01 22:33:03.954357-04	102	Ayodele, Aaron (L8)	2	Changed usag.	21	1
333	2015-10-01 22:33:15.732983-04	103	Bailey, Deven (L4)	2	Changed usag.	21	1
334	2015-10-01 22:33:45.800623-04	104	Bennet, Pierce (L4)	2	Changed usag.	21	1
335	2015-10-01 22:34:46.77819-04	107	Chu, Patrick (L4)	2	Changed usag.	21	1
336	2015-10-01 22:34:56.639035-04	106	Chu, Damien (L8)	2	Changed usag.	21	1
337	2015-10-01 22:35:10.505323-04	108	Chung, Riley (L6)	2	Changed usag.	21	1
338	2015-10-01 22:35:21.502295-04	109	Clark, Henry (L5)	2	Changed usag.	21	1
339	2015-10-01 22:35:36.683649-04	110	Cooper, Logan (L4)	2	Changed usag.	21	1
340	2015-10-01 22:36:16.227625-04	112	Cronin, Asher (L6)	2	Changed usag and dob.	21	1
341	2015-10-01 22:36:58.42569-04	113	Dao, Jonathan (L6)	2	Changed usag, dob and tshirt.	21	1
342	2015-10-01 22:37:27.873032-04	114	Durso, Reese (L9)	2	Changed usag, dob and tshirt.	21	1
343	2015-10-01 22:38:22.809486-04	115	Farias, Simon (L4)	2	Changed usag, dob and tshirt.	21	1
344	2015-10-01 22:38:56.328854-04	116	Galvez, Julian (L7)	2	Changed usag, dob, tshirt and level.	21	1
345	2015-10-01 22:39:25.460315-04	117	Graninger, Kenneth (L8)	2	Changed usag, dob and tshirt.	21	1
346	2015-10-01 22:39:49.795888-04	121	Hall, Landon (L4)	2	Changed usag, dob and tshirt.	21	1
347	2015-10-01 22:40:18.401374-04	118	Hall, Donovan (L6)	2	Changed usag, dob and tshirt.	21	1
348	2015-10-01 22:41:00.49692-04	123	Hayter, Miles (L5)	2	Changed usag, dob and tshirt.	21	1
349	2015-10-01 22:41:30.616467-04	122	Hayter, Jackson (L4)	2	Changed usag, dob and tshirt.	21	1
350	2015-10-01 22:41:58.265982-04	125	Henry-Price, Joshua (L8)	2	Changed usag, dob and tshirt.	21	1
351	2015-10-01 22:42:26.176313-04	126	Hewitt, Donovan (L9)	2	Changed usag, dob and tshirt.	21	1
352	2015-10-01 22:42:56.02072-04	127	Jackson, Tyler (L4)	2	Changed usag, dob and tshirt.	21	1
353	2015-10-01 22:43:16.008035-04	128	Jarrell, Christian (L10)	2	Changed usag, dob and tshirt.	21	1
354	2015-10-01 22:43:51.998167-04	129	Kanthan, Kush (L7)	2	Changed usag, dob and tshirt.	21	1
355	2015-10-01 22:44:21.904611-04	130	Louloudes, NIcholas (L9)	2	Changed usag, dob and tshirt.	21	1
356	2015-10-01 22:44:57.629131-04	131	Mason, Jan (L4)	2	Changed usag, dob and tshirt.	21	1
357	2015-10-01 22:45:48.671668-04	124	Maher-Rippin, Stanley (L4)	2	Changed first_name, last_name, usag, dob, tshirt and level.	21	1
358	2015-10-01 22:46:35.895139-04	132	Mejia-Gabriel, Geovanny (L5)	2	Changed first_name, last_name, usag and dob.	21	1
359	2015-10-01 22:46:57.579584-04	132	Mejia-Gabriel, Geovanny (L5)	2	Changed tshirt.	21	1
360	2015-10-01 22:48:22.289857-04	133	Ngo, Quinlan (L8)	2	Changed usag, dob and tshirt.	21	1
361	2015-10-01 22:49:16.250122-04	136	Nguyen, Thien-Trieu (L4)	2	Changed first_name, usag and dob.	21	1
362	2015-10-01 22:50:00.332797-04	135	Nguyen, Thanh-Trieu (L6)	2	Changed first_name, usag and dob.	21	1
363	2015-10-01 22:50:29.932726-04	134	Nguyen, Damon (L6)	2	Changed usag, dob and tshirt.	21	1
364	2015-10-01 22:50:56.097381-04	137	Ra-Akbar, Jadon (L8)	2	Changed usag and dob.	21	1
365	2015-10-01 22:51:26.760917-04	138	Rice, Cameron (L10)	2	Changed usag, dob and tshirt.	21	1
366	2015-10-01 22:52:43.296025-04	140	Rollins, Zachary (L7)	2	Changed usag, dob and tshirt.	21	1
367	2015-10-01 22:53:27.2326-04	141	Saine, Dawda (L6)	2	Changed usag, dob and tshirt.	21	1
368	2015-10-01 22:53:46.012398-04	143	Singleton, Jason (L7)	2	Changed usag, dob and tshirt.	21	1
369	2015-10-01 22:54:06.878176-04	142	Singleton, Brandon (L8)	2	Changed usag, dob and tshirt.	21	1
370	2015-10-01 22:54:32.985918-04	145	Spurlock, Ibraheem (L8)	2	Changed usag, dob and tshirt.	21	1
371	2015-10-01 22:54:54.881066-04	146	Syed, Aaban (L8)	2	Changed usag, dob and tshirt.	21	1
372	2015-10-01 22:55:11.589158-04	147	Tran, Eric (L8)	2	Changed usag, dob and tshirt.	21	1
373	2015-10-01 22:55:53.626083-04	150	Venit, Michael (L8)	2	Changed usag, dob and tshirt.	21	1
374	2015-10-01 22:56:17.233885-04	151	Wedge, Simon (L4)	2	Changed usag, dob and tshirt.	21	1
375	2015-10-01 22:58:27.718871-04	149	Trinh, Daniel (L9)	3		21	1
376	2015-10-01 22:58:27.72113-04	148	Trinh, Brian (L9)	3		21	1
377	2015-10-01 22:58:27.722192-04	144	Skerritt, Justin (L10)	3		21	1
378	2015-10-01 22:58:27.723192-04	139	Rippen, Stanley (L4)	3		21	1
379	2015-10-01 22:58:27.724236-04	105	Bredland, Samuel (L4)	3		21	1
380	2015-10-01 22:59:24.246397-04	7	Fairland	2	No fields changed.	19	1
381	2015-10-02 15:03:57.665723-04	10	Jacob, Simacek	2	Changed usag_expire_date.	20	1
382	2015-10-03 20:24:42.123381-04	8	Beach Bounders Gymnastics	3		19	1
383	2015-10-03 20:53:38.864447-04	14	Top Flight Gymnastics	1		19	1
384	2015-10-03 21:00:15.595478-04	14	Top Flight Gymnastics	2	Added Gymnast "Rymut, Michael (L4)". Added Gymnast "Trump, Cooper (L4)". Added Gymnast "Ficke, Blake (L4)". Added Gymnast "Ficke, Brooks (L4)". Added Gymnast "Wysocki, Braden (L4)".	19	1
385	2015-10-03 21:05:35.277349-04	14	Top Flight Gymnastics	2	Added Gymnast "Burges, Caden (L5)". Added Gymnast "Brit, Ficke (L5)". Added Gymnast "Letvin, Benjamin (L6)". Added Gymnast "Nile, Samuel (L5)".	19	1
386	2015-10-03 21:07:18.942666-04	14	Top Flight Gymnastics	2	Changed level for Gymnast "Letvin, Benjamin (L5)".	19	1
387	2015-10-03 21:14:50.505124-04	14	Top Flight Gymnastics	2	Changed levels. Added Gymnast "Suravenkat, Vivek (L5)". Added Gymnast "Hibbert, Andrew (L6)". Added Gymnast "Schrott, Tyler (L6)".	19	1
388	2015-10-03 21:37:33.115435-04	14	Top Flight Gymnastics	2	Added Gymnast "Schrott, Connor (L6)". Added Gymnast "Arensdorf, Zachary (L7)". Added Gymnast "Burgess, Jackson (L8)". Added Gymnast "Currie, Benjamin (L8)". Added Gymnast "Davis, Dima (L8)". Added Gymnast "Mills, Kevin (L8)". Added Gymnast "Callas, Jimmy (L10)". Added Gymnast "Penn, Samuel (L10)". Added Gymnast "Valiente, Marcus (L10)".	19	1
389	2015-10-03 22:02:27.656718-04	7	Fairland	2	Changed usag, usag_expire_date, safety_expire_date and background_expire_date for Coach "Smith, Adam". Changed first_name, last_name, usag, usag_expire_date, safety_expire_date and background_expire_date for Coach "Quattlebaum, David". Deleted Coach "Gibbs, Adrian".	19	1
390	2015-10-03 22:05:09.859838-04	7	Fairland Sports & Aquatics Complex	2	Changed gym, phone and email.	19	1
391	2015-10-03 22:05:14.903635-04	7	Fairland Sports & Aquatics Complex	2	Changed team.	19	1
392	2015-10-03 22:05:24.175029-04	6	APEX Gymnastics	2	Changed team.	19	1
393	2015-10-03 22:05:30.430572-04	13	Beach Bounders Gymnastics	2	Changed team.	19	1
394	2015-10-03 22:05:37.084994-04	5	Docksiders Gymnastics	2	Changed team.	19	1
395	2015-10-03 22:05:42.942637-04	11	Excalibur Gymnastics	2	Changed team.	19	1
396	2015-10-03 22:05:49.114326-04	9	Fairfax Gymnastics Academy	2	Changed team.	19	1
397	2015-10-03 22:05:57.751222-04	3	Gravity Forged Gymnastics	2	Changed team.	19	1
398	2015-10-03 22:06:06.059274-04	2	Gymland Arena Gymnastics	2	Changed team.	19	1
399	2015-10-03 22:06:16.042818-04	1	Gymstrada	2	Changed team.	19	1
400	2015-10-03 22:06:30.242464-04	4	North Shore Gymnastics	2	Changed team.	19	1
401	2015-10-03 22:06:38.874078-04	12	Olympiad Gymnastics	2	Changed team.	19	1
402	2015-10-03 22:06:45.024984-04	14	Top Flight Gymnastics	2	Changed team.	19	1
403	2015-10-03 22:07:21.985919-04	14	Top Flight Gymnastics	2	Changed city, state and postal_code.	19	1
404	2015-10-07 18:46:07.524493-04	3	Gravity Forged Gymnastics	2	Changed levels. Changed first_name, last_name, dob, tshirt and level for Gymnast "Evans, Caleb (L9)".	19	1
405	2015-10-07 18:49:01.385949-04	3	Gravity Forged Gymnastics	2	Changed usag for Gymnast "Evans, Caleb (L9)".	19	1
406	2015-10-07 20:12:17.892126-04	15	United Gymnastix	1		19	1
407	2015-10-07 20:13:08.698336-04	15	United Gymnastix	2	Changed safety_expire_date and background_expire_date for Coach "Vasilev, Valentin".	19	1
408	2015-10-07 20:25:58.662948-04	16	Rebounders Gymnastics	1		19	1
409	2015-10-07 20:30:42.389863-04	16	Rebounders Gymnastics	2	Added Gymnast "Hastings, Connor (L4)". Added Gymnast "Horrigan, Sean (L4)". Added Gymnast "Marquez, Jullian (L4)". Added Gymnast "Vey, James (L4)". Added Gymnast "Wilmot, Gregory (L4)".	19	1
410	2015-10-07 20:34:39.757766-04	16	Rebounders Gymnastics	2	Added Gymnast "Becker, Anderson (L5)". Added Gymnast "Liang, Will (L5)". Added Gymnast "Napolitano, Enzo (L5)". Added Gymnast "Nesspor, Ryan (L5)". Added Gymnast "Silao, Zachary (L5)".	19	1
411	2015-10-07 20:44:41.571989-04	16	Rebounders Gymnastics	2	Added Gymnast "Black, Oliver (L6)". Added Gymnast "Jackson, Ryan (L6)". Added Gymnast "Rosenberg, Benjamin (L6)". Added Gymnast "Kelly, Boaz (L7)". Added Gymnast "Christopher, Gavin (L9)". Added Gymnast "Lawler, Owen (L9)". Added Gymnast "Rosendahl, Matthew (L9)". Added Gymnast "Rutz, Sebastian (L9)". Added Gymnast "Fritz, Brendan (L10)". Added Gymnast "Leonard, Cameron (L10)".	19	1
412	2015-10-07 20:45:16.417867-04	16	Rebounders Gymnastics	2	Changed levels.	19	1
413	2015-10-07 20:55:23.949904-04	16	Rebounders Gymnastics	2	Changed payment_postmark and registration_complete.	19	1
414	2015-10-07 20:55:32.029389-04	16	Rebounders Gymnastics	2	Changed paid_in_full.	19	1
415	2015-10-07 20:56:25.750878-04	12	Olympiad Gymnastics	2	Changed paid_in_full and payment_postmark.	19	1
416	2015-10-07 23:31:13.600204-04	16	Rebounders Gymnastics	2	Changed email.	19	1
417	2015-10-08 00:53:13.410116-04	84	FLAGGED! Jekal, Daniel (L4) 939766	2	Changed is_flagged.	21	1
418	2015-10-08 00:57:13.613153-04	89	Peppiatt, Michael (L4) 1004176	2	Changed is_verified.	21	1
419	2015-10-08 00:57:22.066537-04	86	Durante, Tyler (L4) 989662	2	Changed is_verified.	21	1
420	2015-10-08 00:57:29.006746-04	85	Lin, Conner (L4) 989664	2	Changed is_verified.	21	1
421	2015-10-08 00:57:34.341296-04	83	Rearden, Alex (L4) 989668	2	Changed is_verified.	21	1
422	2015-10-08 00:57:40.850859-04	82	York, Jacob (L4) 989666	2	Changed is_verified.	21	1
423	2015-10-08 12:41:20.262358-04	248	Leonard, Cameron (L10) 204504	2	Changed tshirt.	21	1
424	2015-10-08 13:22:47.350999-04	84	FLAGGED! Jekal, Daniel (L4) 939766	2	Changed notes.	21	1
425	2015-10-08 13:26:40.268978-04	6	APEX Gymnastics	2	Changed is_flagged and notes for Gymnast "FLAGGED! Sternberg, Paul (L8) 405143".	19	1
426	2015-10-08 17:38:47.676811-04	178	Boyle, Logan (L6) 550911	2	Changed usag.	21	1
427	2015-10-08 18:09:13.120323-04	17	KMC Gymnastics	1		19	1
428	2015-10-08 18:21:16.383201-04	17	KMC Gymnastics	2	Added Gymnast "Steele, Isaac (L4) ". Added Gymnast "Avatara, Rowan (LNone) 1016535". Added Gymnast "Felix, Gavin (L4) 1000825".	19	1
429	2015-10-08 18:27:55.222798-04	17	KMC Gymnastics	2	Added Gymnast "Gonslaves, Aaron (L4) 1007598". Added Gymnast "Geibel, Owen (L4) 1000824". Added Gymnast "Zolper, Adam (L4) 1000826". Changed level for Gymnast "Avatara, Rowan (L4) 1016535".	19	1
430	2015-10-08 18:37:31.759404-04	17	KMC Gymnastics	2	Added Gymnast "Secord, Joshua (L4) 950067". Added Gymnast "Secord, Zachary (LNone) 950068". Added Gymnast "Biggs, Spencer (L5) 636882". Added Gymnast "DiPillo, AJ (L5) 950066". Added Gymnast "Geibel, Austin (L5) 950071". Added Gymnast "Lewis, Spencer (LNone) 641686". Added Gymnast "March, Oliver (L5) 952156". Added Gymnast "Pohorylo, Maksym (L5) 950070". Added Gymnast "Salisbury, Sean (L5) 636887". Added Gymnast "Uy, Ryan (L5) 978410". Added Gymnast "Thomas, Casey (L6) 477309".	19	1
431	2015-10-08 18:38:56.919365-04	17	KMC Gymnastics	2	Changed level for Gymnast "Lewis, Spencer (L5) 641686". Changed level for Gymnast "Secord, Zachary (L4) 950068".	19	1
432	2015-10-08 18:48:20.841815-04	17	KMC Gymnastics	2	Added Gymnast "Homan, Connor (L6) 578894". Added Gymnast "Langdon, TJ (L7) 424073". Added Gymnast "Graves, Edris (L7) 532060". Added Gymnast "Walchuk, Kyle (L8) 505115". Added Gymnast "Bachman, Liam (L9) 377434". Added Gymnast "Scheck, Jackson (L9) 374903". Added Gymnast "Clark, Kieran (L9) 488032". Added Gymnast "Overman, Andrew (L9) 505112". Added Gymnast "Cunane, Collin (L9) 423834".	19	1
433	2015-10-08 19:00:12.096252-04	6	APEX Gymnastics	2	Changed is_flagged, is_verified and notes for Gymnast "Sternberg, Paul (L8) 405143".	19	1
434	2015-10-08 19:00:30.155995-04	6	APEX Gymnastics	2	Changed notes.	19	1
435	2015-10-08 19:01:33.620967-04	84	Jekal, Daniel (L5) 939766	2	Changed is_flagged, is_verified and level.	21	1
436	2015-10-08 19:09:21.723395-04	5	Docksiders Gymnastics	2	Changed usag.	19	1
437	2015-10-08 19:11:50.741796-04	187	Griffin, Jacob (L4) 992840	2	Changed last_name.	21	1
438	2015-10-09 23:36:55.616468-04	18	Gym Quest Gymnastics	1		19	1
439	2015-10-09 23:37:28.749736-04	19	Gym Quest Gymnastics	1		19	1
440	2015-10-09 23:43:41.283457-04	19	Gym Quest Gymnastics	2	Added Gymnast "Cramer, Joe (L10) 258877". Added Gymnast "Bauer, Adam (L10) 256327". Added Gymnast "Ryan, Carson (L10) 446268". Added Gymnast "Rutherford, Grady (L8) 436001". Added Gymnast "Faglioni, Mitchell (L6) 522955". Added Gymnast "Hicks, Hayden (L6) 636527". Added Gymnast "Burchard, Grayson (L6) 657526".	19	1
441	2015-10-09 23:43:58.68691-04	19	Gym Quest Gymnastics	2	Changed levels.	19	1
442	2015-10-09 23:45:42.88327-04	19	Gym Quest Gymnastics	2	No fields changed.	19	1
443	2015-10-09 23:50:57.17701-04	20	All-Pro Gymnastics, Paragon Boys Team	1		19	1
444	2015-10-09 23:57:00.148363-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Added Gymnast "Becker, Kunda (L4) 938283". Added Gymnast "Mazzuca, Zack (L4) 1008952". Added Gymnast "Mazzuca, Luke (L5) 621923". Added Gymnast "Miller, Alex (L5) 938125". Added Gymnast "Morrison, Colin (L5) 621924". Added Gymnast "Morrison, Tyler (L5) 587041".	19	1
445	2015-10-10 00:03:31.426851-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Added Gymnast "Ostrowski, Tyler (L5) 938128". Added Gymnast "Richards, Adam (L5) 661838". Added Gymnast "Simpson, Sergei (L5) 621927". Added Gymnast "Campbell, Orion (L5) 639727". Added Gymnast "Kestler, Spencer (L5) 573985". Added Gymnast "Kofie, Malakai (L5) 583018". Added Gymnast "Chiang, Thomas (L5) 1008955". Added Gymnast "Muhammad, Dawud (L5) 650435".	19	1
446	2015-10-10 00:06:05.469601-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Changed levels. Added Gymnast "Sheppard, Keon (L6) 571647". Added Gymnast "Haycock, Wesley (L6) 486369". Added Gymnast "Harman, Connor (L6) 554559". Added Gymnast "Kunda, Bode (L6) 592599".	19	1
447	2015-10-10 00:17:23.126431-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Changed levels. Added Gymnast "Berman, Joshua (L8) 463969". Added Gymnast "Donnely, Kavier (L8) ". Added Gymnast "Dev, Sahil (LNone) 429974". Added Gymnast "Gernhar..., James (LNone) 506486". Added Gymnast "Gernhart, Andrew (L7) 506477". Added Gymnast "Hewitt, Griffin (L7) 511224".	19	1
448	2015-10-10 00:17:57.480444-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Changed level for Gymnast "Dev, Sahil (L7) 429974". Changed level for Gymnast "Gernhar..., James (L7) 506486".	19	1
449	2015-10-10 00:21:02.823709-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Added Gymnast "Mignardi, Gabe (L7) 396527". Added Gymnast "Fisher, Elijah (L7) 482708". Added Gymnast "Luethy, Hollis (L7) 521581". Added Gymnast "Shiffrin, Henry (L7) 519898".	19	1
450	2015-10-10 00:28:26.912722-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Changed levels. Added Gymnast "Rudie, Paul (L9) 433836". Added Gymnast "Kuzmenchuk, Aleksandr (L9) 372142". Added Gymnast "Powers, Zyler (L9) 433836". Added Gymnast "Gregory, Johnny (L9) 458583". Added Gymnast "Mateer, Christopher (L9) 431013". Added Gymnast "Dinmore, Iam (L9) 425358". Added Gymnast "Lutchman, Dhiren (L9) 245810". Added Gymnast "Barnhouse, Mark (L9) 621943". Added Gymnast "Bowling, Brett (L9) 380451".	19	1
451	2015-10-10 00:29:01.164163-04	20	All-Pro Gymnastics, Paragon Boys Team	2	Changed first_name for Gymnast "Donnely, Xavier (L8) ".	19	1
452	2015-10-10 00:31:08.134858-04	18	Gym Quest Gymnastics	3		19	1
453	2015-10-10 00:32:27.845965-04	315	Dinmore, Ian (L9) 425358	2	Changed first_name.	21	1
454	2015-10-10 15:44:22.462049-04	1	2015 BWI 2015-12-12	1		23	1
455	2015-10-11 15:24:30.469478-04	1	Level 4 (6-7 years)	1		27	1
456	2015-10-11 15:24:46.912829-04	2	Level 4 (8 years)	1		27	1
457	2015-10-11 15:24:51.891514-04	2	Level 4 (8 years)	2	No fields changed.	27	1
458	2015-10-11 15:25:13.36541-04	3	Level 4 (9-18 years)	1		27	1
459	2015-10-11 15:27:12.883876-04	4	Level 5 (7-8 years)	1		27	1
460	2015-10-11 15:28:03.943275-04	5	Level 5 (9 years)	1		27	1
461	2015-10-11 15:29:16.283119-04	6	Level 5 (10-11 years)	1		27	1
462	2015-10-11 15:30:19.28971-04	7	Level 5 (12-18 years)	1		27	1
463	2015-10-11 15:31:06.227285-04	8	Level 6 (8-9 years)	1		27	1
464	2015-10-11 15:31:21.718356-04	9	Level 6 (10 years)	1		27	1
465	2015-10-11 15:31:37.330341-04	10	Level 6 (11 years)	1		27	1
466	2015-10-11 15:31:51.323357-04	11	Level 6 (12-18 years)	1		27	1
467	2015-10-11 15:32:55.902855-04	12	Level 7 (9-11 years)	1		27	1
468	2015-10-11 15:33:13.921813-04	13	Level 7 (12-18 years)	1		27	1
469	2015-10-11 15:33:33.63161-04	14	Level 8 (11-12 years)	1		27	1
470	2015-10-11 15:34:08.877662-04	15	Level 8 (13-16 years)	1		27	1
471	2015-10-11 15:34:26.467361-04	16	Level 9 (13-14 years)	1		27	1
472	2015-10-11 15:35:01.611467-04	17	Level 9 (15-18 years)	1		27	1
473	2015-10-11 15:35:20.489116-04	18	Level 10 (15-16 years)	1		27	1
474	2015-10-11 15:35:33.44488-04	19	Level 10 (17-18 years)	1		27	1
475	2015-10-11 15:40:09.534107-04	9	5	2	Changed order.	22	1
476	2015-10-11 15:40:24.894536-04	9	5	2	Changed order.	22	1
477	2015-10-11 16:15:32.400299-04	1	$80 per gymnast (Early Bird)	1		36	1
478	2015-10-11 16:15:43.255562-04	2	$90 per gymnast	1		36	1
479	2015-10-11 16:16:02.599835-04	1	$50	1		35	1
480	2015-10-11 16:23:58.745625-04	1	Extra Small (Youth)	1		37	1
481	2015-10-11 16:24:01.513017-04	2	Small (Youth)	1		37	1
482	2015-10-11 16:24:09.187742-04	3	Medium (Youth)	1		37	1
483	2015-10-11 16:24:16.443072-04	4	Large (Youth)	1		37	1
484	2015-10-11 16:24:23.805171-04	5	Extra Large (Youth)	1		37	1
485	2015-10-11 16:24:30.979984-04	6	Extra Small (Adult)	1		37	1
486	2015-10-11 16:24:38.60696-04	7	Small (Adult)	1		37	1
487	2015-10-11 16:24:44.871044-04	8	Medium (Adult)	1		37	1
488	2015-10-11 16:24:50.749749-04	9	Large (Adult)	1		37	1
489	2015-10-11 16:24:57.580526-04	10	Extra Large (Adult)	1		37	1
490	2015-10-11 16:26:19.29013-04	2	Small (Youth)	2	Changed order.	37	1
491	2015-10-11 16:26:30.586098-04	3	Medium (Youth)	2	Changed order.	37	1
492	2015-10-11 16:26:47.235998-04	4	Large (Youth)	2	Changed order.	37	1
493	2015-10-11 16:26:58.072143-04	5	Extra Large (Youth)	2	Changed order.	37	1
494	2015-10-11 16:27:06.869493-04	6	Extra Small (Adult)	2	Changed order.	37	1
495	2015-10-11 16:27:11.912133-04	7	Small (Adult)	2	Changed order.	37	1
496	2015-10-11 16:27:16.512976-04	8	Medium (Adult)	2	Changed order.	37	1
497	2015-10-11 16:27:22.102837-04	9	Large (Adult)	2	Changed order.	37	1
498	2015-10-11 16:27:26.180691-04	10	Extra Large (Adult)	2	Changed order.	37	1
499	2015-10-11 17:32:19.114676-04	6	APEX Gymnastics	2	Changed per_gymnast_cost and levels.	19	1
500	2015-10-11 18:23:41.305478-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
501	2015-10-11 18:23:57.624567-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
502	2015-10-11 18:26:06.636715-04	10	11	1		22	1
503	2015-10-11 18:26:13.976247-04	10	11	3		22	1
504	2015-10-11 18:33:07.543485-04	11	11	1		22	1
505	2015-10-11 18:33:14.502031-04	11	11	3		22	1
506	2015-10-11 18:33:25.20529-04	12	11	1		22	1
507	2015-10-11 18:33:34.090924-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
508	2015-10-11 18:33:50.415527-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
509	2015-10-11 18:50:06.110077-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
510	2015-10-11 18:50:24.153607-04	1	2015 BWI 2015-12-12	2	Changed is_current_meet.	23	1
511	2015-10-11 20:05:09.667149-04	12	11	3		22	1
512	2015-10-26 20:26:06.928426-04	1	Session 1	1		29	1
513	2015-10-26 20:31:00.408176-04	192	None Agbor-Obal, Jezrael (Top Flight Gymnastics)	2	No fields changed.	39	1
514	2015-10-26 20:31:08.190146-04	192	None Agbor-Obal, Jezrael (Top Flight Gymnastics)	2	No fields changed.	39	1
515	2015-10-26 20:31:15.27997-04	192	None Agbor-Obal, Jezrael (Top Flight Gymnastics)	2	No fields changed.	39	1
516	2015-10-26 20:32:09.878179-04	192	None Agbor-Obal, Jezrael (Top Flight Gymnastics)	2	No fields changed.	39	1
517	2015-10-26 20:32:21.860583-04	192	None Agbor-Obal, Jezrael (Top Flight Gymnastics)	2	No fields changed.	39	1
518	2015-11-05 18:39:21.529368-05	152	Brewer, CJ (L4)  - Floor - None	3		41	1
519	2015-11-05 18:39:21.532004-05	153	Brewer, CJ (L4)  - Rings - None	3		41	1
520	2015-11-05 18:39:21.533141-05	154	Brewer, CJ (L4)  - Pommel Horse - None	3		41	1
521	2015-11-05 18:39:21.534206-05	155	Brewer, CJ (L4)  - Vault - None	3		41	1
522	2015-11-05 18:39:21.535274-05	156	Brewer, CJ (L4)  - Parallel Bars - None	3		41	1
523	2015-11-05 18:39:21.536273-05	157	Brewer, CJ (L4)  - High Bar - None	3		41	1
524	2015-11-05 18:39:21.53733-05	512	Gandia, Mason (L4)  - Floor - None	3		41	1
525	2015-11-05 18:39:21.538298-05	513	Gandia, Mason (L4)  - Rings - None	3		41	1
526	2015-11-05 18:39:21.539267-05	514	Gandia, Mason (L4)  - Pommel Horse - None	3		41	1
527	2015-11-05 18:39:21.540187-05	515	Gandia, Mason (L4)  - Vault - None	3		41	1
528	2015-11-05 18:39:21.541073-05	516	Gandia, Mason (L4)  - Parallel Bars - None	3		41	1
529	2015-11-05 18:39:21.54206-05	517	Gandia, Mason (L4)  - High Bar - None	3		41	1
530	2015-11-05 18:39:21.542991-05	584	Good, Stone (L4)  - Floor - None	3		41	1
531	2015-11-05 18:39:21.543907-05	585	Good, Stone (L4)  - Rings - None	3		41	1
532	2015-11-05 18:39:21.544917-05	586	Good, Stone (L4)  - Pommel Horse - None	3		41	1
533	2015-11-05 18:39:21.545841-05	587	Good, Stone (L4)  - Vault - None	3		41	1
534	2015-11-05 18:39:21.54673-05	588	Good, Stone (L4)  - Parallel Bars - None	3		41	1
535	2015-11-05 18:39:21.54766-05	589	Good, Stone (L4)  - High Bar - None	3		41	1
536	2015-11-05 18:39:21.548549-05	158	Bridges, Jayden (L5) 942336 - Floor - None	3		41	1
537	2015-11-05 18:39:21.549434-05	159	Bridges, Jayden (L5) 942336 - Rings - None	3		41	1
538	2015-11-05 18:39:21.550366-05	160	Bridges, Jayden (L5) 942336 - Pommel Horse - None	3		41	1
539	2015-11-05 18:39:21.551287-05	161	Bridges, Jayden (L5) 942336 - Vault - None	3		41	1
540	2015-11-05 18:39:21.552213-05	162	Bridges, Jayden (L5) 942336 - Parallel Bars - None	3		41	1
541	2015-11-05 18:39:21.5531-05	163	Bridges, Jayden (L5) 942336 - High Bar - None	3		41	1
542	2015-11-05 18:39:21.554025-05	164	Bridges, Justin (L5) 942338 - Floor - None	3		41	1
543	2015-11-05 18:39:21.554914-05	165	Bridges, Justin (L5) 942338 - Rings - None	3		41	1
544	2015-11-05 18:39:21.555899-05	166	Bridges, Justin (L5) 942338 - Pommel Horse - None	3		41	1
545	2015-11-05 18:39:21.557019-05	167	Bridges, Justin (L5) 942338 - Vault - None	3		41	1
546	2015-11-05 18:39:21.557986-05	168	Bridges, Justin (L5) 942338 - Parallel Bars - None	3		41	1
547	2015-11-05 18:39:21.558985-05	169	Bridges, Justin (L5) 942338 - High Bar - None	3		41	1
548	2015-11-05 18:39:21.559906-05	338	Davis, Tristan (L5) 970193 - Floor - None	3		41	1
549	2015-11-05 18:39:21.560821-05	339	Davis, Tristan (L5) 970193 - Rings - None	3		41	1
550	2015-11-05 18:39:21.561729-05	340	Davis, Tristan (L5) 970193 - Pommel Horse - None	3		41	1
551	2015-11-05 18:39:21.562632-05	341	Davis, Tristan (L5) 970193 - Vault - None	3		41	1
552	2015-11-05 18:39:21.564104-05	342	Davis, Tristan (L5) 970193 - Parallel Bars - None	3		41	1
553	2015-11-05 18:39:21.565094-05	343	Davis, Tristan (L5) 970193 - High Bar - None	3		41	1
554	2015-11-05 18:39:21.566019-05	482	Freeman, TJ (L5) 637230 - Floor - None	3		41	1
555	2015-11-05 18:39:21.566925-05	483	Freeman, TJ (L5) 637230 - Rings - None	3		41	1
556	2015-11-05 18:39:21.567905-05	484	Freeman, TJ (L5) 637230 - Pommel Horse - None	3		41	1
557	2015-11-05 18:39:21.568879-05	485	Freeman, TJ (L5) 637230 - Vault - None	3		41	1
558	2015-11-05 18:39:21.569799-05	486	Freeman, TJ (L5) 637230 - Parallel Bars - None	3		41	1
559	2015-11-05 18:39:21.570683-05	487	Freeman, TJ (L5) 637230 - High Bar - None	3		41	1
560	2015-11-05 18:39:21.571559-05	518	Gatewood, Remy (L5) 942339 - Floor - None	3		41	1
561	2015-11-05 18:39:21.572443-05	519	Gatewood, Remy (L5) 942339 - Rings - None	3		41	1
562	2015-11-05 18:39:21.573346-05	520	Gatewood, Remy (L5) 942339 - Pommel Horse - None	3		41	1
563	2015-11-05 18:39:21.575008-05	521	Gatewood, Remy (L5) 942339 - Vault - None	3		41	1
564	2015-11-05 18:39:21.576027-05	522	Gatewood, Remy (L5) 942339 - Parallel Bars - None	3		41	1
565	2015-11-05 18:39:21.576997-05	523	Gatewood, Remy (L5) 942339 - High Bar - None	3		41	1
566	2015-11-05 18:39:21.57794-05	632	Guida, Jacob (L5) 622274 - Floor - None	3		41	1
567	2015-11-05 18:39:21.579007-05	633	Guida, Jacob (L5) 622274 - Rings - None	3		41	1
568	2015-11-05 18:39:21.580024-05	634	Guida, Jacob (L5) 622274 - Pommel Horse - None	3		41	1
569	2015-11-05 18:39:21.581026-05	635	Guida, Jacob (L5) 622274 - Vault - None	3		41	1
570	2015-11-05 18:39:21.581952-05	636	Guida, Jacob (L5) 622274 - Parallel Bars - None	3		41	1
571	2015-11-05 18:39:21.582863-05	637	Guida, Jacob (L5) 622274 - High Bar - None	3		41	1
572	2015-11-05 18:39:21.58384-05	710	Haydysch, Connor (L5) 982056 - Floor - None	3		41	1
573	2015-11-05 18:39:21.584748-05	711	Haydysch, Connor (L5) 982056 - Rings - None	3		41	1
574	2015-11-05 18:39:21.585654-05	712	Haydysch, Connor (L5) 982056 - Pommel Horse - None	3		41	1
575	2015-11-05 18:39:21.586555-05	713	Haydysch, Connor (L5) 982056 - Vault - None	3		41	1
576	2015-11-05 18:39:21.587438-05	714	Haydysch, Connor (L5) 982056 - Parallel Bars - None	3		41	1
577	2015-11-05 18:39:21.588328-05	715	Haydysch, Connor (L5) 982056 - High Bar - None	3		41	1
578	2015-11-05 18:39:21.589299-05	884	Kellogg, Sean (L5) 628047 - Floor - None	3		41	1
579	2015-11-05 18:39:21.5903-05	885	Kellogg, Sean (L5) 628047 - Rings - None	3		41	1
580	2015-11-05 18:39:21.591336-05	886	Kellogg, Sean (L5) 628047 - Pommel Horse - None	3		41	1
581	2015-11-05 18:39:21.592257-05	887	Kellogg, Sean (L5) 628047 - Vault - None	3		41	1
582	2015-11-05 18:39:21.593248-05	888	Kellogg, Sean (L5) 628047 - Parallel Bars - None	3		41	1
583	2015-11-05 18:39:21.594197-05	889	Kellogg, Sean (L5) 628047 - High Bar - None	3		41	1
584	2015-11-05 18:39:21.595161-05	950	Lakin, Kai (L5) 622279 - Floor - None	3		41	1
585	2015-11-05 18:39:21.596143-05	951	Lakin, Kai (L5) 622279 - Rings - None	3		41	1
586	2015-11-05 18:39:21.597053-05	952	Lakin, Kai (L5) 622279 - Pommel Horse - None	3		41	1
587	2015-11-05 18:39:21.598062-05	953	Lakin, Kai (L5) 622279 - Vault - None	3		41	1
588	2015-11-05 18:39:21.598992-05	954	Lakin, Kai (L5) 622279 - Parallel Bars - None	3		41	1
589	2015-11-05 18:39:21.599904-05	955	Lakin, Kai (L5) 622279 - High Bar - None	3		41	1
590	2015-11-05 18:39:21.600851-05	1456	FLAGGED! Ryan, Lochrie (L5) 955643 - Floor - None	3		41	1
591	2015-11-05 18:39:21.601748-05	1457	FLAGGED! Ryan, Lochrie (L5) 955643 - Rings - None	3		41	1
592	2015-11-05 18:39:21.602652-05	1458	FLAGGED! Ryan, Lochrie (L5) 955643 - Pommel Horse - None	3		41	1
593	2015-11-05 18:39:21.603546-05	1459	FLAGGED! Ryan, Lochrie (L5) 955643 - Vault - None	3		41	1
594	2015-11-05 18:39:21.604444-05	1460	FLAGGED! Ryan, Lochrie (L5) 955643 - Parallel Bars - None	3		41	1
595	2015-11-05 18:39:21.605433-05	1461	FLAGGED! Ryan, Lochrie (L5) 955643 - High Bar - None	3		41	1
596	2015-11-05 18:39:21.606371-05	1750	Walker, Brennan (L5) 622288 - Floor - None	3		41	1
597	2015-11-05 18:39:21.607302-05	1751	Walker, Brennan (L5) 622288 - Rings - None	3		41	1
598	2015-11-05 18:39:21.608195-05	1752	Walker, Brennan (L5) 622288 - Pommel Horse - None	3		41	1
599	2015-11-05 18:39:21.609109-05	1753	Walker, Brennan (L5) 622288 - Vault - None	3		41	1
600	2015-11-05 18:39:21.610081-05	1754	Walker, Brennan (L5) 622288 - Parallel Bars - None	3		41	1
601	2015-11-05 18:39:21.610974-05	1755	Walker, Brennan (L5) 622288 - High Bar - None	3		41	1
602	2015-11-05 18:39:21.611896-05	206	Carter, Matt (L6) 622268 - Floor - None	3		41	1
603	2015-11-05 18:39:21.612895-05	207	Carter, Matt (L6) 622268 - Rings - None	3		41	1
604	2015-11-05 18:39:21.6141-05	208	Carter, Matt (L6) 622268 - Pommel Horse - None	3		41	1
605	2015-11-05 18:39:21.615003-05	209	Carter, Matt (L6) 622268 - Vault - None	3		41	1
606	2015-11-05 18:39:21.615888-05	210	Carter, Matt (L6) 622268 - Parallel Bars - None	3		41	1
607	2015-11-05 18:39:21.616825-05	211	Carter, Matt (L6) 622268 - High Bar - None	3		41	1
608	2015-11-05 18:39:21.617734-05	692	Harwood, Remy (L6) 942340 - Floor - None	3		41	1
609	2015-11-05 18:39:21.618628-05	693	Harwood, Remy (L6) 942340 - Rings - None	3		41	1
610	2015-11-05 18:39:21.619508-05	694	Harwood, Remy (L6) 942340 - Pommel Horse - None	3		41	1
611	2015-11-05 18:39:21.620499-05	695	Harwood, Remy (L6) 942340 - Vault - None	3		41	1
612	2015-11-05 18:39:21.621416-05	696	Harwood, Remy (L6) 942340 - Parallel Bars - None	3		41	1
613	2015-11-05 18:39:21.622315-05	697	Harwood, Remy (L6) 942340 - High Bar - None	3		41	1
614	2015-11-05 18:39:21.623341-05	1197	Morrison, Caleb (L6) 622283 - Floor - None	3		41	1
615	2015-11-05 18:39:21.624286-05	1198	Morrison, Caleb (L6) 622283 - Rings - None	3		41	1
616	2015-11-05 18:39:21.625195-05	1199	Morrison, Caleb (L6) 622283 - Pommel Horse - None	3		41	1
617	2015-11-05 18:39:21.6261-05	1200	Morrison, Caleb (L6) 622283 - Vault - None	3		41	1
618	2015-11-05 18:39:21.626993-05	1201	Morrison, Caleb (L6) 622283 - Parallel Bars - None	3		41	1
619	2015-11-05 18:39:21.627913-05	1202	Morrison, Caleb (L6) 622283 - High Bar - None	3		41	1
620	2015-11-05 18:39:21.628808-05	1684	FLAGGED! Thurston , Jack (L6) 661303 - Floor - None	3		41	1
621	2015-11-05 18:39:21.629691-05	1685	FLAGGED! Thurston , Jack (L6) 661303 - Rings - None	3		41	1
622	2015-11-05 18:39:21.630571-05	1686	FLAGGED! Thurston , Jack (L6) 661303 - Pommel Horse - None	3		41	1
623	2015-11-05 18:39:21.631458-05	1687	FLAGGED! Thurston , Jack (L6) 661303 - Vault - None	3		41	1
624	2015-11-05 18:39:21.632394-05	1688	FLAGGED! Thurston , Jack (L6) 661303 - Parallel Bars - None	3		41	1
625	2015-11-05 18:39:21.63328-05	1689	FLAGGED! Thurston , Jack (L6) 661303 - High Bar - None	3		41	1
626	2015-11-05 18:39:21.634198-05	590	Granados, Zachary (L7)  - Floor - None	3		41	1
627	2015-11-05 18:39:21.635188-05	591	Granados, Zachary (L7)  - Rings - None	3		41	1
628	2015-11-05 18:39:21.636156-05	592	Granados, Zachary (L7)  - Pommel Horse - None	3		41	1
629	2015-11-05 18:39:21.637089-05	593	Granados, Zachary (L7)  - Vault - None	3		41	1
630	2015-11-05 18:39:21.638108-05	594	Granados, Zachary (L7)  - Parallel Bars - None	3		41	1
631	2015-11-05 18:39:21.639066-05	595	Granados, Zachary (L7)  - High Bar - None	3		41	1
632	2015-11-05 18:39:21.640043-05	812	Isbell, Matvei (L7) 495813 - Floor - None	3		41	1
633	2015-11-05 18:39:21.640989-05	813	Isbell, Matvei (L7) 495813 - Rings - None	3		41	1
634	2015-11-05 18:39:21.641915-05	814	Isbell, Matvei (L7) 495813 - Pommel Horse - None	3		41	1
635	2015-11-05 18:39:21.642849-05	815	Isbell, Matvei (L7) 495813 - Vault - None	3		41	1
636	2015-11-05 18:39:21.644187-05	816	Isbell, Matvei (L7) 495813 - Parallel Bars - None	3		41	1
637	2015-11-05 18:39:21.645442-05	817	Isbell, Matvei (L7) 495813 - High Bar - None	3		41	1
638	2015-11-05 18:39:21.646394-05	1022	Lippy, Elliot (L7) 627271 - Floor - None	3		41	1
639	2015-11-05 18:39:21.64735-05	1023	Lippy, Elliot (L7) 627271 - Rings - None	3		41	1
640	2015-11-05 18:39:21.64828-05	1024	Lippy, Elliot (L7) 627271 - Pommel Horse - None	3		41	1
641	2015-11-05 18:39:21.649245-05	1025	Lippy, Elliot (L7) 627271 - Vault - None	3		41	1
642	2015-11-05 18:39:21.650172-05	1026	Lippy, Elliot (L7) 627271 - Parallel Bars - None	3		41	1
643	2015-11-05 18:39:21.651097-05	1027	Lippy, Elliot (L7) 627271 - High Bar - None	3		41	1
644	2015-11-05 18:39:21.652015-05	1143	Melton, Caleb (L7)  - Floor - None	3		41	1
645	2015-11-05 18:39:21.652936-05	1144	Melton, Caleb (L7)  - Rings - None	3		41	1
646	2015-11-05 18:39:21.653855-05	1145	Melton, Caleb (L7)  - Pommel Horse - None	3		41	1
647	2015-11-05 18:39:21.654879-05	1146	Melton, Caleb (L7)  - Vault - None	3		41	1
648	2015-11-05 18:39:21.655817-05	1147	Melton, Caleb (L7)  - Parallel Bars - None	3		41	1
649	2015-11-05 18:39:21.656737-05	1148	Melton, Caleb (L7)  - High Bar - None	3		41	1
650	2015-11-05 18:39:21.657688-05	1270	Noah, Simons (L7)  - Floor - None	3		41	1
651	2015-11-05 18:39:21.658664-05	1271	Noah, Simons (L7)  - Rings - None	3		41	1
652	2015-11-05 18:39:21.659584-05	1272	Noah, Simons (L7)  - Pommel Horse - None	3		41	1
653	2015-11-05 18:39:21.660491-05	1273	Noah, Simons (L7)  - Vault - None	3		41	1
654	2015-11-05 18:39:21.661399-05	1274	Noah, Simons (L7)  - Parallel Bars - None	3		41	1
655	2015-11-05 18:39:21.662324-05	1275	Noah, Simons (L7)  - High Bar - None	3		41	1
656	2015-11-05 18:39:21.663256-05	572	Gomez, Jarel (L8)  - Floor - None	3		41	1
657	2015-11-05 18:39:21.664313-05	573	Gomez, Jarel (L8)  - Rings - None	3		41	1
658	2015-11-05 18:39:21.665326-05	574	Gomez, Jarel (L8)  - Pommel Horse - None	3		41	1
659	2015-11-05 18:39:21.666316-05	575	Gomez, Jarel (L8)  - Vault - None	3		41	1
660	2015-11-05 18:39:21.667361-05	576	Gomez, Jarel (L8)  - Parallel Bars - None	3		41	1
661	2015-11-05 18:39:21.668305-05	577	Gomez, Jarel (L8)  - High Bar - None	3		41	1
662	2015-11-05 18:39:21.669236-05	1552	Shilling, Kyle (L8) 457824 - Floor - None	3		41	1
663	2015-11-05 18:39:21.670159-05	1553	Shilling, Kyle (L8) 457824 - Rings - None	3		41	1
664	2015-11-05 18:39:21.671107-05	1554	Shilling, Kyle (L8) 457824 - Pommel Horse - None	3		41	1
665	2015-11-05 18:39:21.672113-05	1555	Shilling, Kyle (L8) 457824 - Vault - None	3		41	1
666	2015-11-05 18:39:21.673065-05	1556	Shilling, Kyle (L8) 457824 - Parallel Bars - None	3		41	1
667	2015-11-05 18:39:21.674084-05	1557	Shilling, Kyle (L8) 457824 - High Bar - None	3		41	1
668	2015-11-05 18:39:21.675016-05	554	Golden, Aaron (L9) 431070 - Floor - None	3		41	1
669	2015-11-05 18:39:21.675969-05	555	Golden, Aaron (L9) 431070 - Rings - None	3		41	1
670	2015-11-05 18:39:21.67689-05	556	Golden, Aaron (L9) 431070 - Pommel Horse - None	3		41	1
671	2015-11-05 18:39:21.67787-05	557	Golden, Aaron (L9) 431070 - Vault - None	3		41	1
672	2015-11-05 18:39:21.678819-05	558	Golden, Aaron (L9) 431070 - Parallel Bars - None	3		41	1
673	2015-11-05 18:39:21.679681-05	559	Golden, Aaron (L9) 431070 - High Bar - None	3		41	1
674	2015-11-05 18:39:21.680581-05	566	Golden, Samuel (L9) 431067 - Floor - None	3		41	1
675	2015-11-05 18:39:21.681496-05	567	Golden, Samuel (L9) 431067 - Rings - None	3		41	1
676	2015-11-05 18:39:21.682394-05	568	Golden, Samuel (L9) 431067 - Pommel Horse - None	3		41	1
677	2015-11-05 18:39:21.683326-05	569	Golden, Samuel (L9) 431067 - Vault - None	3		41	1
678	2015-11-05 18:39:21.684226-05	570	Golden, Samuel (L9) 431067 - Parallel Bars - None	3		41	1
679	2015-11-05 18:39:21.685144-05	571	Golden, Samuel (L9) 431067 - High Bar - None	3		41	1
680	2015-11-05 18:39:21.68604-05	1179	Moore, Xavier (L9)  - Floor - None	3		41	1
681	2015-11-05 18:39:21.687402-05	1180	Moore, Xavier (L9)  - Rings - None	3		41	1
682	2015-11-05 18:39:21.688354-05	1181	Moore, Xavier (L9)  - Pommel Horse - None	3		41	1
683	2015-11-05 18:39:21.689701-05	1182	Moore, Xavier (L9)  - Vault - None	3		41	1
684	2015-11-05 18:39:21.690726-05	1183	Moore, Xavier (L9)  - Parallel Bars - None	3		41	1
685	2015-11-05 18:39:21.69167-05	1184	Moore, Xavier (L9)  - High Bar - None	3		41	1
686	2015-11-05 18:39:21.692596-05	1348	Policarpo, Joao (L9)  - Floor - None	3		41	1
687	2015-11-05 18:39:21.693646-05	1349	Policarpo, Joao (L9)  - Rings - None	3		41	1
688	2015-11-05 18:39:21.694588-05	1350	Policarpo, Joao (L9)  - Pommel Horse - None	3		41	1
689	2015-11-05 18:39:21.695536-05	1351	Policarpo, Joao (L9)  - Vault - None	3		41	1
690	2015-11-05 18:39:21.696468-05	1352	Policarpo, Joao (L9)  - Parallel Bars - None	3		41	1
691	2015-11-05 18:39:21.697417-05	1353	Policarpo, Joao (L9)  - High Bar - None	3		41	1
692	2015-11-05 18:39:21.69833-05	1588	Sipes, Owen (L9)  - Floor - None	3		41	1
693	2015-11-05 18:39:21.699241-05	1589	Sipes, Owen (L9)  - Rings - None	3		41	1
694	2015-11-05 18:39:21.700131-05	1590	Sipes, Owen (L9)  - Pommel Horse - None	3		41	1
695	2015-11-05 18:39:21.70102-05	1591	Sipes, Owen (L9)  - Vault - None	3		41	1
696	2015-11-05 18:39:21.701917-05	1592	Sipes, Owen (L9)  - Parallel Bars - None	3		41	1
697	2015-11-05 18:39:21.70282-05	1593	Sipes, Owen (L9)  - High Bar - None	3		41	1
698	2015-11-05 18:39:21.703739-05	1798	Woodard, Tyrus (L9)  - Floor - None	3		41	1
699	2015-11-05 18:39:21.704628-05	1799	Woodard, Tyrus (L9)  - Rings - None	3		41	1
700	2015-11-05 18:39:21.705519-05	1800	Woodard, Tyrus (L9)  - Pommel Horse - None	3		41	1
701	2015-11-05 18:39:21.706498-05	1801	Woodard, Tyrus (L9)  - Vault - None	3		41	1
702	2015-11-05 18:39:21.707541-05	1802	Woodard, Tyrus (L9)  - Parallel Bars - None	3		41	1
703	2015-11-05 18:39:21.708492-05	1803	Woodard, Tyrus (L9)  - High Bar - None	3		41	1
704	2015-11-05 18:39:21.709405-05	626	Griffin, Solomon (L10) 427885 - Floor - None	3		41	1
705	2015-11-05 18:39:21.710611-05	627	Griffin, Solomon (L10) 427885 - Rings - None	3		41	1
706	2015-11-05 18:39:21.71156-05	628	Griffin, Solomon (L10) 427885 - Pommel Horse - None	3		41	1
707	2015-11-05 18:39:21.712474-05	629	Griffin, Solomon (L10) 427885 - Vault - None	3		41	1
708	2015-11-05 18:39:21.713439-05	630	Griffin, Solomon (L10) 427885 - Parallel Bars - None	3		41	1
709	2015-11-05 18:39:21.714379-05	631	Griffin, Solomon (L10) 427885 - High Bar - None	3		41	1
710	2015-11-05 18:39:21.715271-05	770	Holloway, Ryan (L10) 297601 - Floor - None	3		41	1
711	2015-11-05 18:39:21.716159-05	771	Holloway, Ryan (L10) 297601 - Rings - None	3		41	1
712	2015-11-05 18:39:21.717058-05	772	Holloway, Ryan (L10) 297601 - Pommel Horse - None	3		41	1
713	2015-11-05 18:39:21.718042-05	773	Holloway, Ryan (L10) 297601 - Vault - None	3		41	1
714	2015-11-05 18:39:21.718947-05	774	Holloway, Ryan (L10) 297601 - Parallel Bars - None	3		41	1
715	2015-11-05 18:39:21.719888-05	775	Holloway, Ryan (L10) 297601 - High Bar - None	3		41	1
716	2015-11-05 18:39:21.720805-05	866	Kasiski, Garrett (L10) 420868 - Floor - None	3		41	1
717	2015-11-05 18:39:21.721746-05	867	Kasiski, Garrett (L10) 420868 - Rings - None	3		41	1
718	2015-11-05 18:39:21.722661-05	868	Kasiski, Garrett (L10) 420868 - Pommel Horse - None	3		41	1
719	2015-11-05 18:39:21.723543-05	869	Kasiski, Garrett (L10) 420868 - Vault - None	3		41	1
720	2015-11-05 18:39:21.724478-05	870	Kasiski, Garrett (L10) 420868 - Parallel Bars - None	3		41	1
721	2015-11-05 18:39:21.725409-05	871	Kasiski, Garrett (L10) 420868 - High Bar - None	3		41	1
722	2015-11-05 18:39:21.726344-05	944	Ladner, Joey (L10) 389053 - Floor - None	3		41	1
723	2015-11-05 18:39:21.727253-05	945	Ladner, Joey (L10) 389053 - Rings - None	3		41	1
724	2015-11-05 18:39:21.728231-05	946	Ladner, Joey (L10) 389053 - Pommel Horse - None	3		41	1
725	2015-11-05 18:39:21.729119-05	947	Ladner, Joey (L10) 389053 - Vault - None	3		41	1
726	2015-11-05 18:39:21.730094-05	948	Ladner, Joey (L10) 389053 - Parallel Bars - None	3		41	1
727	2015-11-05 18:39:21.7311-05	949	Ladner, Joey (L10) 389053 - High Bar - None	3		41	1
728	2015-11-05 18:39:21.732045-05	1125	McCord, Chris (L10) 205892 - Floor - None	3		41	1
729	2015-11-05 18:39:21.732979-05	1126	McCord, Chris (L10) 205892 - Rings - None	3		41	1
730	2015-11-05 18:39:21.733922-05	1127	McCord, Chris (L10) 205892 - Pommel Horse - None	3		41	1
731	2015-11-05 18:39:21.73485-05	1128	McCord, Chris (L10) 205892 - Vault - None	3		41	1
732	2015-11-05 18:39:21.735767-05	1129	McCord, Chris (L10) 205892 - Parallel Bars - None	3		41	1
733	2015-11-05 18:39:21.736713-05	1130	McCord, Chris (L10) 205892 - High Bar - None	3		41	1
734	2015-11-05 18:39:21.737637-05	1294	Palacios, Isaac (L10) 438122 - Floor - None	3		41	1
735	2015-11-05 18:39:21.73856-05	1295	Palacios, Isaac (L10) 438122 - Rings - None	3		41	1
736	2015-11-05 18:39:21.73953-05	1296	Palacios, Isaac (L10) 438122 - Pommel Horse - None	3		41	1
737	2015-11-05 18:39:21.740833-05	1297	Palacios, Isaac (L10) 438122 - Vault - None	3		41	1
738	2015-11-05 18:39:21.741989-05	1298	Palacios, Isaac (L10) 438122 - Parallel Bars - None	3		41	1
739	2015-11-05 18:39:21.742967-05	1299	Palacios, Isaac (L10) 438122 - High Bar - None	3		41	1
740	2015-11-05 18:39:21.743998-05	1058	FLAGGED! Maletzky, Jeremy (L5) 958086 - Floor - None	3		41	1
741	2015-11-05 18:39:21.744958-05	1059	FLAGGED! Maletzky, Jeremy (L5) 958086 - Rings - None	3		41	1
742	2015-11-05 18:39:21.745893-05	1060	FLAGGED! Maletzky, Jeremy (L5) 958086 - Pommel Horse - None	3		41	1
743	2015-11-05 18:39:21.746831-05	1061	FLAGGED! Maletzky, Jeremy (L5) 958086 - Vault - None	3		41	1
744	2015-11-05 18:39:21.747779-05	1062	FLAGGED! Maletzky, Jeremy (L5) 958086 - Parallel Bars - None	3		41	1
745	2015-11-05 18:39:21.748711-05	1063	FLAGGED! Maletzky, Jeremy (L5) 958086 - High Bar - None	3		41	1
746	2015-11-05 18:39:21.749613-05	872	Kaus, Ryan (L5) 577616 - Floor - None	3		41	1
747	2015-11-05 18:39:21.750527-05	873	Kaus, Ryan (L5) 577616 - Rings - None	3		41	1
748	2015-11-05 18:39:21.751458-05	874	Kaus, Ryan (L5) 577616 - Pommel Horse - None	3		41	1
749	2015-11-05 18:39:21.75238-05	875	Kaus, Ryan (L5) 577616 - Vault - None	3		41	1
750	2015-11-05 18:39:21.753339-05	876	Kaus, Ryan (L5) 577616 - Parallel Bars - None	3		41	1
751	2015-11-05 18:39:21.754237-05	877	Kaus, Ryan (L5) 577616 - High Bar - None	3		41	1
752	2015-11-05 18:39:21.755193-05	848	FLAGGED! Joseph, Schneider (L5) 571338 - Floor - None	3		41	1
753	2015-11-05 18:39:21.756216-05	849	FLAGGED! Joseph, Schneider (L5) 571338 - Rings - None	3		41	1
754	2015-11-05 18:39:21.757134-05	850	FLAGGED! Joseph, Schneider (L5) 571338 - Pommel Horse - None	3		41	1
755	2015-11-05 18:39:21.758446-05	851	FLAGGED! Joseph, Schneider (L5) 571338 - Vault - None	3		41	1
756	2015-11-05 18:39:21.759476-05	852	FLAGGED! Joseph, Schneider (L5) 571338 - Parallel Bars - None	3		41	1
757	2015-11-05 18:39:21.760427-05	853	FLAGGED! Joseph, Schneider (L5) 571338 - High Bar - None	3		41	1
758	2015-11-05 18:39:21.761365-05	362	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Floor - None	3		41	1
759	2015-11-05 18:39:21.762343-05	363	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Rings - None	3		41	1
760	2015-11-05 18:39:21.763323-05	364	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Pommel Horse - None	3		41	1
761	2015-11-05 18:39:21.764348-05	365	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Vault - None	3		41	1
762	2015-11-05 18:39:21.765334-05	366	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Parallel Bars - None	3		41	1
763	2015-11-05 18:39:21.766318-05	367	FLAGGED! Dhayagude, Nikhil (L8) 571419 - High Bar - None	3		41	1
764	2015-11-05 18:39:21.767263-05	764	Hoberman, Benjamin (L5) 574047 - Floor - None	3		41	1
765	2015-11-05 18:39:21.768213-05	765	Hoberman, Benjamin (L5) 574047 - Rings - None	3		41	1
766	2015-11-05 18:39:21.769151-05	766	Hoberman, Benjamin (L5) 574047 - Pommel Horse - None	3		41	1
767	2015-11-05 18:39:21.77007-05	767	Hoberman, Benjamin (L5) 574047 - Vault - None	3		41	1
768	2015-11-05 18:39:21.770993-05	768	Hoberman, Benjamin (L5) 574047 - Parallel Bars - None	3		41	1
769	2015-11-05 18:39:21.771848-05	769	Hoberman, Benjamin (L5) 574047 - High Bar - None	3		41	1
770	2015-11-05 18:39:21.772751-05	14	Aksu, Aslan (L5) 629300 - Floor - None	3		41	1
771	2015-11-05 18:39:21.773757-05	15	Aksu, Aslan (L5) 629300 - Rings - None	3		41	1
772	2015-11-05 18:39:21.774765-05	16	Aksu, Aslan (L5) 629300 - Pommel Horse - None	3		41	1
773	2015-11-05 18:39:21.775757-05	17	Aksu, Aslan (L5) 629300 - Vault - None	3		41	1
774	2015-11-05 18:39:21.776728-05	18	Aksu, Aslan (L5) 629300 - Parallel Bars - None	3		41	1
775	2015-11-05 18:39:21.77768-05	19	Aksu, Aslan (L5) 629300 - High Bar - None	3		41	1
776	2015-11-05 18:39:21.779002-05	1480	Samuel, Issac (L5) 577619 - Floor - None	3		41	1
777	2015-11-05 18:39:21.780032-05	1481	Samuel, Issac (L5) 577619 - Rings - None	3		41	1
778	2015-11-05 18:39:21.781765-05	1482	Samuel, Issac (L5) 577619 - Pommel Horse - None	3		41	1
779	2015-11-05 18:39:21.782774-05	1483	Samuel, Issac (L5) 577619 - Vault - None	3		41	1
780	2015-11-05 18:39:21.783741-05	1484	Samuel, Issac (L5) 577619 - Parallel Bars - None	3		41	1
781	2015-11-05 18:39:21.784684-05	1485	Samuel, Issac (L5) 577619 - High Bar - None	3		41	1
782	2015-11-05 18:39:21.78562-05	974	Lee, Sullivan (L6) 571413 - Floor - None	3		41	1
783	2015-11-05 18:39:21.786545-05	975	Lee, Sullivan (L6) 571413 - Rings - None	3		41	1
784	2015-11-05 18:39:21.787439-05	976	Lee, Sullivan (L6) 571413 - Pommel Horse - None	3		41	1
785	2015-11-05 18:39:21.788483-05	977	Lee, Sullivan (L6) 571413 - Vault - None	3		41	1
786	2015-11-05 18:39:21.789432-05	978	Lee, Sullivan (L6) 571413 - Parallel Bars - None	3		41	1
787	2015-11-05 18:39:21.790424-05	979	Lee, Sullivan (L6) 571413 - High Bar - None	3		41	1
788	2015-11-05 18:39:21.791399-05	1070	Marchenko, Vlad (L6) 968415 - Floor - None	3		41	1
789	2015-11-05 18:39:21.792338-05	1071	Marchenko, Vlad (L6) 968415 - Rings - None	3		41	1
790	2015-11-05 18:39:21.793333-05	1072	Marchenko, Vlad (L6) 968415 - Pommel Horse - None	3		41	1
791	2015-11-05 18:39:21.794261-05	1073	Marchenko, Vlad (L6) 968415 - Vault - None	3		41	1
792	2015-11-05 18:39:21.795205-05	1074	Marchenko, Vlad (L6) 968415 - Parallel Bars - None	3		41	1
793	2015-11-05 18:39:21.796155-05	1075	Marchenko, Vlad (L6) 968415 - High Bar - None	3		41	1
794	2015-11-05 18:39:21.797106-05	914	Kraft, Colin (L6) 509832 - Floor - None	3		41	1
795	2015-11-05 18:39:21.798086-05	915	Kraft, Colin (L6) 509832 - Rings - None	3		41	1
796	2015-11-05 18:39:21.799021-05	916	Kraft, Colin (L6) 509832 - Pommel Horse - None	3		41	1
797	2015-11-05 18:39:21.800021-05	917	Kraft, Colin (L6) 509832 - Vault - None	3		41	1
798	2015-11-05 18:39:21.800962-05	918	Kraft, Colin (L6) 509832 - Parallel Bars - None	3		41	1
799	2015-11-05 18:39:21.801883-05	919	Kraft, Colin (L6) 509832 - High Bar - None	3		41	1
800	2015-11-05 18:39:21.803114-05	1666	FLAGGED! Thackston, Parker (L8) 471446 - Floor - None	3		41	1
801	2015-11-05 18:39:21.804086-05	1667	FLAGGED! Thackston, Parker (L8) 471446 - Rings - None	3		41	1
802	2015-11-05 18:39:21.805011-05	1668	FLAGGED! Thackston, Parker (L8) 471446 - Pommel Horse - None	3		41	1
803	2015-11-05 18:39:21.805944-05	1669	FLAGGED! Thackston, Parker (L8) 471446 - Vault - None	3		41	1
804	2015-11-05 18:39:21.806878-05	1670	FLAGGED! Thackston, Parker (L8) 471446 - Parallel Bars - None	3		41	1
805	2015-11-05 18:39:21.807818-05	1671	FLAGGED! Thackston, Parker (L8) 471446 - High Bar - None	3		41	1
806	2015-11-05 18:39:21.808866-05	452	Feltquate, Jakob (L8) 509427 - Floor - None	3		41	1
807	2015-11-05 18:39:21.809807-05	453	Feltquate, Jakob (L8) 509427 - Rings - None	3		41	1
808	2015-11-05 18:39:21.810747-05	454	Feltquate, Jakob (L8) 509427 - Pommel Horse - None	3		41	1
809	2015-11-05 18:39:21.811679-05	455	Feltquate, Jakob (L8) 509427 - Vault - None	3		41	1
810	2015-11-05 18:39:21.812645-05	456	Feltquate, Jakob (L8) 509427 - Parallel Bars - None	3		41	1
811	2015-11-05 18:39:21.81365-05	457	Feltquate, Jakob (L8) 509427 - High Bar - None	3		41	1
812	2015-11-05 18:39:21.814611-05	1612	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Floor - None	3		41	1
813	2015-11-05 18:39:21.815586-05	1613	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Rings - None	3		41	1
814	2015-11-05 18:39:21.816537-05	1614	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Pommel Horse - None	3		41	1
815	2015-11-05 18:39:21.817471-05	1615	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Vault - None	3		41	1
816	2015-11-05 18:39:21.818468-05	1616	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Parallel Bars - None	3		41	1
817	2015-11-05 18:39:21.819377-05	1617	FLAGGED! Spagnoletti, P.J. (L9) 537029 - High Bar - None	3		41	1
818	2015-11-05 18:39:21.820314-05	1720	FLAGGED! Vaughn, Dylan (L9) 440614 - Floor - None	3		41	1
819	2015-11-05 18:39:21.821169-05	1721	FLAGGED! Vaughn, Dylan (L9) 440614 - Rings - None	3		41	1
820	2015-11-05 18:39:21.822119-05	1722	FLAGGED! Vaughn, Dylan (L9) 440614 - Pommel Horse - None	3		41	1
821	2015-11-05 18:39:21.823062-05	1723	FLAGGED! Vaughn, Dylan (L9) 440614 - Vault - None	3		41	1
822	2015-11-05 18:39:21.824076-05	1724	FLAGGED! Vaughn, Dylan (L9) 440614 - Parallel Bars - None	3		41	1
823	2015-11-05 18:39:21.825062-05	1725	FLAGGED! Vaughn, Dylan (L9) 440614 - High Bar - None	3		41	1
824	2015-11-05 18:39:21.826008-05	1600	FLAGGED! Smith, Brendan (L10) 523711 - Floor - None	3		41	1
825	2015-11-05 18:39:21.82693-05	1601	FLAGGED! Smith, Brendan (L10) 523711 - Rings - None	3		41	1
826	2015-11-05 18:39:21.827854-05	1602	FLAGGED! Smith, Brendan (L10) 523711 - Pommel Horse - None	3		41	1
827	2015-11-05 18:39:21.828796-05	1603	FLAGGED! Smith, Brendan (L10) 523711 - Vault - None	3		41	1
828	2015-11-05 18:39:21.829689-05	1604	FLAGGED! Smith, Brendan (L10) 523711 - Parallel Bars - None	3		41	1
829	2015-11-05 18:39:21.830604-05	1605	FLAGGED! Smith, Brendan (L10) 523711 - High Bar - None	3		41	1
830	2015-11-05 18:39:21.831497-05	1300	Patrizio, Harrison (L10) 212820 - Floor - None	3		41	1
831	2015-11-05 18:39:21.832373-05	1301	Patrizio, Harrison (L10) 212820 - Rings - None	3		41	1
832	2015-11-05 18:39:21.833363-05	1302	Patrizio, Harrison (L10) 212820 - Pommel Horse - None	3		41	1
833	2015-11-05 18:39:21.834273-05	1303	Patrizio, Harrison (L10) 212820 - Vault - None	3		41	1
834	2015-11-05 18:39:21.835245-05	1304	Patrizio, Harrison (L10) 212820 - Parallel Bars - None	3		41	1
835	2015-11-05 18:39:21.836223-05	1305	Patrizio, Harrison (L10) 212820 - High Bar - None	3		41	1
836	2015-11-05 18:39:21.837176-05	314	Damanti, Joey (L5) 956183 - Floor - None	3		41	1
837	2015-11-05 18:39:21.838111-05	315	Damanti, Joey (L5) 956183 - Rings - None	3		41	1
838	2015-11-05 18:39:21.839034-05	316	Damanti, Joey (L5) 956183 - Pommel Horse - None	3		41	1
839	2015-11-05 18:39:21.839965-05	317	Damanti, Joey (L5) 956183 - Vault - None	3		41	1
840	2015-11-05 18:39:21.8409-05	318	Damanti, Joey (L5) 956183 - Parallel Bars - None	3		41	1
841	2015-11-05 18:39:21.841857-05	319	Damanti, Joey (L5) 956183 - High Bar - None	3		41	1
842	2015-11-05 18:39:21.842794-05	1606	Sobusiak, Kevin (L5) 956182 - Floor - None	3		41	1
843	2015-11-05 18:39:21.843726-05	1607	Sobusiak, Kevin (L5) 956182 - Rings - None	3		41	1
844	2015-11-05 18:39:21.844712-05	1608	Sobusiak, Kevin (L5) 956182 - Pommel Horse - None	3		41	1
845	2015-11-05 18:39:21.845693-05	1609	Sobusiak, Kevin (L5) 956182 - Vault - None	3		41	1
846	2015-11-05 18:39:21.846596-05	1610	Sobusiak, Kevin (L5) 956182 - Parallel Bars - None	3		41	1
847	2015-11-05 18:39:21.847569-05	1611	Sobusiak, Kevin (L5) 956182 - High Bar - None	3		41	1
848	2015-11-05 18:39:21.848491-05	410	FLAGGED! Esberg, Adin (L6) 626828 - Floor - None	3		41	1
849	2015-11-05 18:39:21.849419-05	411	FLAGGED! Esberg, Adin (L6) 626828 - Rings - None	3		41	1
850	2015-11-05 18:39:21.850366-05	412	FLAGGED! Esberg, Adin (L6) 626828 - Pommel Horse - None	3		41	1
851	2015-11-05 18:39:21.851292-05	413	FLAGGED! Esberg, Adin (L6) 626828 - Vault - None	3		41	1
852	2015-11-05 18:39:21.852184-05	414	FLAGGED! Esberg, Adin (L6) 626828 - Parallel Bars - None	3		41	1
853	2015-11-05 18:39:21.853093-05	415	FLAGGED! Esberg, Adin (L6) 626828 - High Bar - None	3		41	1
854	2015-11-05 18:39:21.854019-05	1336	Phillipps, Josh (L6) 629454 - Floor - None	3		41	1
855	2015-11-05 18:39:21.854915-05	1337	Phillipps, Josh (L6) 629454 - Rings - None	3		41	1
1443	2015-11-05 18:39:22.416447-05	801	Im, Ozzy (L4)  - Rings - None	3		41	1
856	2015-11-05 18:39:21.855827-05	1338	Phillipps, Josh (L6) 629454 - Pommel Horse - None	3		41	1
857	2015-11-05 18:39:21.856746-05	1339	Phillipps, Josh (L6) 629454 - Vault - None	3		41	1
858	2015-11-05 18:39:21.857924-05	1340	Phillipps, Josh (L6) 629454 - Parallel Bars - None	3		41	1
859	2015-11-05 18:39:21.858824-05	1341	Phillipps, Josh (L6) 629454 - High Bar - None	3		41	1
860	2015-11-05 18:39:21.859808-05	416	Evans, Caleb (L9) 468234 - Floor - None	3		41	1
861	2015-11-05 18:39:21.86078-05	417	Evans, Caleb (L9) 468234 - Rings - None	3		41	1
862	2015-11-05 18:39:21.861723-05	418	Evans, Caleb (L9) 468234 - Pommel Horse - None	3		41	1
863	2015-11-05 18:39:21.862661-05	419	Evans, Caleb (L9) 468234 - Vault - None	3		41	1
864	2015-11-05 18:39:21.863587-05	420	Evans, Caleb (L9) 468234 - Parallel Bars - None	3		41	1
865	2015-11-05 18:39:21.864652-05	421	Evans, Caleb (L9) 468234 - High Bar - None	3		41	1
866	2015-11-05 18:39:21.865627-05	26	FLAGGED! Altwater, Antony (L5) 959356 - Floor - None	3		41	1
867	2015-11-05 18:39:21.866575-05	27	FLAGGED! Altwater, Antony (L5) 959356 - Rings - None	3		41	1
868	2015-11-05 18:39:21.867492-05	28	FLAGGED! Altwater, Antony (L5) 959356 - Pommel Horse - None	3		41	1
869	2015-11-05 18:39:21.868421-05	29	FLAGGED! Altwater, Antony (L5) 959356 - Vault - None	3		41	1
870	2015-11-05 18:39:21.869384-05	30	FLAGGED! Altwater, Antony (L5) 959356 - Parallel Bars - None	3		41	1
871	2015-11-05 18:39:21.870281-05	31	FLAGGED! Altwater, Antony (L5) 959356 - High Bar - None	3		41	1
872	2015-11-05 18:39:21.871151-05	308	Dahllof, Caleb (L4) 959353 - Floor - None	3		41	1
873	2015-11-05 18:39:21.872128-05	309	Dahllof, Caleb (L4) 959353 - Rings - None	3		41	1
874	2015-11-05 18:39:21.873075-05	310	Dahllof, Caleb (L4) 959353 - Pommel Horse - None	3		41	1
875	2015-11-05 18:39:21.873986-05	311	Dahllof, Caleb (L4) 959353 - Vault - None	3		41	1
876	2015-11-05 18:39:21.874909-05	312	Dahllof, Caleb (L4) 959353 - Parallel Bars - None	3		41	1
877	2015-11-05 18:39:21.875868-05	313	Dahllof, Caleb (L4) 959353 - High Bar - None	3		41	1
878	2015-11-05 18:39:21.876779-05	422	Fabian, Owen (L4) 959359 - Floor - None	3		41	1
879	2015-11-05 18:39:21.877745-05	423	Fabian, Owen (L4) 959359 - Rings - None	3		41	1
880	2015-11-05 18:39:21.878692-05	424	Fabian, Owen (L4) 959359 - Pommel Horse - None	3		41	1
881	2015-11-05 18:39:21.87962-05	425	Fabian, Owen (L4) 959359 - Vault - None	3		41	1
882	2015-11-05 18:39:21.880538-05	426	Fabian, Owen (L4) 959359 - Parallel Bars - None	3		41	1
883	2015-11-05 18:39:21.881439-05	427	Fabian, Owen (L4) 959359 - High Bar - None	3		41	1
884	2015-11-05 18:39:21.882362-05	1161	FLAGGED! Miller, Solomon (L4) 959355 - Floor - None	3		41	1
885	2015-11-05 18:39:21.883312-05	1162	FLAGGED! Miller, Solomon (L4) 959355 - Rings - None	3		41	1
886	2015-11-05 18:39:21.884225-05	1163	FLAGGED! Miller, Solomon (L4) 959355 - Pommel Horse - None	3		41	1
887	2015-11-05 18:39:21.885188-05	1164	FLAGGED! Miller, Solomon (L4) 959355 - Vault - None	3		41	1
888	2015-11-05 18:39:21.886147-05	1165	FLAGGED! Miller, Solomon (L4) 959355 - Parallel Bars - None	3		41	1
889	2015-11-05 18:39:21.88713-05	1166	FLAGGED! Miller, Solomon (L4) 959355 - High Bar - None	3		41	1
890	2015-11-05 18:39:21.888044-05	1390	Robell, Peter (L5) 959357 - Floor - None	3		41	1
891	2015-11-05 18:39:21.888968-05	1391	Robell, Peter (L5) 959357 - Rings - None	3		41	1
892	2015-11-05 18:39:21.889941-05	1392	Robell, Peter (L5) 959357 - Pommel Horse - None	3		41	1
893	2015-11-05 18:39:21.891006-05	1393	Robell, Peter (L5) 959357 - Vault - None	3		41	1
894	2015-11-05 18:39:21.891986-05	1394	Robell, Peter (L5) 959357 - Parallel Bars - None	3		41	1
895	2015-11-05 18:39:21.892949-05	1395	Robell, Peter (L5) 959357 - High Bar - None	3		41	1
896	2015-11-05 18:39:21.894132-05	266	Colin, Nate (L4) 1011424 - Floor - None	3		41	1
897	2015-11-05 18:39:21.895055-05	267	Colin, Nate (L4) 1011424 - Rings - None	3		41	1
898	2015-11-05 18:39:21.89602-05	268	Colin, Nate (L4) 1011424 - Pommel Horse - None	3		41	1
899	2015-11-05 18:39:21.896917-05	269	Colin, Nate (L4) 1011424 - Vault - None	3		41	1
900	2015-11-05 18:39:21.897821-05	270	Colin, Nate (L4) 1011424 - Parallel Bars - None	3		41	1
901	2015-11-05 18:39:21.898787-05	271	Colin, Nate (L4) 1011424 - High Bar - None	3		41	1
902	2015-11-05 18:39:21.899685-05	1046	Magness, Charles (L4) 1011466 - Floor - None	3		41	1
903	2015-11-05 18:39:21.900576-05	1047	Magness, Charles (L4) 1011466 - Rings - None	3		41	1
904	2015-11-05 18:39:21.901498-05	1048	Magness, Charles (L4) 1011466 - Pommel Horse - None	3		41	1
905	2015-11-05 18:39:21.902387-05	1049	Magness, Charles (L4) 1011466 - Vault - None	3		41	1
906	2015-11-05 18:39:21.903275-05	1050	Magness, Charles (L4) 1011466 - Parallel Bars - None	3		41	1
907	2015-11-05 18:39:21.90416-05	1051	Magness, Charles (L4) 1011466 - High Bar - None	3		41	1
908	2015-11-05 18:39:21.905069-05	1354	Portaro, Marc (L4) 1011470 - Floor - None	3		41	1
909	2015-11-05 18:39:21.905982-05	1355	Portaro, Marc (L4) 1011470 - Rings - None	3		41	1
910	2015-11-05 18:39:21.906978-05	1356	Portaro, Marc (L4) 1011470 - Pommel Horse - None	3		41	1
911	2015-11-05 18:39:21.907993-05	1357	Portaro, Marc (L4) 1011470 - Vault - None	3		41	1
912	2015-11-05 18:39:21.90891-05	1358	Portaro, Marc (L4) 1011470 - Parallel Bars - None	3		41	1
913	2015-11-05 18:39:21.909822-05	1359	Portaro, Marc (L4) 1011470 - High Bar - None	3		41	1
914	2015-11-05 18:39:21.910744-05	1762	Watkins, Tristan (L4) 1011493 - Floor - None	3		41	1
915	2015-11-05 18:39:21.911652-05	1763	Watkins, Tristan (L4) 1011493 - Rings - None	3		41	1
916	2015-11-05 18:39:21.912505-05	1764	Watkins, Tristan (L4) 1011493 - Pommel Horse - None	3		41	1
917	2015-11-05 18:39:21.913435-05	1765	Watkins, Tristan (L4) 1011493 - Vault - None	3		41	1
918	2015-11-05 18:39:21.914322-05	1766	Watkins, Tristan (L4) 1011493 - Parallel Bars - None	3		41	1
919	2015-11-05 18:39:21.915303-05	1767	Watkins, Tristan (L4) 1011493 - High Bar - None	3		41	1
920	2015-11-05 18:39:21.916236-05	1786	Willis, Brent (L5) 1011494 - Floor - None	3		41	1
921	2015-11-05 18:39:21.917229-05	1787	Willis, Brent (L5) 1011494 - Rings - None	3		41	1
922	2015-11-05 18:39:21.918186-05	1788	Willis, Brent (L5) 1011494 - Pommel Horse - None	3		41	1
923	2015-11-05 18:39:21.919133-05	1789	Willis, Brent (L5) 1011494 - Vault - None	3		41	1
924	2015-11-05 18:39:21.920053-05	1790	Willis, Brent (L5) 1011494 - Parallel Bars - None	3		41	1
925	2015-11-05 18:39:21.920991-05	1791	Willis, Brent (L5) 1011494 - High Bar - None	3		41	1
926	2015-11-05 18:39:21.921887-05	878	Keefer, Gavin (L5) 974232 - Floor - None	3		41	1
927	2015-11-05 18:39:21.922801-05	879	Keefer, Gavin (L5) 974232 - Rings - None	3		41	1
928	2015-11-05 18:39:21.923762-05	880	Keefer, Gavin (L5) 974232 - Pommel Horse - None	3		41	1
1444	2015-11-05 18:39:22.417393-05	802	Im, Ozzy (L4)  - Pommel Horse - None	3		41	1
929	2015-11-05 18:39:21.924695-05	881	Keefer, Gavin (L5) 974232 - Vault - None	3		41	1
930	2015-11-05 18:39:21.925702-05	882	Keefer, Gavin (L5) 974232 - Parallel Bars - None	3		41	1
931	2015-11-05 18:39:21.926629-05	883	Keefer, Gavin (L5) 974232 - High Bar - None	3		41	1
932	2015-11-05 18:39:21.927616-05	1131	FLAGGED! McCready, Brandon (L5) 967055 - Floor - None	3		41	1
933	2015-11-05 18:39:21.928514-05	1132	FLAGGED! McCready, Brandon (L5) 967055 - Rings - None	3		41	1
934	2015-11-05 18:39:21.929464-05	1133	FLAGGED! McCready, Brandon (L5) 967055 - Pommel Horse - None	3		41	1
935	2015-11-05 18:39:21.930359-05	1134	FLAGGED! McCready, Brandon (L5) 967055 - Vault - None	3		41	1
936	2015-11-05 18:39:21.931315-05	1135	FLAGGED! McCready, Brandon (L5) 967055 - Parallel Bars - None	3		41	1
937	2015-11-05 18:39:21.932214-05	1136	FLAGGED! McCready, Brandon (L5) 967055 - High Bar - None	3		41	1
938	2015-11-05 18:39:21.933158-05	806	FLAGGED! Irons, Isaiah (L6) 643614 - Floor - None	3		41	1
939	2015-11-05 18:39:21.934155-05	807	FLAGGED! Irons, Isaiah (L6) 643614 - Rings - None	3		41	1
940	2015-11-05 18:39:21.935115-05	808	FLAGGED! Irons, Isaiah (L6) 643614 - Pommel Horse - None	3		41	1
941	2015-11-05 18:39:21.936046-05	809	FLAGGED! Irons, Isaiah (L6) 643614 - Vault - None	3		41	1
942	2015-11-05 18:39:21.93697-05	810	FLAGGED! Irons, Isaiah (L6) 643614 - Parallel Bars - None	3		41	1
943	2015-11-05 18:39:21.937968-05	811	FLAGGED! Irons, Isaiah (L6) 643614 - High Bar - None	3		41	1
944	2015-11-05 18:39:21.938924-05	20	FLAGGED! Allen, Evan (L6) 643620 - Floor - None	3		41	1
945	2015-11-05 18:39:21.939867-05	21	FLAGGED! Allen, Evan (L6) 643620 - Rings - None	3		41	1
946	2015-11-05 18:39:21.940803-05	22	FLAGGED! Allen, Evan (L6) 643620 - Pommel Horse - None	3		41	1
947	2015-11-05 18:39:21.941807-05	23	FLAGGED! Allen, Evan (L6) 643620 - Vault - None	3		41	1
948	2015-11-05 18:39:21.942742-05	24	FLAGGED! Allen, Evan (L6) 643620 - Parallel Bars - None	3		41	1
949	2015-11-05 18:39:21.943703-05	25	FLAGGED! Allen, Evan (L6) 643620 - High Bar - None	3		41	1
950	2015-11-05 18:39:21.944618-05	902	Kirvan, Michael (L6) 579620 - Floor - None	3		41	1
951	2015-11-05 18:39:21.945555-05	903	Kirvan, Michael (L6) 579620 - Rings - None	3		41	1
952	2015-11-05 18:39:21.94645-05	904	Kirvan, Michael (L6) 579620 - Pommel Horse - None	3		41	1
953	2015-11-05 18:39:21.947426-05	905	Kirvan, Michael (L6) 579620 - Vault - None	3		41	1
954	2015-11-05 18:39:21.948342-05	906	Kirvan, Michael (L6) 579620 - Parallel Bars - None	3		41	1
955	2015-11-05 18:39:21.949229-05	907	Kirvan, Michael (L6) 579620 - High Bar - None	3		41	1
956	2015-11-05 18:39:21.950154-05	320	Damm, Stephen (L6) 579601 - Floor - None	3		41	1
957	2015-11-05 18:39:21.95115-05	321	Damm, Stephen (L6) 579601 - Rings - None	3		41	1
958	2015-11-05 18:39:21.952162-05	322	Damm, Stephen (L6) 579601 - Pommel Horse - None	3		41	1
959	2015-11-05 18:39:21.953109-05	323	Damm, Stephen (L6) 579601 - Vault - None	3		41	1
960	2015-11-05 18:39:21.95409-05	324	Damm, Stephen (L6) 579601 - Parallel Bars - None	3		41	1
961	2015-11-05 18:39:21.955024-05	325	Damm, Stephen (L6) 579601 - High Bar - None	3		41	1
962	2015-11-05 18:39:21.955953-05	38	FLAGGED! Auchincloss, Alexander (L6) 523288 - Floor - None	3		41	1
963	2015-11-05 18:39:21.956895-05	39	FLAGGED! Auchincloss, Alexander (L6) 523288 - Rings - None	3		41	1
964	2015-11-05 18:39:21.957878-05	40	FLAGGED! Auchincloss, Alexander (L6) 523288 - Pommel Horse - None	3		41	1
965	2015-11-05 18:39:21.958799-05	41	FLAGGED! Auchincloss, Alexander (L6) 523288 - Vault - None	3		41	1
966	2015-11-05 18:39:21.959711-05	42	FLAGGED! Auchincloss, Alexander (L6) 523288 - Parallel Bars - None	3		41	1
967	2015-11-05 18:39:21.960629-05	43	FLAGGED! Auchincloss, Alexander (L6) 523288 - High Bar - None	3		41	1
968	2015-11-05 18:39:21.961519-05	1276	O'Toole, Liam (L7) 582005 - Floor - None	3		41	1
969	2015-11-05 18:39:21.96241-05	1277	O'Toole, Liam (L7) 582005 - Rings - None	3		41	1
970	2015-11-05 18:39:21.963413-05	1278	O'Toole, Liam (L7) 582005 - Pommel Horse - None	3		41	1
971	2015-11-05 18:39:21.964444-05	1279	O'Toole, Liam (L7) 582005 - Vault - None	3		41	1
972	2015-11-05 18:39:21.96542-05	1280	O'Toole, Liam (L7) 582005 - Parallel Bars - None	3		41	1
973	2015-11-05 18:39:21.966351-05	1281	O'Toole, Liam (L7) 582005 - High Bar - None	3		41	1
974	2015-11-05 18:39:21.967319-05	404	Eid, Marcel (L7) 523296 - Floor - None	3		41	1
975	2015-11-05 18:39:21.968259-05	405	Eid, Marcel (L7) 523296 - Rings - None	3		41	1
976	2015-11-05 18:39:21.969197-05	406	Eid, Marcel (L7) 523296 - Pommel Horse - None	3		41	1
977	2015-11-05 18:39:21.970094-05	407	Eid, Marcel (L7) 523296 - Vault - None	3		41	1
978	2015-11-05 18:39:21.970986-05	408	Eid, Marcel (L7) 523296 - Parallel Bars - None	3		41	1
979	2015-11-05 18:39:21.97194-05	409	Eid, Marcel (L7) 523296 - High Bar - None	3		41	1
980	2015-11-05 18:39:21.972841-05	854	Joyner, Adam (L7) 523298 - Floor - None	3		41	1
981	2015-11-05 18:39:21.973817-05	855	Joyner, Adam (L7) 523298 - Rings - None	3		41	1
982	2015-11-05 18:39:21.974813-05	856	Joyner, Adam (L7) 523298 - Pommel Horse - None	3		41	1
983	2015-11-05 18:39:21.975844-05	857	Joyner, Adam (L7) 523298 - Vault - None	3		41	1
984	2015-11-05 18:39:21.976825-05	858	Joyner, Adam (L7) 523298 - Parallel Bars - None	3		41	1
985	2015-11-05 18:39:21.977791-05	859	Joyner, Adam (L7) 523298 - High Bar - None	3		41	1
986	2015-11-05 18:39:21.97875-05	1816	York, Jacob (L4) 989666 - Floor - None	3		41	1
987	2015-11-05 18:39:21.979694-05	1817	York, Jacob (L4) 989666 - Rings - None	3		41	1
988	2015-11-05 18:39:21.980619-05	1818	York, Jacob (L4) 989666 - Pommel Horse - None	3		41	1
989	2015-11-05 18:39:21.981552-05	1819	York, Jacob (L4) 989666 - Vault - None	3		41	1
990	2015-11-05 18:39:21.982471-05	1820	York, Jacob (L4) 989666 - Parallel Bars - None	3		41	1
991	2015-11-05 18:39:21.983428-05	1821	York, Jacob (L4) 989666 - High Bar - None	3		41	1
992	2015-11-05 18:39:21.984358-05	1372	Rearden, Alex (L4) 989668 - Floor - None	3		41	1
993	2015-11-05 18:39:21.985337-05	1373	Rearden, Alex (L4) 989668 - Rings - None	3		41	1
994	2015-11-05 18:39:21.98634-05	1374	Rearden, Alex (L4) 989668 - Pommel Horse - None	3		41	1
995	2015-11-05 18:39:21.987288-05	1375	Rearden, Alex (L4) 989668 - Vault - None	3		41	1
996	2015-11-05 18:39:21.988229-05	1376	Rearden, Alex (L4) 989668 - Parallel Bars - None	3		41	1
997	2015-11-05 18:39:21.989162-05	1377	Rearden, Alex (L4) 989668 - High Bar - None	3		41	1
998	2015-11-05 18:39:21.990112-05	836	Jekal, Daniel (L5) 939766 - Floor - None	3		41	1
999	2015-11-05 18:39:21.991036-05	837	Jekal, Daniel (L5) 939766 - Rings - None	3		41	1
1000	2015-11-05 18:39:21.991936-05	838	Jekal, Daniel (L5) 939766 - Pommel Horse - None	3		41	1
1001	2015-11-05 18:39:21.992827-05	839	Jekal, Daniel (L5) 939766 - Vault - None	3		41	1
1002	2015-11-05 18:39:21.993748-05	840	Jekal, Daniel (L5) 939766 - Parallel Bars - None	3		41	1
1003	2015-11-05 18:39:21.994751-05	841	Jekal, Daniel (L5) 939766 - High Bar - None	3		41	1
1004	2015-11-05 18:39:21.995737-05	1016	Lin, Conner (L4) 989664 - Floor - None	3		41	1
1005	2015-11-05 18:39:21.996652-05	1017	Lin, Conner (L4) 989664 - Rings - None	3		41	1
1006	2015-11-05 18:39:21.997564-05	1018	Lin, Conner (L4) 989664 - Pommel Horse - None	3		41	1
1007	2015-11-05 18:39:21.998912-05	1019	Lin, Conner (L4) 989664 - Vault - None	3		41	1
1008	2015-11-05 18:39:21.99988-05	1020	Lin, Conner (L4) 989664 - Parallel Bars - None	3		41	1
1009	2015-11-05 18:39:22.000846-05	1021	Lin, Conner (L4) 989664 - High Bar - None	3		41	1
1010	2015-11-05 18:39:22.001817-05	392	Durante, Tyler (L4) 989662 - Floor - None	3		41	1
1011	2015-11-05 18:39:22.002745-05	393	Durante, Tyler (L4) 989662 - Rings - None	3		41	1
1012	2015-11-05 18:39:22.003724-05	394	Durante, Tyler (L4) 989662 - Pommel Horse - None	3		41	1
1013	2015-11-05 18:39:22.004655-05	395	Durante, Tyler (L4) 989662 - Vault - None	3		41	1
1014	2015-11-05 18:39:22.005574-05	396	Durante, Tyler (L4) 989662 - Parallel Bars - None	3		41	1
1015	2015-11-05 18:39:22.006491-05	397	Durante, Tyler (L4) 989662 - High Bar - None	3		41	1
1016	2015-11-05 18:39:22.007471-05	668	Hanny, Jesse (L5) 939774 - Floor - None	3		41	1
1017	2015-11-05 18:39:22.008491-05	669	Hanny, Jesse (L5) 939774 - Rings - None	3		41	1
1018	2015-11-05 18:39:22.00949-05	670	Hanny, Jesse (L5) 939774 - Pommel Horse - None	3		41	1
1019	2015-11-05 18:39:22.010466-05	671	Hanny, Jesse (L5) 939774 - Vault - None	3		41	1
1020	2015-11-05 18:39:22.011502-05	672	Hanny, Jesse (L5) 939774 - Parallel Bars - None	3		41	1
1021	2015-11-05 18:39:22.012516-05	673	Hanny, Jesse (L5) 939774 - High Bar - None	3		41	1
1022	2015-11-05 18:39:22.013587-05	674	Hanny, Joshua (L5) 939769 - Floor - None	3		41	1
1023	2015-11-05 18:39:22.014539-05	675	Hanny, Joshua (L5) 939769 - Rings - None	3		41	1
1024	2015-11-05 18:39:22.015461-05	676	Hanny, Joshua (L5) 939769 - Pommel Horse - None	3		41	1
1025	2015-11-05 18:39:22.016414-05	677	Hanny, Joshua (L5) 939769 - Vault - None	3		41	1
1026	2015-11-05 18:39:22.017332-05	678	Hanny, Joshua (L5) 939769 - Parallel Bars - None	3		41	1
1027	2015-11-05 18:39:22.018606-05	679	Hanny, Joshua (L5) 939769 - High Bar - None	3		41	1
1028	2015-11-05 18:39:22.019564-05	1330	Peppiatt, Michael (L4) 1004176 - Floor - None	3		41	1
1029	2015-11-05 18:39:22.020634-05	1331	Peppiatt, Michael (L4) 1004176 - Rings - None	3		41	1
1030	2015-11-05 18:39:22.022704-05	1332	Peppiatt, Michael (L4) 1004176 - Pommel Horse - None	3		41	1
1031	2015-11-05 18:39:22.023894-05	1333	Peppiatt, Michael (L4) 1004176 - Vault - None	3		41	1
1032	2015-11-05 18:39:22.024888-05	1334	Peppiatt, Michael (L4) 1004176 - Parallel Bars - None	3		41	1
1033	2015-11-05 18:39:22.025846-05	1335	Peppiatt, Michael (L4) 1004176 - High Bar - None	3		41	1
1034	2015-11-05 18:39:22.026783-05	1810	Yoder, Tiernan (L5) 939768 - Floor - None	3		41	1
1035	2015-11-05 18:39:22.02772-05	1811	Yoder, Tiernan (L5) 939768 - Rings - None	3		41	1
1036	2015-11-05 18:39:22.028647-05	1812	Yoder, Tiernan (L5) 939768 - Pommel Horse - None	3		41	1
1037	2015-11-05 18:39:22.029552-05	1813	Yoder, Tiernan (L5) 939768 - Vault - None	3		41	1
1038	2015-11-05 18:39:22.03044-05	1814	Yoder, Tiernan (L5) 939768 - Parallel Bars - None	3		41	1
1039	2015-11-05 18:39:22.031353-05	1815	Yoder, Tiernan (L5) 939768 - High Bar - None	3		41	1
1040	2015-11-05 18:39:22.032291-05	368	DiPietro, Lucas (L5) 619644 - Floor - None	3		41	1
1041	2015-11-05 18:39:22.033193-05	369	DiPietro, Lucas (L5) 619644 - Rings - None	3		41	1
1042	2015-11-05 18:39:22.034088-05	370	DiPietro, Lucas (L5) 619644 - Pommel Horse - None	3		41	1
1043	2015-11-05 18:39:22.03497-05	371	DiPietro, Lucas (L5) 619644 - Vault - None	3		41	1
1044	2015-11-05 18:39:22.035853-05	372	DiPietro, Lucas (L5) 619644 - Parallel Bars - None	3		41	1
1045	2015-11-05 18:39:22.036762-05	373	DiPietro, Lucas (L5) 619644 - High Bar - None	3		41	1
1046	2015-11-05 18:39:22.037655-05	1780	Wells, Ethan (L5) 619653 - Floor - None	3		41	1
1047	2015-11-05 18:39:22.038572-05	1781	Wells, Ethan (L5) 619653 - Rings - None	3		41	1
1048	2015-11-05 18:39:22.039515-05	1782	Wells, Ethan (L5) 619653 - Pommel Horse - None	3		41	1
1049	2015-11-05 18:39:22.040455-05	1783	Wells, Ethan (L5) 619653 - Vault - None	3		41	1
1050	2015-11-05 18:39:22.041405-05	1784	Wells, Ethan (L5) 619653 - Parallel Bars - None	3		41	1
1051	2015-11-05 18:39:22.042374-05	1785	Wells, Ethan (L5) 619653 - High Bar - None	3		41	1
1052	2015-11-05 18:39:22.043347-05	1185	Morgan, Neil (L6) 552928 - Floor - None	3		41	1
1053	2015-11-05 18:39:22.044299-05	1186	Morgan, Neil (L6) 552928 - Rings - None	3		41	1
1054	2015-11-05 18:39:22.045495-05	1187	Morgan, Neil (L6) 552928 - Pommel Horse - None	3		41	1
1055	2015-11-05 18:39:22.04641-05	1188	Morgan, Neil (L6) 552928 - Vault - None	3		41	1
1056	2015-11-05 18:39:22.047367-05	1189	Morgan, Neil (L6) 552928 - Parallel Bars - None	3		41	1
1057	2015-11-05 18:39:22.048338-05	1190	Morgan, Neil (L6) 552928 - High Bar - None	3		41	1
1058	2015-11-05 18:39:22.049278-05	1312	FLAGGED! Pelligrini, David (L6) 619648 - Floor - None	3		41	1
1059	2015-11-05 18:39:22.050206-05	1313	FLAGGED! Pelligrini, David (L6) 619648 - Rings - None	3		41	1
1060	2015-11-05 18:39:22.051147-05	1314	FLAGGED! Pelligrini, David (L6) 619648 - Pommel Horse - None	3		41	1
1061	2015-11-05 18:39:22.052121-05	1315	FLAGGED! Pelligrini, David (L6) 619648 - Vault - None	3		41	1
1062	2015-11-05 18:39:22.053112-05	1316	FLAGGED! Pelligrini, David (L6) 619648 - Parallel Bars - None	3		41	1
1063	2015-11-05 18:39:22.054053-05	1317	FLAGGED! Pelligrini, David (L6) 619648 - High Bar - None	3		41	1
1064	2015-11-05 18:39:22.055018-05	1318	FLAGGED! Pelligrini, Josef (L6) 619651 - Floor - None	3		41	1
1065	2015-11-05 18:39:22.055977-05	1319	FLAGGED! Pelligrini, Josef (L6) 619651 - Rings - None	3		41	1
1066	2015-11-05 18:39:22.056876-05	1320	FLAGGED! Pelligrini, Josef (L6) 619651 - Pommel Horse - None	3		41	1
1067	2015-11-05 18:39:22.05794-05	1321	FLAGGED! Pelligrini, Josef (L6) 619651 - Vault - None	3		41	1
1068	2015-11-05 18:39:22.058896-05	1322	FLAGGED! Pelligrini, Josef (L6) 619651 - Parallel Bars - None	3		41	1
1069	2015-11-05 18:39:22.059826-05	1323	FLAGGED! Pelligrini, Josef (L6) 619651 - High Bar - None	3		41	1
1070	2015-11-05 18:39:22.060761-05	662	Hanny, Benjamin (L8) 939779 - Floor - None	3		41	1
1071	2015-11-05 18:39:22.061672-05	663	Hanny, Benjamin (L8) 939779 - Rings - None	3		41	1
1072	2015-11-05 18:39:22.062592-05	664	Hanny, Benjamin (L8) 939779 - Pommel Horse - None	3		41	1
1073	2015-11-05 18:39:22.063578-05	665	Hanny, Benjamin (L8) 939779 - Vault - None	3		41	1
1074	2015-11-05 18:39:22.064571-05	666	Hanny, Benjamin (L8) 939779 - Parallel Bars - None	3		41	1
1075	2015-11-05 18:39:22.065439-05	667	Hanny, Benjamin (L8) 939779 - High Bar - None	3		41	1
1076	2015-11-05 18:39:22.066431-05	434	Falgiano, Colin (L8) 494201 - Floor - None	3		41	1
1077	2015-11-05 18:39:22.067349-05	435	Falgiano, Colin (L8) 494201 - Rings - None	3		41	1
1078	2015-11-05 18:39:22.068253-05	436	Falgiano, Colin (L8) 494201 - Pommel Horse - None	3		41	1
1079	2015-11-05 18:39:22.069215-05	437	Falgiano, Colin (L8) 494201 - Vault - None	3		41	1
1080	2015-11-05 18:39:22.070107-05	438	Falgiano, Colin (L8) 494201 - Parallel Bars - None	3		41	1
1081	2015-11-05 18:39:22.070995-05	439	Falgiano, Colin (L8) 494201 - High Bar - None	3		41	1
1082	2015-11-05 18:39:22.071973-05	1630	Sternberg, Paul (L8) 405143 - Floor - None	3		41	1
1083	2015-11-05 18:39:22.072863-05	1631	Sternberg, Paul (L8) 405143 - Rings - None	3		41	1
1084	2015-11-05 18:39:22.073811-05	1632	Sternberg, Paul (L8) 405143 - Pommel Horse - None	3		41	1
1085	2015-11-05 18:39:22.074702-05	1633	Sternberg, Paul (L8) 405143 - Vault - None	3		41	1
1086	2015-11-05 18:39:22.075587-05	1634	Sternberg, Paul (L8) 405143 - Parallel Bars - None	3		41	1
1087	2015-11-05 18:39:22.076551-05	1635	Sternberg, Paul (L8) 405143 - High Bar - None	3		41	1
1088	2015-11-05 18:39:22.077487-05	254	Clingman, Chase (L9) 360792 - Floor - None	3		41	1
1089	2015-11-05 18:39:22.078419-05	255	Clingman, Chase (L9) 360792 - Rings - None	3		41	1
1090	2015-11-05 18:39:22.079306-05	256	Clingman, Chase (L9) 360792 - Pommel Horse - None	3		41	1
1091	2015-11-05 18:39:22.080191-05	257	Clingman, Chase (L9) 360792 - Vault - None	3		41	1
1092	2015-11-05 18:39:22.081133-05	258	Clingman, Chase (L9) 360792 - Parallel Bars - None	3		41	1
1093	2015-11-05 18:39:22.08202-05	259	Clingman, Chase (L9) 360792 - High Bar - None	3		41	1
1094	2015-11-05 18:39:22.082907-05	1738	Voegele, Logan (L10) 272066 - Floor - None	3		41	1
1095	2015-11-05 18:39:22.083792-05	1739	Voegele, Logan (L10) 272066 - Rings - None	3		41	1
1096	2015-11-05 18:39:22.084876-05	1740	Voegele, Logan (L10) 272066 - Pommel Horse - None	3		41	1
1097	2015-11-05 18:39:22.085858-05	1741	Voegele, Logan (L10) 272066 - Vault - None	3		41	1
1098	2015-11-05 18:39:22.086815-05	1742	Voegele, Logan (L10) 272066 - Parallel Bars - None	3		41	1
1099	2015-11-05 18:39:22.087758-05	1743	Voegele, Logan (L10) 272066 - High Bar - None	3		41	1
1100	2015-11-05 18:39:22.088763-05	260	Clingman, Nathan (L10) 272071 - Floor - None	3		41	1
1101	2015-11-05 18:39:22.089707-05	261	Clingman, Nathan (L10) 272071 - Rings - None	3		41	1
1102	2015-11-05 18:39:22.090722-05	262	Clingman, Nathan (L10) 272071 - Pommel Horse - None	3		41	1
1103	2015-11-05 18:39:22.091826-05	263	Clingman, Nathan (L10) 272071 - Vault - None	3		41	1
1104	2015-11-05 18:39:22.09278-05	264	Clingman, Nathan (L10) 272071 - Parallel Bars - None	3		41	1
1105	2015-11-05 18:39:22.093761-05	265	Clingman, Nathan (L10) 272071 - High Bar - None	3		41	1
1106	2015-11-05 18:39:22.094753-05	50	Ayodele, Aaron (L8) 547953 - Floor - None	3		41	1
1107	2015-11-05 18:39:22.095671-05	51	Ayodele, Aaron (L8) 547953 - Rings - None	3		41	1
1108	2015-11-05 18:39:22.096581-05	52	Ayodele, Aaron (L8) 547953 - Pommel Horse - None	3		41	1
1109	2015-11-05 18:39:22.097515-05	53	Ayodele, Aaron (L8) 547953 - Vault - None	3		41	1
1110	2015-11-05 18:39:22.098639-05	54	Ayodele, Aaron (L8) 547953 - Parallel Bars - None	3		41	1
1111	2015-11-05 18:39:22.099527-05	55	Ayodele, Aaron (L8) 547953 - High Bar - None	3		41	1
1112	2015-11-05 18:39:22.10046-05	62	Bailey, Deven (L4) 991256 - Floor - None	3		41	1
1113	2015-11-05 18:39:22.101351-05	63	Bailey, Deven (L4) 991256 - Rings - None	3		41	1
1114	2015-11-05 18:39:22.102186-05	64	Bailey, Deven (L4) 991256 - Pommel Horse - None	3		41	1
1115	2015-11-05 18:39:22.103074-05	65	Bailey, Deven (L4) 991256 - Vault - None	3		41	1
1116	2015-11-05 18:39:22.103996-05	66	Bailey, Deven (L4) 991256 - Parallel Bars - None	3		41	1
1117	2015-11-05 18:39:22.104996-05	67	Bailey, Deven (L4) 991256 - High Bar - None	3		41	1
1118	2015-11-05 18:39:22.105902-05	110	FLAGGED! Bennet, Pierce (L4) 991260 - Floor - None	3		41	1
1119	2015-11-05 18:39:22.106837-05	111	FLAGGED! Bennet, Pierce (L4) 991260 - Rings - None	3		41	1
1120	2015-11-05 18:39:22.107801-05	112	FLAGGED! Bennet, Pierce (L4) 991260 - Pommel Horse - None	3		41	1
1121	2015-11-05 18:39:22.108714-05	113	FLAGGED! Bennet, Pierce (L4) 991260 - Vault - None	3		41	1
1122	2015-11-05 18:39:22.109619-05	114	FLAGGED! Bennet, Pierce (L4) 991260 - Parallel Bars - None	3		41	1
1123	2015-11-05 18:39:22.110529-05	115	FLAGGED! Bennet, Pierce (L4) 991260 - High Bar - None	3		41	1
1124	2015-11-05 18:39:22.111505-05	224	Chu, Damien (L8) 500052 - Floor - None	3		41	1
1125	2015-11-05 18:39:22.112391-05	225	Chu, Damien (L8) 500052 - Rings - None	3		41	1
1126	2015-11-05 18:39:22.113311-05	226	Chu, Damien (L8) 500052 - Pommel Horse - None	3		41	1
1127	2015-11-05 18:39:22.114199-05	227	Chu, Damien (L8) 500052 - Vault - None	3		41	1
1128	2015-11-05 18:39:22.115128-05	228	Chu, Damien (L8) 500052 - Parallel Bars - None	3		41	1
1129	2015-11-05 18:39:22.116082-05	229	Chu, Damien (L8) 500052 - High Bar - None	3		41	1
1130	2015-11-05 18:39:22.116968-05	230	FLAGGED! Chu, Patrick (L4) 937186 - Floor - None	3		41	1
1131	2015-11-05 18:39:22.117984-05	231	FLAGGED! Chu, Patrick (L4) 937186 - Rings - None	3		41	1
1132	2015-11-05 18:39:22.118891-05	232	FLAGGED! Chu, Patrick (L4) 937186 - Pommel Horse - None	3		41	1
1133	2015-11-05 18:39:22.119827-05	233	FLAGGED! Chu, Patrick (L4) 937186 - Vault - None	3		41	1
1134	2015-11-05 18:39:22.120728-05	234	FLAGGED! Chu, Patrick (L4) 937186 - Parallel Bars - None	3		41	1
1135	2015-11-05 18:39:22.121628-05	235	FLAGGED! Chu, Patrick (L4) 937186 - High Bar - None	3		41	1
1136	2015-11-05 18:39:22.122511-05	236	Chung, Riley (L6) 614756 - Floor - None	3		41	1
1137	2015-11-05 18:39:22.123503-05	237	Chung, Riley (L6) 614756 - Rings - None	3		41	1
1138	2015-11-05 18:39:22.1245-05	238	Chung, Riley (L6) 614756 - Pommel Horse - None	3		41	1
1139	2015-11-05 18:39:22.125493-05	239	Chung, Riley (L6) 614756 - Vault - None	3		41	1
1140	2015-11-05 18:39:22.126489-05	240	Chung, Riley (L6) 614756 - Parallel Bars - None	3		41	1
1141	2015-11-05 18:39:22.127442-05	241	Chung, Riley (L6) 614756 - High Bar - None	3		41	1
1142	2015-11-05 18:39:22.128446-05	242	Clark, Henry (L5) 581777 - Floor - None	3		41	1
1143	2015-11-05 18:39:22.129409-05	243	Clark, Henry (L5) 581777 - Rings - None	3		41	1
1144	2015-11-05 18:39:22.130587-05	244	Clark, Henry (L5) 581777 - Pommel Horse - None	3		41	1
1145	2015-11-05 18:39:22.131535-05	245	Clark, Henry (L5) 581777 - Vault - None	3		41	1
1146	2015-11-05 18:39:22.132486-05	246	Clark, Henry (L5) 581777 - Parallel Bars - None	3		41	1
1147	2015-11-05 18:39:22.133403-05	247	Clark, Henry (L5) 581777 - High Bar - None	3		41	1
1148	2015-11-05 18:39:22.134295-05	272	Cooper, Logan (L4) 995890 - Floor - None	3		41	1
1149	2015-11-05 18:39:22.135186-05	273	Cooper, Logan (L4) 995890 - Rings - None	3		41	1
1150	2015-11-05 18:39:22.136148-05	274	Cooper, Logan (L4) 995890 - Pommel Horse - None	3		41	1
1151	2015-11-05 18:39:22.137205-05	275	Cooper, Logan (L4) 995890 - Vault - None	3		41	1
1152	2015-11-05 18:39:22.138182-05	276	Cooper, Logan (L4) 995890 - Parallel Bars - None	3		41	1
1153	2015-11-05 18:39:22.139121-05	277	Cooper, Logan (L4) 995890 - High Bar - None	3		41	1
1154	2015-11-05 18:39:22.140049-05	278	Cowan, Drew (L6) 614763 - Floor - None	3		41	1
1155	2015-11-05 18:39:22.141016-05	279	Cowan, Drew (L6) 614763 - Rings - None	3		41	1
1156	2015-11-05 18:39:22.141964-05	280	Cowan, Drew (L6) 614763 - Pommel Horse - None	3		41	1
1157	2015-11-05 18:39:22.142884-05	281	Cowan, Drew (L6) 614763 - Vault - None	3		41	1
1158	2015-11-05 18:39:22.143842-05	282	Cowan, Drew (L6) 614763 - Parallel Bars - None	3		41	1
1159	2015-11-05 18:39:22.144765-05	283	Cowan, Drew (L6) 614763 - High Bar - None	3		41	1
1160	2015-11-05 18:39:22.145709-05	290	FLAGGED! Cronin, Asher (L6) 936964 - Floor - None	3		41	1
1161	2015-11-05 18:39:22.146614-05	291	FLAGGED! Cronin, Asher (L6) 936964 - Rings - None	3		41	1
1162	2015-11-05 18:39:22.147595-05	292	FLAGGED! Cronin, Asher (L6) 936964 - Pommel Horse - None	3		41	1
1163	2015-11-05 18:39:22.148496-05	293	FLAGGED! Cronin, Asher (L6) 936964 - Vault - None	3		41	1
1164	2015-11-05 18:39:22.149415-05	294	FLAGGED! Cronin, Asher (L6) 936964 - Parallel Bars - None	3		41	1
1165	2015-11-05 18:39:22.150312-05	295	FLAGGED! Cronin, Asher (L6) 936964 - High Bar - None	3		41	1
1166	2015-11-05 18:39:22.151196-05	326	Dao, Jonathan (L6) 614758 - Floor - None	3		41	1
1167	2015-11-05 18:39:22.152255-05	327	Dao, Jonathan (L6) 614758 - Rings - None	3		41	1
1168	2015-11-05 18:39:22.153304-05	328	Dao, Jonathan (L6) 614758 - Pommel Horse - None	3		41	1
1169	2015-11-05 18:39:22.154245-05	329	Dao, Jonathan (L6) 614758 - Vault - None	3		41	1
1170	2015-11-05 18:39:22.155188-05	330	Dao, Jonathan (L6) 614758 - Parallel Bars - None	3		41	1
1171	2015-11-05 18:39:22.156134-05	331	Dao, Jonathan (L6) 614758 - High Bar - None	3		41	1
1172	2015-11-05 18:39:22.15708-05	398	Durso, Reese (L9) 1014104 - Floor - None	3		41	1
1173	2015-11-05 18:39:22.158111-05	399	Durso, Reese (L9) 1014104 - Rings - None	3		41	1
1174	2015-11-05 18:39:22.159052-05	400	Durso, Reese (L9) 1014104 - Pommel Horse - None	3		41	1
1175	2015-11-05 18:39:22.159964-05	401	Durso, Reese (L9) 1014104 - Vault - None	3		41	1
1176	2015-11-05 18:39:22.160908-05	402	Durso, Reese (L9) 1014104 - Parallel Bars - None	3		41	1
1177	2015-11-05 18:39:22.161814-05	403	Durso, Reese (L9) 1014104 - High Bar - None	3		41	1
1178	2015-11-05 18:39:22.162735-05	440	Farias, Simon (L4) 996935 - Floor - None	3		41	1
1179	2015-11-05 18:39:22.163758-05	441	Farias, Simon (L4) 996935 - Rings - None	3		41	1
1180	2015-11-05 18:39:22.16477-05	442	Farias, Simon (L4) 996935 - Pommel Horse - None	3		41	1
1181	2015-11-05 18:39:22.165695-05	443	Farias, Simon (L4) 996935 - Vault - None	3		41	1
1182	2015-11-05 18:39:22.166679-05	444	Farias, Simon (L4) 996935 - Parallel Bars - None	3		41	1
1183	2015-11-05 18:39:22.167607-05	445	Farias, Simon (L4) 996935 - High Bar - None	3		41	1
1184	2015-11-05 18:39:22.168551-05	506	Galvez, Julian (L7) 548134 - Floor - None	3		41	1
1185	2015-11-05 18:39:22.1695-05	507	Galvez, Julian (L7) 548134 - Rings - None	3		41	1
1186	2015-11-05 18:39:22.170433-05	508	Galvez, Julian (L7) 548134 - Pommel Horse - None	3		41	1
1187	2015-11-05 18:39:22.171348-05	509	Galvez, Julian (L7) 548134 - Vault - None	3		41	1
1188	2015-11-05 18:39:22.172237-05	510	Galvez, Julian (L7) 548134 - Parallel Bars - None	3		41	1
1189	2015-11-05 18:39:22.173126-05	511	Galvez, Julian (L7) 548134 - High Bar - None	3		41	1
1190	2015-11-05 18:39:22.174055-05	596	Graninger, Kenneth (L8) 500058 - Floor - None	3		41	1
1191	2015-11-05 18:39:22.174944-05	597	Graninger, Kenneth (L8) 500058 - Rings - None	3		41	1
1192	2015-11-05 18:39:22.175834-05	598	Graninger, Kenneth (L8) 500058 - Pommel Horse - None	3		41	1
1193	2015-11-05 18:39:22.176723-05	599	Graninger, Kenneth (L8) 500058 - Vault - None	3		41	1
1194	2015-11-05 18:39:22.17767-05	600	Graninger, Kenneth (L8) 500058 - Parallel Bars - None	3		41	1
1195	2015-11-05 18:39:22.178564-05	601	Graninger, Kenneth (L8) 500058 - High Bar - None	3		41	1
1196	2015-11-05 18:39:22.179513-05	638	Hall, Donovan (L6) 565343 - Floor - None	3		41	1
1197	2015-11-05 18:39:22.180397-05	639	Hall, Donovan (L6) 565343 - Rings - None	3		41	1
1198	2015-11-05 18:39:22.181279-05	640	Hall, Donovan (L6) 565343 - Pommel Horse - None	3		41	1
1199	2015-11-05 18:39:22.182158-05	641	Hall, Donovan (L6) 565343 - Vault - None	3		41	1
1200	2015-11-05 18:39:22.183045-05	642	Hall, Donovan (L6) 565343 - Parallel Bars - None	3		41	1
1201	2015-11-05 18:39:22.18396-05	643	Hall, Donovan (L6) 565343 - High Bar - None	3		41	1
1202	2015-11-05 18:39:22.184921-05	644	Hall, Finn (L5) 937188 - Floor - None	3		41	1
1203	2015-11-05 18:39:22.18587-05	645	Hall, Finn (L5) 937188 - Rings - None	3		41	1
1204	2015-11-05 18:39:22.186764-05	646	Hall, Finn (L5) 937188 - Pommel Horse - None	3		41	1
1205	2015-11-05 18:39:22.18765-05	647	Hall, Finn (L5) 937188 - Vault - None	3		41	1
1206	2015-11-05 18:39:22.188599-05	648	Hall, Finn (L5) 937188 - Parallel Bars - None	3		41	1
1207	2015-11-05 18:39:22.189504-05	649	Hall, Finn (L5) 937188 - High Bar - None	3		41	1
1208	2015-11-05 18:39:22.190417-05	650	Hall, Kai (L5) 943289 - Floor - None	3		41	1
1209	2015-11-05 18:39:22.191384-05	651	Hall, Kai (L5) 943289 - Rings - None	3		41	1
1210	2015-11-05 18:39:22.192398-05	652	Hall, Kai (L5) 943289 - Pommel Horse - None	3		41	1
1211	2015-11-05 18:39:22.193334-05	653	Hall, Kai (L5) 943289 - Vault - None	3		41	1
1212	2015-11-05 18:39:22.194275-05	654	Hall, Kai (L5) 943289 - Parallel Bars - None	3		41	1
1213	2015-11-05 18:39:22.195199-05	655	Hall, Kai (L5) 943289 - High Bar - None	3		41	1
1214	2015-11-05 18:39:22.196147-05	656	Hall, Landon (L4) 996936 - Floor - None	3		41	1
1215	2015-11-05 18:39:22.197064-05	657	Hall, Landon (L4) 996936 - Rings - None	3		41	1
1216	2015-11-05 18:39:22.198-05	658	Hall, Landon (L4) 996936 - Pommel Horse - None	3		41	1
1217	2015-11-05 18:39:22.198944-05	659	Hall, Landon (L4) 996936 - Vault - None	3		41	1
1218	2015-11-05 18:39:22.19984-05	660	Hall, Landon (L4) 996936 - Parallel Bars - None	3		41	1
1219	2015-11-05 18:39:22.200729-05	661	Hall, Landon (L4) 996936 - High Bar - None	3		41	1
1220	2015-11-05 18:39:22.201615-05	716	Hayter, Jackson (L4) 991283 - Floor - None	3		41	1
1221	2015-11-05 18:39:22.202499-05	717	Hayter, Jackson (L4) 991283 - Rings - None	3		41	1
1222	2015-11-05 18:39:22.203378-05	718	Hayter, Jackson (L4) 991283 - Pommel Horse - None	3		41	1
1223	2015-11-05 18:39:22.204575-05	719	Hayter, Jackson (L4) 991283 - Vault - None	3		41	1
1224	2015-11-05 18:39:22.205826-05	720	Hayter, Jackson (L4) 991283 - Parallel Bars - None	3		41	1
1225	2015-11-05 18:39:22.206809-05	721	Hayter, Jackson (L4) 991283 - High Bar - None	3		41	1
1226	2015-11-05 18:39:22.207689-05	722	Hayter, Miles (L5) 937335 - Floor - None	3		41	1
1227	2015-11-05 18:39:22.208716-05	723	Hayter, Miles (L5) 937335 - Rings - None	3		41	1
1228	2015-11-05 18:39:22.209692-05	724	Hayter, Miles (L5) 937335 - Pommel Horse - None	3		41	1
1229	2015-11-05 18:39:22.210643-05	725	Hayter, Miles (L5) 937335 - Vault - None	3		41	1
1230	2015-11-05 18:39:22.211615-05	726	Hayter, Miles (L5) 937335 - Parallel Bars - None	3		41	1
1231	2015-11-05 18:39:22.212611-05	727	Hayter, Miles (L5) 937335 - High Bar - None	3		41	1
1232	2015-11-05 18:39:22.213558-05	1052	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Floor - None	3		41	1
1233	2015-11-05 18:39:22.214484-05	1053	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Rings - None	3		41	1
1234	2015-11-05 18:39:22.215423-05	1054	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Pommel Horse - None	3		41	1
1235	2015-11-05 18:39:22.216317-05	1055	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Vault - None	3		41	1
1236	2015-11-05 18:39:22.217297-05	1056	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Parallel Bars - None	3		41	1
1237	2015-11-05 18:39:22.21827-05	1057	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - High Bar - None	3		41	1
1238	2015-11-05 18:39:22.219263-05	734	FLAGGED! Henry-Price, Joshua (L8) 455261 - Floor - None	3		41	1
1239	2015-11-05 18:39:22.220209-05	735	FLAGGED! Henry-Price, Joshua (L8) 455261 - Rings - None	3		41	1
1240	2015-11-05 18:39:22.221141-05	736	FLAGGED! Henry-Price, Joshua (L8) 455261 - Pommel Horse - None	3		41	1
1241	2015-11-05 18:39:22.222062-05	737	FLAGGED! Henry-Price, Joshua (L8) 455261 - Vault - None	3		41	1
1242	2015-11-05 18:39:22.222988-05	738	FLAGGED! Henry-Price, Joshua (L8) 455261 - Parallel Bars - None	3		41	1
1243	2015-11-05 18:39:22.223886-05	739	FLAGGED! Henry-Price, Joshua (L8) 455261 - High Bar - None	3		41	1
1244	2015-11-05 18:39:22.224874-05	740	Hewitt, Donovan (L9) 405498 - Floor - None	3		41	1
1245	2015-11-05 18:39:22.225886-05	741	Hewitt, Donovan (L9) 405498 - Rings - None	3		41	1
1246	2015-11-05 18:39:22.226861-05	742	Hewitt, Donovan (L9) 405498 - Pommel Horse - None	3		41	1
1247	2015-11-05 18:39:22.227805-05	743	Hewitt, Donovan (L9) 405498 - Vault - None	3		41	1
1248	2015-11-05 18:39:22.228727-05	744	Hewitt, Donovan (L9) 405498 - Parallel Bars - None	3		41	1
1249	2015-11-05 18:39:22.229686-05	745	Hewitt, Donovan (L9) 405498 - High Bar - None	3		41	1
1250	2015-11-05 18:39:22.23061-05	824	Jackson, Tyler (L4) 999856 - Floor - None	3		41	1
1251	2015-11-05 18:39:22.231584-05	825	Jackson, Tyler (L4) 999856 - Rings - None	3		41	1
1252	2015-11-05 18:39:22.232548-05	826	Jackson, Tyler (L4) 999856 - Pommel Horse - None	3		41	1
1253	2015-11-05 18:39:22.233494-05	827	Jackson, Tyler (L4) 999856 - Vault - None	3		41	1
1254	2015-11-05 18:39:22.234351-05	828	Jackson, Tyler (L4) 999856 - Parallel Bars - None	3		41	1
1255	2015-11-05 18:39:22.235273-05	829	Jackson, Tyler (L4) 999856 - High Bar - None	3		41	1
1256	2015-11-05 18:39:22.236221-05	830	Jarrell, Christian (L10) 198617 - Floor - None	3		41	1
1257	2015-11-05 18:39:22.237149-05	831	Jarrell, Christian (L10) 198617 - Rings - None	3		41	1
1258	2015-11-05 18:39:22.238045-05	832	Jarrell, Christian (L10) 198617 - Pommel Horse - None	3		41	1
1259	2015-11-05 18:39:22.238987-05	833	Jarrell, Christian (L10) 198617 - Vault - None	3		41	1
1260	2015-11-05 18:39:22.239885-05	834	Jarrell, Christian (L10) 198617 - Parallel Bars - None	3		41	1
1261	2015-11-05 18:39:22.240935-05	835	Jarrell, Christian (L10) 198617 - High Bar - None	3		41	1
1262	2015-11-05 18:39:22.241944-05	860	Kanthan, Kush (L7) 500063 - Floor - None	3		41	1
1263	2015-11-05 18:39:22.242872-05	861	Kanthan, Kush (L7) 500063 - Rings - None	3		41	1
1264	2015-11-05 18:39:22.243841-05	862	Kanthan, Kush (L7) 500063 - Pommel Horse - None	3		41	1
1265	2015-11-05 18:39:22.244763-05	863	Kanthan, Kush (L7) 500063 - Vault - None	3		41	1
1266	2015-11-05 18:39:22.245686-05	864	Kanthan, Kush (L7) 500063 - Parallel Bars - None	3		41	1
1267	2015-11-05 18:39:22.246599-05	865	Kanthan, Kush (L7) 500063 - High Bar - None	3		41	1
1268	2015-11-05 18:39:22.247524-05	1028	Louloudes, NIcholas (L9) 422161 - Floor - None	3		41	1
1269	2015-11-05 18:39:22.248415-05	1029	Louloudes, NIcholas (L9) 422161 - Rings - None	3		41	1
1270	2015-11-05 18:39:22.249361-05	1030	Louloudes, NIcholas (L9) 422161 - Pommel Horse - None	3		41	1
1271	2015-11-05 18:39:22.250255-05	1031	Louloudes, NIcholas (L9) 422161 - Vault - None	3		41	1
1272	2015-11-05 18:39:22.251187-05	1032	Louloudes, NIcholas (L9) 422161 - Parallel Bars - None	3		41	1
1273	2015-11-05 18:39:22.25208-05	1033	Louloudes, NIcholas (L9) 422161 - High Bar - None	3		41	1
1274	2015-11-05 18:39:22.25299-05	1082	Mason, Jan (L4) 991280 - Floor - None	3		41	1
1275	2015-11-05 18:39:22.253963-05	1083	Mason, Jan (L4) 991280 - Rings - None	3		41	1
1276	2015-11-05 18:39:22.254924-05	1084	Mason, Jan (L4) 991280 - Pommel Horse - None	3		41	1
1277	2015-11-05 18:39:22.255822-05	1085	Mason, Jan (L4) 991280 - Vault - None	3		41	1
1278	2015-11-05 18:39:22.256743-05	1086	Mason, Jan (L4) 991280 - Parallel Bars - None	3		41	1
1279	2015-11-05 18:39:22.25775-05	1087	Mason, Jan (L4) 991280 - High Bar - None	3		41	1
1280	2015-11-05 18:39:22.25868-05	1137	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Floor - None	3		41	1
1281	2015-11-05 18:39:22.259594-05	1138	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Rings - None	3		41	1
1282	2015-11-05 18:39:22.260563-05	1139	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Pommel Horse - None	3		41	1
1283	2015-11-05 18:39:22.261488-05	1140	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Vault - None	3		41	1
1284	2015-11-05 18:39:22.262455-05	1141	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Parallel Bars - None	3		41	1
1285	2015-11-05 18:39:22.263433-05	1142	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - High Bar - None	3		41	1
1286	2015-11-05 18:39:22.26448-05	1240	Ngo, Quinlan (L8) 500064 - Floor - None	3		41	1
1287	2015-11-05 18:39:22.265538-05	1241	Ngo, Quinlan (L8) 500064 - Rings - None	3		41	1
1288	2015-11-05 18:39:22.266582-05	1242	Ngo, Quinlan (L8) 500064 - Pommel Horse - None	3		41	1
1289	2015-11-05 18:39:22.267513-05	1243	Ngo, Quinlan (L8) 500064 - Vault - None	3		41	1
1290	2015-11-05 18:39:22.268428-05	1244	Ngo, Quinlan (L8) 500064 - Parallel Bars - None	3		41	1
1291	2015-11-05 18:39:22.269396-05	1245	Ngo, Quinlan (L8) 500064 - High Bar - None	3		41	1
1292	2015-11-05 18:39:22.270361-05	1246	Nguyen, Damon (L6) 547955 - Floor - None	3		41	1
1293	2015-11-05 18:39:22.271319-05	1247	Nguyen, Damon (L6) 547955 - Rings - None	3		41	1
1294	2015-11-05 18:39:22.272227-05	1248	Nguyen, Damon (L6) 547955 - Pommel Horse - None	3		41	1
1295	2015-11-05 18:39:22.27317-05	1249	Nguyen, Damon (L6) 547955 - Vault - None	3		41	1
1296	2015-11-05 18:39:22.274072-05	1250	Nguyen, Damon (L6) 547955 - Parallel Bars - None	3		41	1
1297	2015-11-05 18:39:22.27511-05	1251	Nguyen, Damon (L6) 547955 - High Bar - None	3		41	1
1298	2015-11-05 18:39:22.276101-05	1252	Nguyen, Thanh-Trieu (L6) 614759 - Floor - None	3		41	1
1299	2015-11-05 18:39:22.276985-05	1253	Nguyen, Thanh-Trieu (L6) 614759 - Rings - None	3		41	1
1300	2015-11-05 18:39:22.277974-05	1254	Nguyen, Thanh-Trieu (L6) 614759 - Pommel Horse - None	3		41	1
1301	2015-11-05 18:39:22.278912-05	1255	Nguyen, Thanh-Trieu (L6) 614759 - Vault - None	3		41	1
1302	2015-11-05 18:39:22.279828-05	1256	Nguyen, Thanh-Trieu (L6) 614759 - Parallel Bars - None	3		41	1
1303	2015-11-05 18:39:22.280764-05	1257	Nguyen, Thanh-Trieu (L6) 614759 - High Bar - None	3		41	1
1304	2015-11-05 18:39:22.281685-05	1258	Nguyen, Thien-Trieu (L4) 1010423 - Floor - None	3		41	1
1305	2015-11-05 18:39:22.282581-05	1259	Nguyen, Thien-Trieu (L4) 1010423 - Rings - None	3		41	1
1306	2015-11-05 18:39:22.283543-05	1260	Nguyen, Thien-Trieu (L4) 1010423 - Pommel Horse - None	3		41	1
1307	2015-11-05 18:39:22.284458-05	1261	Nguyen, Thien-Trieu (L4) 1010423 - Vault - None	3		41	1
1308	2015-11-05 18:39:22.285456-05	1262	Nguyen, Thien-Trieu (L4) 1010423 - Parallel Bars - None	3		41	1
1309	2015-11-05 18:39:22.286447-05	1263	Nguyen, Thien-Trieu (L4) 1010423 - High Bar - None	3		41	1
1310	2015-11-05 18:39:22.28741-05	1366	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Floor - None	3		41	1
1311	2015-11-05 18:39:22.288345-05	1367	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Rings - None	3		41	1
1312	2015-11-05 18:39:22.289285-05	1368	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Pommel Horse - None	3		41	1
1313	2015-11-05 18:39:22.290226-05	1369	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Vault - None	3		41	1
1314	2015-11-05 18:39:22.291155-05	1370	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Parallel Bars - None	3		41	1
1315	2015-11-05 18:39:22.292089-05	1371	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - High Bar - None	3		41	1
1316	2015-11-05 18:39:22.292996-05	1378	Rice, Cameron (L10) 274588 - Floor - None	3		41	1
1317	2015-11-05 18:39:22.293937-05	1379	Rice, Cameron (L10) 274588 - Rings - None	3		41	1
1318	2015-11-05 18:39:22.294869-05	1380	Rice, Cameron (L10) 274588 - Pommel Horse - None	3		41	1
1319	2015-11-05 18:39:22.295802-05	1381	Rice, Cameron (L10) 274588 - Vault - None	3		41	1
1320	2015-11-05 18:39:22.296698-05	1382	Rice, Cameron (L10) 274588 - Parallel Bars - None	3		41	1
1321	2015-11-05 18:39:22.297701-05	1383	Rice, Cameron (L10) 274588 - High Bar - None	3		41	1
1322	2015-11-05 18:39:22.298733-05	1408	Rollins, Zachary (L7) 547957 - Floor - None	3		41	1
1323	2015-11-05 18:39:22.299715-05	1409	Rollins, Zachary (L7) 547957 - Rings - None	3		41	1
1324	2015-11-05 18:39:22.300661-05	1410	Rollins, Zachary (L7) 547957 - Pommel Horse - None	3		41	1
1325	2015-11-05 18:39:22.30164-05	1411	Rollins, Zachary (L7) 547957 - Vault - None	3		41	1
1326	2015-11-05 18:39:22.302577-05	1412	Rollins, Zachary (L7) 547957 - Parallel Bars - None	3		41	1
1327	2015-11-05 18:39:22.303515-05	1413	Rollins, Zachary (L7) 547957 - High Bar - None	3		41	1
1328	2015-11-05 18:39:22.304445-05	1468	Saine, Dawda (L6) 614762 - Floor - None	3		41	1
1329	2015-11-05 18:39:22.305347-05	1469	Saine, Dawda (L6) 614762 - Rings - None	3		41	1
1330	2015-11-05 18:39:22.306325-05	1470	Saine, Dawda (L6) 614762 - Pommel Horse - None	3		41	1
1331	2015-11-05 18:39:22.307249-05	1471	Saine, Dawda (L6) 614762 - Vault - None	3		41	1
1332	2015-11-05 18:39:22.308196-05	1472	Saine, Dawda (L6) 614762 - Parallel Bars - None	3		41	1
1333	2015-11-05 18:39:22.309244-05	1473	Saine, Dawda (L6) 614762 - High Bar - None	3		41	1
1334	2015-11-05 18:39:22.310201-05	1576	Singleton, Brandon (L8) 455967 - Floor - None	3		41	1
1335	2015-11-05 18:39:22.311139-05	1577	Singleton, Brandon (L8) 455967 - Rings - None	3		41	1
1336	2015-11-05 18:39:22.312125-05	1578	Singleton, Brandon (L8) 455967 - Pommel Horse - None	3		41	1
1337	2015-11-05 18:39:22.313061-05	1579	Singleton, Brandon (L8) 455967 - Vault - None	3		41	1
1338	2015-11-05 18:39:22.314013-05	1580	Singleton, Brandon (L8) 455967 - Parallel Bars - None	3		41	1
1339	2015-11-05 18:39:22.31495-05	1581	Singleton, Brandon (L8) 455967 - High Bar - None	3		41	1
1340	2015-11-05 18:39:22.315845-05	1582	Singleton, Jason (L7) 547954 - Floor - None	3		41	1
1341	2015-11-05 18:39:22.316908-05	1583	Singleton, Jason (L7) 547954 - Rings - None	3		41	1
1342	2015-11-05 18:39:22.318-05	1584	Singleton, Jason (L7) 547954 - Pommel Horse - None	3		41	1
1343	2015-11-05 18:39:22.318969-05	1585	Singleton, Jason (L7) 547954 - Vault - None	3		41	1
1344	2015-11-05 18:39:22.319889-05	1586	Singleton, Jason (L7) 547954 - Parallel Bars - None	3		41	1
1345	2015-11-05 18:39:22.320803-05	1587	Singleton, Jason (L7) 547954 - High Bar - None	3		41	1
1346	2015-11-05 18:39:22.321766-05	1618	Spurlock, Ibraheem (L8) 614761 - Floor - None	3		41	1
1347	2015-11-05 18:39:22.322681-05	1619	Spurlock, Ibraheem (L8) 614761 - Rings - None	3		41	1
1348	2015-11-05 18:39:22.323649-05	1620	Spurlock, Ibraheem (L8) 614761 - Pommel Horse - None	3		41	1
1349	2015-11-05 18:39:22.324581-05	1621	Spurlock, Ibraheem (L8) 614761 - Vault - None	3		41	1
1350	2015-11-05 18:39:22.325568-05	1622	Spurlock, Ibraheem (L8) 614761 - Parallel Bars - None	3		41	1
1351	2015-11-05 18:39:22.326554-05	1623	Spurlock, Ibraheem (L8) 614761 - High Bar - None	3		41	1
1352	2015-11-05 18:39:22.32749-05	1654	Syed, Aaban (L8) 500067 - Floor - None	3		41	1
1353	2015-11-05 18:39:22.328409-05	1655	Syed, Aaban (L8) 500067 - Rings - None	3		41	1
1354	2015-11-05 18:39:22.329376-05	1656	Syed, Aaban (L8) 500067 - Pommel Horse - None	3		41	1
1355	2015-11-05 18:39:22.330281-05	1657	Syed, Aaban (L8) 500067 - Vault - None	3		41	1
1356	2015-11-05 18:39:22.331193-05	1658	Syed, Aaban (L8) 500067 - Parallel Bars - None	3		41	1
1357	2015-11-05 18:39:22.332238-05	1659	Syed, Aaban (L8) 500067 - High Bar - None	3		41	1
1358	2015-11-05 18:39:22.333363-05	1690	Tran, Eric (L8) 500072 - Floor - None	3		41	1
1359	2015-11-05 18:39:22.334606-05	1691	Tran, Eric (L8) 500072 - Rings - None	3		41	1
1360	2015-11-05 18:39:22.335626-05	1692	Tran, Eric (L8) 500072 - Pommel Horse - None	3		41	1
1361	2015-11-05 18:39:22.336558-05	1693	Tran, Eric (L8) 500072 - Vault - None	3		41	1
1362	2015-11-05 18:39:22.337564-05	1694	Tran, Eric (L8) 500072 - Parallel Bars - None	3		41	1
1363	2015-11-05 18:39:22.338525-05	1695	Tran, Eric (L8) 500072 - High Bar - None	3		41	1
1364	2015-11-05 18:39:22.339466-05	1726	Venit, Michael (L8) 500075 - Floor - None	3		41	1
1365	2015-11-05 18:39:22.340392-05	1727	Venit, Michael (L8) 500075 - Rings - None	3		41	1
1366	2015-11-05 18:39:22.341274-05	1728	Venit, Michael (L8) 500075 - Pommel Horse - None	3		41	1
1367	2015-11-05 18:39:22.342371-05	1729	Venit, Michael (L8) 500075 - Vault - None	3		41	1
1368	2015-11-05 18:39:22.343365-05	1730	Venit, Michael (L8) 500075 - Parallel Bars - None	3		41	1
1369	2015-11-05 18:39:22.344345-05	1731	Venit, Michael (L8) 500075 - High Bar - None	3		41	1
1370	2015-11-05 18:39:22.345315-05	1774	Wedge, Simon (L4) 994241 - Floor - None	3		41	1
1371	2015-11-05 18:39:22.346298-05	1775	Wedge, Simon (L4) 994241 - Rings - None	3		41	1
1372	2015-11-05 18:39:22.34726-05	1776	Wedge, Simon (L4) 994241 - Pommel Horse - None	3		41	1
1373	2015-11-05 18:39:22.348298-05	1777	Wedge, Simon (L4) 994241 - Vault - None	3		41	1
1374	2015-11-05 18:39:22.349275-05	1778	Wedge, Simon (L4) 994241 - Parallel Bars - None	3		41	1
1375	2015-11-05 18:39:22.350253-05	1779	Wedge, Simon (L4) 994241 - High Bar - None	3		41	1
1376	2015-11-05 18:39:22.35122-05	1402	FLAGGED! Roham, Nima (L6) 472060 - Floor - None	3		41	1
1377	2015-11-05 18:39:22.352207-05	1403	FLAGGED! Roham, Nima (L6) 472060 - Rings - None	3		41	1
1378	2015-11-05 18:39:22.353135-05	1404	FLAGGED! Roham, Nima (L6) 472060 - Pommel Horse - None	3		41	1
1379	2015-11-05 18:39:22.35405-05	1405	FLAGGED! Roham, Nima (L6) 472060 - Vault - None	3		41	1
1380	2015-11-05 18:39:22.35537-05	1406	FLAGGED! Roham, Nima (L6) 472060 - Parallel Bars - None	3		41	1
1381	2015-11-05 18:39:22.356443-05	1407	FLAGGED! Roham, Nima (L6) 472060 - High Bar - None	3		41	1
1382	2015-11-05 18:39:22.357404-05	1426	Rothwell, Daniel (L6) 643533 - Floor - None	3		41	1
1383	2015-11-05 18:39:22.358344-05	1427	Rothwell, Daniel (L6) 643533 - Rings - None	3		41	1
1384	2015-11-05 18:39:22.359341-05	1428	Rothwell, Daniel (L6) 643533 - Pommel Horse - None	3		41	1
1385	2015-11-05 18:39:22.360284-05	1429	Rothwell, Daniel (L6) 643533 - Vault - None	3		41	1
1386	2015-11-05 18:39:22.361211-05	1430	Rothwell, Daniel (L6) 643533 - Parallel Bars - None	3		41	1
1387	2015-11-05 18:39:22.362163-05	1431	Rothwell, Daniel (L6) 643533 - High Bar - None	3		41	1
1388	2015-11-05 18:39:22.36306-05	1660	FLAGGED! Synder, Luke (L6) 382688 - Floor - None	3		41	1
1389	2015-11-05 18:39:22.36409-05	1661	FLAGGED! Synder, Luke (L6) 382688 - Rings - None	3		41	1
1390	2015-11-05 18:39:22.365141-05	1662	FLAGGED! Synder, Luke (L6) 382688 - Pommel Horse - None	3		41	1
1391	2015-11-05 18:39:22.366036-05	1663	FLAGGED! Synder, Luke (L6) 382688 - Vault - None	3		41	1
1392	2015-11-05 18:39:22.366973-05	1664	FLAGGED! Synder, Luke (L6) 382688 - Parallel Bars - None	3		41	1
1393	2015-11-05 18:39:22.367903-05	1665	FLAGGED! Synder, Luke (L6) 382688 - High Bar - None	3		41	1
1394	2015-11-05 18:39:22.368803-05	560	Golden, Benjamin (L5) 535082 - Floor - None	3		41	1
1395	2015-11-05 18:39:22.369698-05	561	Golden, Benjamin (L5) 535082 - Rings - None	3		41	1
1396	2015-11-05 18:39:22.370592-05	562	Golden, Benjamin (L5) 535082 - Pommel Horse - None	3		41	1
1397	2015-11-05 18:39:22.371655-05	563	Golden, Benjamin (L5) 535082 - Vault - None	3		41	1
1398	2015-11-05 18:39:22.372615-05	564	Golden, Benjamin (L5) 535082 - Parallel Bars - None	3		41	1
1399	2015-11-05 18:39:22.373727-05	565	Golden, Benjamin (L5) 535082 - High Bar - None	3		41	1
1400	2015-11-05 18:39:22.374767-05	68	Bantug, Milo (L5) 643528 - Floor - None	3		41	1
1401	2015-11-05 18:39:22.375711-05	69	Bantug, Milo (L5) 643528 - Rings - None	3		41	1
1402	2015-11-05 18:39:22.376697-05	70	Bantug, Milo (L5) 643528 - Pommel Horse - None	3		41	1
1403	2015-11-05 18:39:22.377623-05	71	Bantug, Milo (L5) 643528 - Vault - None	3		41	1
1404	2015-11-05 18:39:22.378585-05	72	Bantug, Milo (L5) 643528 - Parallel Bars - None	3		41	1
1405	2015-11-05 18:39:22.379627-05	73	Bantug, Milo (L5) 643528 - High Bar - None	3		41	1
1406	2015-11-05 18:39:22.380597-05	1498	Schlueter, Matthew (L5) 643536 - Floor - None	3		41	1
1407	2015-11-05 18:39:22.381528-05	1499	Schlueter, Matthew (L5) 643536 - Rings - None	3		41	1
1408	2015-11-05 18:39:22.382476-05	1500	Schlueter, Matthew (L5) 643536 - Pommel Horse - None	3		41	1
1409	2015-11-05 18:39:22.383401-05	1501	Schlueter, Matthew (L5) 643536 - Vault - None	3		41	1
1410	2015-11-05 18:39:22.384351-05	1502	Schlueter, Matthew (L5) 643536 - Parallel Bars - None	3		41	1
1411	2015-11-05 18:39:22.385262-05	1503	Schlueter, Matthew (L5) 643536 - High Bar - None	3		41	1
1412	2015-11-05 18:39:22.386155-05	548	Getz, Gabriel (L5) 581849 - Floor - None	3		41	1
1413	2015-11-05 18:39:22.387038-05	549	Getz, Gabriel (L5) 581849 - Rings - None	3		41	1
1414	2015-11-05 18:39:22.388038-05	550	Getz, Gabriel (L5) 581849 - Pommel Horse - None	3		41	1
1415	2015-11-05 18:39:22.389067-05	551	Getz, Gabriel (L5) 581849 - Vault - None	3		41	1
1416	2015-11-05 18:39:22.390074-05	552	Getz, Gabriel (L5) 581849 - Parallel Bars - None	3		41	1
1417	2015-11-05 18:39:22.391085-05	553	Getz, Gabriel (L5) 581849 - High Bar - None	3		41	1
1418	2015-11-05 18:39:22.392042-05	686	FLAGGED! Harnish, Matthew (L4) 958266 - Floor - None	3		41	1
1419	2015-11-05 18:39:22.393013-05	687	FLAGGED! Harnish, Matthew (L4) 958266 - Rings - None	3		41	1
1420	2015-11-05 18:39:22.393993-05	688	FLAGGED! Harnish, Matthew (L4) 958266 - Pommel Horse - None	3		41	1
1421	2015-11-05 18:39:22.395028-05	689	FLAGGED! Harnish, Matthew (L4) 958266 - Vault - None	3		41	1
1422	2015-11-05 18:39:22.396035-05	690	FLAGGED! Harnish, Matthew (L4) 958266 - Parallel Bars - None	3		41	1
1423	2015-11-05 18:39:22.396997-05	691	FLAGGED! Harnish, Matthew (L4) 958266 - High Bar - None	3		41	1
1424	2015-11-05 18:39:22.397956-05	992	Levi, Henry (L4) 658960 - Floor - None	3		41	1
1425	2015-11-05 18:39:22.398923-05	993	Levi, Henry (L4) 658960 - Rings - None	3		41	1
1426	2015-11-05 18:39:22.399877-05	994	Levi, Henry (L4) 658960 - Pommel Horse - None	3		41	1
1427	2015-11-05 18:39:22.40079-05	995	Levi, Henry (L4) 658960 - Vault - None	3		41	1
1428	2015-11-05 18:39:22.401717-05	996	Levi, Henry (L4) 658960 - Parallel Bars - None	3		41	1
1429	2015-11-05 18:39:22.402625-05	997	Levi, Henry (L4) 658960 - High Bar - None	3		41	1
1430	2015-11-05 18:39:22.403606-05	1107	Mazur-Chang, Konrad (L4)  - Floor - None	3		41	1
1431	2015-11-05 18:39:22.40455-05	1108	Mazur-Chang, Konrad (L4)  - Rings - None	3		41	1
1432	2015-11-05 18:39:22.405508-05	1109	Mazur-Chang, Konrad (L4)  - Pommel Horse - None	3		41	1
1433	2015-11-05 18:39:22.406547-05	1110	Mazur-Chang, Konrad (L4)  - Vault - None	3		41	1
1434	2015-11-05 18:39:22.40755-05	1111	Mazur-Chang, Konrad (L4)  - Parallel Bars - None	3		41	1
1435	2015-11-05 18:39:22.408586-05	1112	Mazur-Chang, Konrad (L4)  - High Bar - None	3		41	1
1436	2015-11-05 18:39:22.409557-05	788	Hoover, Caleb (L4)  - Floor - None	3		41	1
1437	2015-11-05 18:39:22.410525-05	789	Hoover, Caleb (L4)  - Rings - None	3		41	1
1438	2015-11-05 18:39:22.41153-05	790	Hoover, Caleb (L4)  - Pommel Horse - None	3		41	1
1439	2015-11-05 18:39:22.41254-05	791	Hoover, Caleb (L4)  - Vault - None	3		41	1
1440	2015-11-05 18:39:22.413501-05	792	Hoover, Caleb (L4)  - Parallel Bars - None	3		41	1
1441	2015-11-05 18:39:22.414488-05	793	Hoover, Caleb (L4)  - High Bar - None	3		41	1
1442	2015-11-05 18:39:22.415487-05	800	Im, Ozzy (L4)  - Floor - None	3		41	1
1445	2015-11-05 18:39:22.418326-05	803	Im, Ozzy (L4)  - Vault - None	3		41	1
1446	2015-11-05 18:39:22.419325-05	804	Im, Ozzy (L4)  - Parallel Bars - None	3		41	1
1447	2015-11-05 18:39:22.420308-05	805	Im, Ozzy (L4)  - High Bar - None	3		41	1
1448	2015-11-05 18:39:22.421281-05	8	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Floor - None	3		41	1
1449	2015-11-05 18:39:22.42222-05	9	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Rings - None	3		41	1
1450	2015-11-05 18:39:22.423253-05	10	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Pommel Horse - None	3		41	1
1451	2015-11-05 18:39:22.424243-05	11	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Vault - None	3		41	1
1452	2015-11-05 18:39:22.425168-05	12	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Parallel Bars - None	3		41	1
1453	2015-11-05 18:39:22.42619-05	13	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - High Bar - None	3		41	1
1454	2015-11-05 18:39:22.427115-05	842	Jones, William (L4) 1017124 - Floor - None	3		41	1
1455	2015-11-05 18:39:22.428176-05	843	Jones, William (L4) 1017124 - Rings - None	3		41	1
1456	2015-11-05 18:39:22.429178-05	844	Jones, William (L4) 1017124 - Pommel Horse - None	3		41	1
1457	2015-11-05 18:39:22.430123-05	845	Jones, William (L4) 1017124 - Vault - None	3		41	1
1458	2015-11-05 18:39:22.431077-05	846	Jones, William (L4) 1017124 - Parallel Bars - None	3		41	1
1459	2015-11-05 18:39:22.431996-05	847	Jones, William (L4) 1017124 - High Bar - None	3		41	1
1460	2015-11-05 18:39:22.432928-05	1486	Sault, Kenneth (L4) 1000972 - Floor - None	3		41	1
1461	2015-11-05 18:39:22.43387-05	1487	Sault, Kenneth (L4) 1000972 - Rings - None	3		41	1
1462	2015-11-05 18:39:22.434813-05	1488	Sault, Kenneth (L4) 1000972 - Pommel Horse - None	3		41	1
1463	2015-11-05 18:39:22.435788-05	1489	Sault, Kenneth (L4) 1000972 - Vault - None	3		41	1
1464	2015-11-05 18:39:22.43681-05	1490	Sault, Kenneth (L4) 1000972 - Parallel Bars - None	3		41	1
1465	2015-11-05 18:39:22.437752-05	1491	Sault, Kenneth (L4) 1000972 - High Bar - None	3		41	1
1466	2015-11-05 18:39:22.438708-05	728	Heald, Jason (L5) 944315 - Floor - None	3		41	1
1467	2015-11-05 18:39:22.439608-05	729	Heald, Jason (L5) 944315 - Rings - None	3		41	1
1468	2015-11-05 18:39:22.440513-05	730	Heald, Jason (L5) 944315 - Pommel Horse - None	3		41	1
1469	2015-11-05 18:39:22.441418-05	731	Heald, Jason (L5) 944315 - Vault - None	3		41	1
1470	2015-11-05 18:39:22.442443-05	732	Heald, Jason (L5) 944315 - Parallel Bars - None	3		41	1
1471	2015-11-05 18:39:22.443474-05	733	Heald, Jason (L5) 944315 - High Bar - None	3		41	1
1472	2015-11-05 18:39:22.444496-05	1173	Montes, Gunnar (L5) 589690 - Floor - None	3		41	1
1473	2015-11-05 18:39:22.445503-05	1174	Montes, Gunnar (L5) 589690 - Rings - None	3		41	1
1474	2015-11-05 18:39:22.446473-05	1175	Montes, Gunnar (L5) 589690 - Pommel Horse - None	3		41	1
1475	2015-11-05 18:39:22.447407-05	1176	Montes, Gunnar (L5) 589690 - Vault - None	3		41	1
1476	2015-11-05 18:39:22.448405-05	1177	Montes, Gunnar (L5) 589690 - Parallel Bars - None	3		41	1
1477	2015-11-05 18:39:22.449349-05	1178	Montes, Gunnar (L5) 589690 - High Bar - None	3		41	1
1478	2015-11-05 18:39:22.450276-05	1396	Robertson, Connor (L5) 639978 - Floor - None	3		41	1
1479	2015-11-05 18:39:22.451177-05	1397	Robertson, Connor (L5) 639978 - Rings - None	3		41	1
1480	2015-11-05 18:39:22.452166-05	1398	Robertson, Connor (L5) 639978 - Pommel Horse - None	3		41	1
1481	2015-11-05 18:39:22.453116-05	1399	Robertson, Connor (L5) 639978 - Vault - None	3		41	1
1482	2015-11-05 18:39:22.454022-05	1400	Robertson, Connor (L5) 639978 - Parallel Bars - None	3		41	1
1483	2015-11-05 18:39:22.454948-05	1401	Robertson, Connor (L5) 639978 - High Bar - None	3		41	1
1484	2015-11-05 18:39:22.455843-05	74	Barber, Aaron (L6) 539860 - Floor - None	3		41	1
1485	2015-11-05 18:39:22.45687-05	75	Barber, Aaron (L6) 539860 - Rings - None	3		41	1
1486	2015-11-05 18:39:22.457904-05	76	Barber, Aaron (L6) 539860 - Pommel Horse - None	3		41	1
1487	2015-11-05 18:39:22.458961-05	77	Barber, Aaron (L6) 539860 - Vault - None	3		41	1
1488	2015-11-05 18:39:22.459958-05	78	Barber, Aaron (L6) 539860 - Parallel Bars - None	3		41	1
1489	2015-11-05 18:39:22.460931-05	79	Barber, Aaron (L6) 539860 - High Bar - None	3		41	1
1490	2015-11-05 18:39:22.461947-05	128	Bishop, James (L6) 580814 - Floor - None	3		41	1
1491	2015-11-05 18:39:22.46302-05	129	Bishop, James (L6) 580814 - Rings - None	3		41	1
1492	2015-11-05 18:39:22.464065-05	130	Bishop, James (L6) 580814 - Pommel Horse - None	3		41	1
1493	2015-11-05 18:39:22.465132-05	131	Bishop, James (L6) 580814 - Vault - None	3		41	1
1494	2015-11-05 18:39:22.466213-05	132	Bishop, James (L6) 580814 - Parallel Bars - None	3		41	1
1495	2015-11-05 18:39:22.46716-05	133	Bishop, James (L6) 580814 - High Bar - None	3		41	1
1496	2015-11-05 18:39:22.46813-05	146	Boyle, Logan (L6) 550911 - Floor - None	3		41	1
1497	2015-11-05 18:39:22.469038-05	147	Boyle, Logan (L6) 550911 - Rings - None	3		41	1
1498	2015-11-05 18:39:22.469935-05	148	Boyle, Logan (L6) 550911 - Pommel Horse - None	3		41	1
1499	2015-11-05 18:39:22.470869-05	149	Boyle, Logan (L6) 550911 - Vault - None	3		41	1
1500	2015-11-05 18:39:22.471774-05	150	Boyle, Logan (L6) 550911 - Parallel Bars - None	3		41	1
1501	2015-11-05 18:39:22.472666-05	151	Boyle, Logan (L6) 550911 - High Bar - None	3		41	1
1502	2015-11-05 18:39:22.473865-05	1558	Shinn, Jacob (L6) 577015 - Floor - None	3		41	1
1503	2015-11-05 18:39:22.475038-05	1559	Shinn, Jacob (L6) 577015 - Rings - None	3		41	1
1504	2015-11-05 18:39:22.476089-05	1560	Shinn, Jacob (L6) 577015 - Pommel Horse - None	3		41	1
1505	2015-11-05 18:39:22.477124-05	1561	Shinn, Jacob (L6) 577015 - Vault - None	3		41	1
1506	2015-11-05 18:39:22.47811-05	1562	Shinn, Jacob (L6) 577015 - Parallel Bars - None	3		41	1
1507	2015-11-05 18:39:22.479124-05	1563	Shinn, Jacob (L6) 577015 - High Bar - None	3		41	1
1508	2015-11-05 18:39:22.480123-05	1636	Sturgeon, Lawrence (L6) 550914 - Floor - None	3		41	1
1509	2015-11-05 18:39:22.481078-05	1637	Sturgeon, Lawrence (L6) 550914 - Rings - None	3		41	1
1510	2015-11-05 18:39:22.482118-05	1638	Sturgeon, Lawrence (L6) 550914 - Pommel Horse - None	3		41	1
1511	2015-11-05 18:39:22.483022-05	1639	Sturgeon, Lawrence (L6) 550914 - Vault - None	3		41	1
1512	2015-11-05 18:39:22.483968-05	1640	Sturgeon, Lawrence (L6) 550914 - Parallel Bars - None	3		41	1
1513	2015-11-05 18:39:22.48485-05	1641	Sturgeon, Lawrence (L6) 550914 - High Bar - None	3		41	1
1514	2015-11-05 18:39:22.485725-05	1642	Sullivan, Cameron (L6) 590646 - Floor - None	3		41	1
1515	2015-11-05 18:39:22.486591-05	1643	Sullivan, Cameron (L6) 590646 - Rings - None	3		41	1
1516	2015-11-05 18:39:22.487612-05	1644	Sullivan, Cameron (L6) 590646 - Pommel Horse - None	3		41	1
1517	2015-11-05 18:39:22.488593-05	1645	Sullivan, Cameron (L6) 590646 - Vault - None	3		41	1
1518	2015-11-05 18:39:22.489563-05	1646	Sullivan, Cameron (L6) 590646 - Parallel Bars - None	3		41	1
1519	2015-11-05 18:39:22.490756-05	1647	Sullivan, Cameron (L6) 590646 - High Bar - None	3		41	1
1520	2015-11-05 18:39:22.491941-05	1756	Warra, Makennen (L6) 550699 - Floor - None	3		41	1
1521	2015-11-05 18:39:22.493129-05	1757	Warra, Makennen (L6) 550699 - Rings - None	3		41	1
1522	2015-11-05 18:39:22.494203-05	1758	Warra, Makennen (L6) 550699 - Pommel Horse - None	3		41	1
1523	2015-11-05 18:39:22.495252-05	1759	Warra, Makennen (L6) 550699 - Vault - None	3		41	1
1524	2015-11-05 18:39:22.496335-05	1760	Warra, Makennen (L6) 550699 - Parallel Bars - None	3		41	1
1525	2015-11-05 18:39:22.497361-05	1761	Warra, Makennen (L6) 550699 - High Bar - None	3		41	1
1526	2015-11-05 18:39:22.498363-05	350	Defoor, Dylan (L7) 540046 - Floor - None	3		41	1
1527	2015-11-05 18:39:22.49928-05	351	Defoor, Dylan (L7) 540046 - Rings - None	3		41	1
1528	2015-11-05 18:39:22.500263-05	352	Defoor, Dylan (L7) 540046 - Pommel Horse - None	3		41	1
1529	2015-11-05 18:39:22.501234-05	353	Defoor, Dylan (L7) 540046 - Vault - None	3		41	1
1530	2015-11-05 18:39:22.502183-05	354	Defoor, Dylan (L7) 540046 - Parallel Bars - None	3		41	1
1531	2015-11-05 18:39:22.503071-05	355	Defoor, Dylan (L7) 540046 - High Bar - None	3		41	1
1532	2015-11-05 18:39:22.504084-05	344	DeNisco, Nick (L4) 1008616 - Floor - None	3		41	1
1533	2015-11-05 18:39:22.505051-05	345	DeNisco, Nick (L4) 1008616 - Rings - None	3		41	1
1534	2015-11-05 18:39:22.505986-05	346	DeNisco, Nick (L4) 1008616 - Pommel Horse - None	3		41	1
1535	2015-11-05 18:39:22.506887-05	347	DeNisco, Nick (L4) 1008616 - Vault - None	3		41	1
1536	2015-11-05 18:39:22.507836-05	348	DeNisco, Nick (L4) 1008616 - Parallel Bars - None	3		41	1
1537	2015-11-05 18:39:22.508748-05	349	DeNisco, Nick (L4) 1008616 - High Bar - None	3		41	1
1538	2015-11-05 18:39:22.509673-05	1768	Wayland, Seth (L4) 1008613 - Floor - None	3		41	1
1539	2015-11-05 18:39:22.510719-05	1769	Wayland, Seth (L4) 1008613 - Rings - None	3		41	1
1540	2015-11-05 18:39:22.511717-05	1770	Wayland, Seth (L4) 1008613 - Pommel Horse - None	3		41	1
1541	2015-11-05 18:39:22.512693-05	1771	Wayland, Seth (L4) 1008613 - Vault - None	3		41	1
1542	2015-11-05 18:39:22.513644-05	1772	Wayland, Seth (L4) 1008613 - Parallel Bars - None	3		41	1
1543	2015-11-05 18:39:22.514574-05	1773	Wayland, Seth (L4) 1008613 - High Bar - None	3		41	1
1544	2015-11-05 18:39:22.515501-05	1222	Murry, Garrett (L4) 1015881 - Floor - None	3		41	1
1545	2015-11-05 18:39:22.516425-05	1223	Murry, Garrett (L4) 1015881 - Rings - None	3		41	1
1546	2015-11-05 18:39:22.51732-05	1224	Murry, Garrett (L4) 1015881 - Pommel Horse - None	3		41	1
1547	2015-11-05 18:39:22.518723-05	1225	Murry, Garrett (L4) 1015881 - Vault - None	3		41	1
1548	2015-11-05 18:39:22.519771-05	1226	Murry, Garrett (L4) 1015881 - Parallel Bars - None	3		41	1
1549	2015-11-05 18:39:22.520714-05	1227	Murry, Garrett (L4) 1015881 - High Bar - None	3		41	1
1550	2015-11-05 18:39:22.521674-05	620	Griffin, Jacob (L4) 992840 - Floor - None	3		41	1
1551	2015-11-05 18:39:22.52264-05	621	Griffin, Jacob (L4) 992840 - Rings - None	3		41	1
1552	2015-11-05 18:39:22.52387-05	622	Griffin, Jacob (L4) 992840 - Pommel Horse - None	3		41	1
1553	2015-11-05 18:39:22.525612-05	623	Griffin, Jacob (L4) 992840 - Vault - None	3		41	1
1554	2015-11-05 18:39:22.526856-05	624	Griffin, Jacob (L4) 992840 - Parallel Bars - None	3		41	1
1555	2015-11-05 18:39:22.52814-05	625	Griffin, Jacob (L4) 992840 - High Bar - None	3		41	1
1556	2015-11-05 18:39:22.529346-05	932	Kuvshinoff, Aidan (L4) 992854 - Floor - None	3		41	1
1557	2015-11-05 18:39:22.530403-05	933	Kuvshinoff, Aidan (L4) 992854 - Rings - None	3		41	1
1558	2015-11-05 18:39:22.531391-05	934	Kuvshinoff, Aidan (L4) 992854 - Pommel Horse - None	3		41	1
1559	2015-11-05 18:39:22.532392-05	935	Kuvshinoff, Aidan (L4) 992854 - Vault - None	3		41	1
1560	2015-11-05 18:39:22.533346-05	936	Kuvshinoff, Aidan (L4) 992854 - Parallel Bars - None	3		41	1
1561	2015-11-05 18:39:22.534296-05	937	Kuvshinoff, Aidan (L4) 992854 - High Bar - None	3		41	1
1562	2015-11-05 18:39:22.53532-05	956	Lane, Cole (L4) 992856 - Floor - None	3		41	1
1563	2015-11-05 18:39:22.536355-05	957	Lane, Cole (L4) 992856 - Rings - None	3		41	1
1564	2015-11-05 18:39:22.537344-05	958	Lane, Cole (L4) 992856 - Pommel Horse - None	3		41	1
1565	2015-11-05 18:39:22.538263-05	959	Lane, Cole (L4) 992856 - Vault - None	3		41	1
1566	2015-11-05 18:39:22.539194-05	960	Lane, Cole (L4) 992856 - Parallel Bars - None	3		41	1
1567	2015-11-05 18:39:22.540148-05	961	Lane, Cole (L4) 992856 - High Bar - None	3		41	1
1568	2015-11-05 18:39:22.541096-05	1306	Pattison, Mathew (L4) 992860 - Floor - None	3		41	1
1569	2015-11-05 18:39:22.542178-05	1307	Pattison, Mathew (L4) 992860 - Rings - None	3		41	1
1570	2015-11-05 18:39:22.54361-05	1308	Pattison, Mathew (L4) 992860 - Pommel Horse - None	3		41	1
1571	2015-11-05 18:39:22.544832-05	1309	Pattison, Mathew (L4) 992860 - Vault - None	3		41	1
1572	2015-11-05 18:39:22.545935-05	1310	Pattison, Mathew (L4) 992860 - Parallel Bars - None	3		41	1
1573	2015-11-05 18:39:22.546936-05	1311	Pattison, Mathew (L4) 992860 - High Bar - None	3		41	1
1574	2015-11-05 18:39:22.547928-05	1528	Serres, Aiden (L4) 992862 - Floor - None	3		41	1
1575	2015-11-05 18:39:22.548904-05	1529	Serres, Aiden (L4) 992862 - Rings - None	3		41	1
1576	2015-11-05 18:39:22.549831-05	1530	Serres, Aiden (L4) 992862 - Pommel Horse - None	3		41	1
1577	2015-11-05 18:39:22.550757-05	1531	Serres, Aiden (L4) 992862 - Vault - None	3		41	1
1578	2015-11-05 18:39:22.551888-05	1532	Serres, Aiden (L4) 992862 - Parallel Bars - None	3		41	1
1579	2015-11-05 18:39:22.552961-05	1533	Serres, Aiden (L4) 992862 - High Bar - None	3		41	1
1580	2015-11-05 18:39:22.554002-05	2	Agbor-Obal, Jezrael (L4) 994395 - Floor - None	3		41	1
1581	2015-11-05 18:39:22.555051-05	3	Agbor-Obal, Jezrael (L4) 994395 - Rings - None	3		41	1
1582	2015-11-05 18:39:22.556133-05	4	Agbor-Obal, Jezrael (L4) 994395 - Pommel Horse - None	3		41	1
1583	2015-11-05 18:39:22.557119-05	5	Agbor-Obal, Jezrael (L4) 994395 - Vault - None	3		41	1
1584	2015-11-05 18:39:22.558304-05	6	Agbor-Obal, Jezrael (L4) 994395 - Parallel Bars - None	3		41	1
1585	2015-11-05 18:39:22.559533-05	7	Agbor-Obal, Jezrael (L4) 994395 - High Bar - None	3		41	1
1586	2015-11-05 18:39:22.56069-05	476	Fitch, Matthew (L4) 994396 - Floor - None	3		41	1
1587	2015-11-05 18:39:22.561725-05	477	Fitch, Matthew (L4) 994396 - Rings - None	3		41	1
1588	2015-11-05 18:39:22.562704-05	478	Fitch, Matthew (L4) 994396 - Pommel Horse - None	3		41	1
1589	2015-11-05 18:39:22.563686-05	479	Fitch, Matthew (L4) 994396 - Vault - None	3		41	1
1590	2015-11-05 18:39:22.56479-05	480	Fitch, Matthew (L4) 994396 - Parallel Bars - None	3		41	1
1591	2015-11-05 18:39:22.565868-05	481	Fitch, Matthew (L4) 994396 - High Bar - None	3		41	1
1592	2015-11-05 18:39:22.566932-05	782	Hood, Liam (L4) 994397 - Floor - None	3		41	1
1593	2015-11-05 18:39:22.567965-05	783	Hood, Liam (L4) 994397 - Rings - None	3		41	1
1594	2015-11-05 18:39:22.569003-05	784	Hood, Liam (L4) 994397 - Pommel Horse - None	3		41	1
1595	2015-11-05 18:39:22.569985-05	785	Hood, Liam (L4) 994397 - Vault - None	3		41	1
1596	2015-11-05 18:39:22.570928-05	786	Hood, Liam (L4) 994397 - Parallel Bars - None	3		41	1
1597	2015-11-05 18:39:22.57188-05	787	Hood, Liam (L4) 994397 - High Bar - None	3		41	1
1598	2015-11-05 18:39:22.572813-05	1462	FLAGGED! Rymut, Michael (L4) 994398 - Floor - None	3		41	1
1599	2015-11-05 18:39:22.573871-05	1463	FLAGGED! Rymut, Michael (L4) 994398 - Rings - None	3		41	1
1600	2015-11-05 18:39:22.574873-05	1464	FLAGGED! Rymut, Michael (L4) 994398 - Pommel Horse - None	3		41	1
1601	2015-11-05 18:39:22.575887-05	1465	FLAGGED! Rymut, Michael (L4) 994398 - Vault - None	3		41	1
1602	2015-11-05 18:39:22.576917-05	1466	FLAGGED! Rymut, Michael (L4) 994398 - Parallel Bars - None	3		41	1
1603	2015-11-05 18:39:22.577881-05	1467	FLAGGED! Rymut, Michael (L4) 994398 - High Bar - None	3		41	1
1604	2015-11-05 18:39:22.578824-05	1696	Trump, Cooper (L4) 994400 - Floor - None	3		41	1
1605	2015-11-05 18:39:22.579774-05	1697	Trump, Cooper (L4) 994400 - Rings - None	3		41	1
1606	2015-11-05 18:39:22.580717-05	1698	Trump, Cooper (L4) 994400 - Pommel Horse - None	3		41	1
1607	2015-11-05 18:39:22.581568-05	1699	Trump, Cooper (L4) 994400 - Vault - None	3		41	1
1608	2015-11-05 18:39:22.582494-05	1700	Trump, Cooper (L4) 994400 - Parallel Bars - None	3		41	1
1609	2015-11-05 18:39:22.583422-05	1701	Trump, Cooper (L4) 994400 - High Bar - None	3		41	1
1610	2015-11-05 18:39:22.584317-05	458	Ficke, Blake (L4) 1010428 - Floor - None	3		41	1
1611	2015-11-05 18:39:22.585232-05	459	Ficke, Blake (L4) 1010428 - Rings - None	3		41	1
1612	2015-11-05 18:39:22.586124-05	460	Ficke, Blake (L4) 1010428 - Pommel Horse - None	3		41	1
1613	2015-11-05 18:39:22.587015-05	461	Ficke, Blake (L4) 1010428 - Vault - None	3		41	1
1614	2015-11-05 18:39:22.587924-05	462	Ficke, Blake (L4) 1010428 - Parallel Bars - None	3		41	1
1615	2015-11-05 18:39:22.588845-05	463	Ficke, Blake (L4) 1010428 - High Bar - None	3		41	1
1616	2015-11-05 18:39:22.589774-05	464	FLAGGED! Ficke, Brooks (L4) 1010429 - Floor - None	3		41	1
1617	2015-11-05 18:39:22.590761-05	465	FLAGGED! Ficke, Brooks (L4) 1010429 - Rings - None	3		41	1
1618	2015-11-05 18:39:22.591829-05	466	FLAGGED! Ficke, Brooks (L4) 1010429 - Pommel Horse - None	3		41	1
1619	2015-11-05 18:39:22.592788-05	467	FLAGGED! Ficke, Brooks (L4) 1010429 - Vault - None	3		41	1
1620	2015-11-05 18:39:22.593743-05	468	FLAGGED! Ficke, Brooks (L4) 1010429 - Parallel Bars - None	3		41	1
1621	2015-11-05 18:39:22.594712-05	469	FLAGGED! Ficke, Brooks (L4) 1010429 - High Bar - None	3		41	1
1622	2015-11-05 18:39:22.59568-05	1804	Wysocki, Braden (L4) 994401 - Floor - None	3		41	1
1623	2015-11-05 18:39:22.596603-05	1805	Wysocki, Braden (L4) 994401 - Rings - None	3		41	1
1624	2015-11-05 18:39:22.597641-05	1806	Wysocki, Braden (L4) 994401 - Pommel Horse - None	3		41	1
1625	2015-11-05 18:39:22.598654-05	1807	Wysocki, Braden (L4) 994401 - Vault - None	3		41	1
1626	2015-11-05 18:39:22.599593-05	1808	Wysocki, Braden (L4) 994401 - Parallel Bars - None	3		41	1
1627	2015-11-05 18:39:22.600519-05	1809	Wysocki, Braden (L4) 994401 - High Bar - None	3		41	1
1628	2015-11-05 18:39:22.601463-05	182	FLAGGED! Burges, Caden (L5) 648853 - Floor - None	3		41	1
1629	2015-11-05 18:39:22.602401-05	183	FLAGGED! Burges, Caden (L5) 648853 - Rings - None	3		41	1
1630	2015-11-05 18:39:22.603304-05	184	FLAGGED! Burges, Caden (L5) 648853 - Pommel Horse - None	3		41	1
1631	2015-11-05 18:39:22.604313-05	185	FLAGGED! Burges, Caden (L5) 648853 - Vault - None	3		41	1
1632	2015-11-05 18:39:22.605247-05	186	FLAGGED! Burges, Caden (L5) 648853 - Parallel Bars - None	3		41	1
1633	2015-11-05 18:39:22.60622-05	187	FLAGGED! Burges, Caden (L5) 648853 - High Bar - None	3		41	1
1634	2015-11-05 18:39:22.60714-05	170	FLAGGED! Brit, Ficke (L5) 648849 - Floor - None	3		41	1
1635	2015-11-05 18:39:22.608078-05	171	FLAGGED! Brit, Ficke (L5) 648849 - Rings - None	3		41	1
1636	2015-11-05 18:39:22.60901-05	172	FLAGGED! Brit, Ficke (L5) 648849 - Pommel Horse - None	3		41	1
1637	2015-11-05 18:39:22.609972-05	173	FLAGGED! Brit, Ficke (L5) 648849 - Vault - None	3		41	1
1638	2015-11-05 18:39:22.610878-05	174	FLAGGED! Brit, Ficke (L5) 648849 - Parallel Bars - None	3		41	1
1639	2015-11-05 18:39:22.611775-05	175	FLAGGED! Brit, Ficke (L5) 648849 - High Bar - None	3		41	1
1640	2015-11-05 18:39:22.612689-05	986	Letvin, Benjamin (L5) 975083 - Floor - None	3		41	1
1641	2015-11-05 18:39:22.613589-05	987	Letvin, Benjamin (L5) 975083 - Rings - None	3		41	1
1642	2015-11-05 18:39:22.614549-05	988	Letvin, Benjamin (L5) 975083 - Pommel Horse - None	3		41	1
1643	2015-11-05 18:39:22.615472-05	989	Letvin, Benjamin (L5) 975083 - Vault - None	3		41	1
1644	2015-11-05 18:39:22.616397-05	990	Letvin, Benjamin (L5) 975083 - Parallel Bars - None	3		41	1
1645	2015-11-05 18:39:22.617315-05	991	Letvin, Benjamin (L5) 975083 - High Bar - None	3		41	1
1646	2015-11-05 18:39:22.618245-05	1264	FLAGGED! Nile, Samuel (L5) 952796 - Floor - None	3		41	1
1647	2015-11-05 18:39:22.619165-05	1265	FLAGGED! Nile, Samuel (L5) 952796 - Rings - None	3		41	1
1648	2015-11-05 18:39:22.620138-05	1266	FLAGGED! Nile, Samuel (L5) 952796 - Pommel Horse - None	3		41	1
1649	2015-11-05 18:39:22.621045-05	1267	FLAGGED! Nile, Samuel (L5) 952796 - Vault - None	3		41	1
1650	2015-11-05 18:39:22.62198-05	1268	FLAGGED! Nile, Samuel (L5) 952796 - Parallel Bars - None	3		41	1
1651	2015-11-05 18:39:22.622876-05	1269	FLAGGED! Nile, Samuel (L5) 952796 - High Bar - None	3		41	1
1652	2015-11-05 18:39:22.623815-05	1648	Suravenkat, Vivek (L5) 994394 - Floor - None	3		41	1
1653	2015-11-05 18:39:22.624735-05	1649	Suravenkat, Vivek (L5) 994394 - Rings - None	3		41	1
1654	2015-11-05 18:39:22.625796-05	1650	Suravenkat, Vivek (L5) 994394 - Pommel Horse - None	3		41	1
1655	2015-11-05 18:39:22.626768-05	1651	Suravenkat, Vivek (L5) 994394 - Vault - None	3		41	1
1656	2015-11-05 18:39:22.627714-05	1652	Suravenkat, Vivek (L5) 994394 - Parallel Bars - None	3		41	1
1657	2015-11-05 18:39:22.628654-05	1653	Suravenkat, Vivek (L5) 994394 - High Bar - None	3		41	1
1658	2015-11-05 18:39:22.629579-05	752	Hibbert, Andrew (L6) 619405 - Floor - None	3		41	1
1659	2015-11-05 18:39:22.630495-05	753	Hibbert, Andrew (L6) 619405 - Rings - None	3		41	1
1660	2015-11-05 18:39:22.631389-05	754	Hibbert, Andrew (L6) 619405 - Pommel Horse - None	3		41	1
1661	2015-11-05 18:39:22.63228-05	755	Hibbert, Andrew (L6) 619405 - Vault - None	3		41	1
1662	2015-11-05 18:39:22.633187-05	756	Hibbert, Andrew (L6) 619405 - Parallel Bars - None	3		41	1
1663	2015-11-05 18:39:22.634118-05	757	Hibbert, Andrew (L6) 619405 - High Bar - None	3		41	1
1664	2015-11-05 18:39:22.635065-05	1510	Schrott, Tyler (L6) 619408 - Floor - None	3		41	1
1665	2015-11-05 18:39:22.635961-05	1511	Schrott, Tyler (L6) 619408 - Rings - None	3		41	1
1666	2015-11-05 18:39:22.636994-05	1512	Schrott, Tyler (L6) 619408 - Pommel Horse - None	3		41	1
1667	2015-11-05 18:39:22.637987-05	1513	Schrott, Tyler (L6) 619408 - Vault - None	3		41	1
1668	2015-11-05 18:39:22.638926-05	1514	Schrott, Tyler (L6) 619408 - Parallel Bars - None	3		41	1
1669	2015-11-05 18:39:22.639872-05	1515	Schrott, Tyler (L6) 619408 - High Bar - None	3		41	1
1670	2015-11-05 18:39:22.640795-05	1504	Schrott, Connor (L6) 619410 - Floor - None	3		41	1
1671	2015-11-05 18:39:22.641731-05	1505	Schrott, Connor (L6) 619410 - Rings - None	3		41	1
1672	2015-11-05 18:39:22.642758-05	1506	Schrott, Connor (L6) 619410 - Pommel Horse - None	3		41	1
1673	2015-11-05 18:39:22.643741-05	1507	Schrott, Connor (L6) 619410 - Vault - None	3		41	1
1674	2015-11-05 18:39:22.644675-05	1508	Schrott, Connor (L6) 619410 - Parallel Bars - None	3		41	1
1675	2015-11-05 18:39:22.64563-05	1509	Schrott, Connor (L6) 619410 - High Bar - None	3		41	1
1676	2015-11-05 18:39:22.646585-05	32	Arensdorf, Zachary (L7) 506141 - Floor - None	3		41	1
1677	2015-11-05 18:39:22.64755-05	33	Arensdorf, Zachary (L7) 506141 - Rings - None	3		41	1
1678	2015-11-05 18:39:22.648511-05	34	Arensdorf, Zachary (L7) 506141 - Pommel Horse - None	3		41	1
1679	2015-11-05 18:39:22.649459-05	35	Arensdorf, Zachary (L7) 506141 - Vault - None	3		41	1
1680	2015-11-05 18:39:22.650387-05	36	Arensdorf, Zachary (L7) 506141 - Parallel Bars - None	3		41	1
1681	2015-11-05 18:39:22.651282-05	37	Arensdorf, Zachary (L7) 506141 - High Bar - None	3		41	1
1682	2015-11-05 18:39:22.652179-05	188	Burgess, Jackson (L8) 506149 - Floor - None	3		41	1
1683	2015-11-05 18:39:22.653129-05	189	Burgess, Jackson (L8) 506149 - Rings - None	3		41	1
1684	2015-11-05 18:39:22.654034-05	190	Burgess, Jackson (L8) 506149 - Pommel Horse - None	3		41	1
1685	2015-11-05 18:39:22.654935-05	191	Burgess, Jackson (L8) 506149 - Vault - None	3		41	1
1686	2015-11-05 18:39:22.655831-05	192	Burgess, Jackson (L8) 506149 - Parallel Bars - None	3		41	1
1687	2015-11-05 18:39:22.656723-05	193	Burgess, Jackson (L8) 506149 - High Bar - None	3		41	1
1688	2015-11-05 18:39:22.657613-05	302	Currie, Benjamin (L8) 506150 - Floor - None	3		41	1
1689	2015-11-05 18:39:22.658813-05	303	Currie, Benjamin (L8) 506150 - Rings - None	3		41	1
1690	2015-11-05 18:39:22.660006-05	304	Currie, Benjamin (L8) 506150 - Pommel Horse - None	3		41	1
1691	2015-11-05 18:39:22.661-05	305	Currie, Benjamin (L8) 506150 - Vault - None	3		41	1
1692	2015-11-05 18:39:22.661985-05	306	Currie, Benjamin (L8) 506150 - Parallel Bars - None	3		41	1
1693	2015-11-05 18:39:22.662969-05	307	Currie, Benjamin (L8) 506150 - High Bar - None	3		41	1
1694	2015-11-05 18:39:22.664024-05	332	Davis, Dima (L8) 463970 - Floor - None	3		41	1
1695	2015-11-05 18:39:22.664989-05	333	Davis, Dima (L8) 463970 - Rings - None	3		41	1
1696	2015-11-05 18:39:22.66594-05	334	Davis, Dima (L8) 463970 - Pommel Horse - None	3		41	1
1697	2015-11-05 18:39:22.666877-05	335	Davis, Dima (L8) 463970 - Vault - None	3		41	1
1698	2015-11-05 18:39:22.667814-05	336	Davis, Dima (L8) 463970 - Parallel Bars - None	3		41	1
1699	2015-11-05 18:39:22.668775-05	337	Davis, Dima (L8) 463970 - High Bar - None	3		41	1
1700	2015-11-05 18:39:22.669709-05	1167	Mills, Kevin (L8) 554553 - Floor - None	3		41	1
1701	2015-11-05 18:39:22.670624-05	1168	Mills, Kevin (L8) 554553 - Rings - None	3		41	1
1702	2015-11-05 18:39:22.67154-05	1169	Mills, Kevin (L8) 554553 - Pommel Horse - None	3		41	1
1703	2015-11-05 18:39:22.672533-05	1170	Mills, Kevin (L8) 554553 - Vault - None	3		41	1
1704	2015-11-05 18:39:22.673453-05	1171	Mills, Kevin (L8) 554553 - Parallel Bars - None	3		41	1
1705	2015-11-05 18:39:22.674346-05	1172	Mills, Kevin (L8) 554553 - High Bar - None	3		41	1
1706	2015-11-05 18:39:22.675285-05	194	Callas, Jimmy (L10) 183567 - Floor - None	3		41	1
1707	2015-11-05 18:39:22.676258-05	195	Callas, Jimmy (L10) 183567 - Rings - None	3		41	1
1708	2015-11-05 18:39:22.677201-05	196	Callas, Jimmy (L10) 183567 - Pommel Horse - None	3		41	1
1709	2015-11-05 18:39:22.678139-05	197	Callas, Jimmy (L10) 183567 - Vault - None	3		41	1
1710	2015-11-05 18:39:22.679052-05	198	Callas, Jimmy (L10) 183567 - Parallel Bars - None	3		41	1
1711	2015-11-05 18:39:22.679943-05	199	Callas, Jimmy (L10) 183567 - High Bar - None	3		41	1
1712	2015-11-05 18:39:22.680881-05	1324	Penn, Samuel (L10) 230564 - Floor - None	3		41	1
1713	2015-11-05 18:39:22.681775-05	1325	Penn, Samuel (L10) 230564 - Rings - None	3		41	1
1714	2015-11-05 18:39:22.682697-05	1326	Penn, Samuel (L10) 230564 - Pommel Horse - None	3		41	1
1715	2015-11-05 18:39:22.68359-05	1327	Penn, Samuel (L10) 230564 - Vault - None	3		41	1
1716	2015-11-05 18:39:22.684511-05	1328	Penn, Samuel (L10) 230564 - Parallel Bars - None	3		41	1
1717	2015-11-05 18:39:22.685428-05	1329	Penn, Samuel (L10) 230564 - High Bar - None	3		41	1
1718	2015-11-05 18:39:22.686464-05	1714	Valiente, Marcus (L10) 255148 - Floor - None	3		41	1
1719	2015-11-05 18:39:22.687424-05	1715	Valiente, Marcus (L10) 255148 - Rings - None	3		41	1
1720	2015-11-05 18:39:22.688365-05	1716	Valiente, Marcus (L10) 255148 - Pommel Horse - None	3		41	1
1721	2015-11-05 18:39:22.689287-05	1717	Valiente, Marcus (L10) 255148 - Vault - None	3		41	1
1722	2015-11-05 18:39:22.690616-05	1718	Valiente, Marcus (L10) 255148 - Parallel Bars - None	3		41	1
1723	2015-11-05 18:39:22.691839-05	1719	Valiente, Marcus (L10) 255148 - High Bar - None	3		41	1
1724	2015-11-05 18:39:22.693236-05	488	Frempong, Nathaniel (L5) 951023 - Floor - None	3		41	1
1725	2015-11-05 18:39:22.694523-05	489	Frempong, Nathaniel (L5) 951023 - Rings - None	3		41	1
1726	2015-11-05 18:39:22.695562-05	490	Frempong, Nathaniel (L5) 951023 - Pommel Horse - None	3		41	1
1727	2015-11-05 18:39:22.696565-05	491	Frempong, Nathaniel (L5) 951023 - Vault - None	3		41	1
1728	2015-11-05 18:39:22.697574-05	492	Frempong, Nathaniel (L5) 951023 - Parallel Bars - None	3		41	1
1729	2015-11-05 18:39:22.69854-05	493	Frempong, Nathaniel (L5) 951023 - High Bar - None	3		41	1
1730	2015-11-05 18:39:22.699501-05	1100	FLAGGED! Matti, Judah (L5) 951026 - Floor - None	3		41	1
1731	2015-11-05 18:39:22.700453-05	1101	FLAGGED! Matti, Judah (L5) 951026 - Rings - None	3		41	1
1732	2015-11-05 18:39:22.701379-05	1102	FLAGGED! Matti, Judah (L5) 951026 - Pommel Horse - None	3		41	1
1733	2015-11-05 18:39:22.702363-05	1103	FLAGGED! Matti, Judah (L5) 951026 - Vault - None	3		41	1
1734	2015-11-05 18:39:22.703359-05	1104	FLAGGED! Matti, Judah (L5) 951026 - Parallel Bars - None	3		41	1
1735	2015-11-05 18:39:22.704313-05	1105	FLAGGED! Matti, Judah (L5) 951026 - High Bar - None	3		41	1
1736	2015-11-05 18:39:22.705314-05	1594	FLAGGED! Slaton, Robbie (L5) 951022 - Floor - None	3		41	1
1737	2015-11-05 18:39:22.706349-05	1595	FLAGGED! Slaton, Robbie (L5) 951022 - Rings - None	3		41	1
1738	2015-11-05 18:39:22.707393-05	1596	FLAGGED! Slaton, Robbie (L5) 951022 - Pommel Horse - None	3		41	1
1739	2015-11-05 18:39:22.708436-05	1597	FLAGGED! Slaton, Robbie (L5) 951022 - Vault - None	3		41	1
1740	2015-11-05 18:39:22.709402-05	1598	FLAGGED! Slaton, Robbie (L5) 951022 - Parallel Bars - None	3		41	1
1741	2015-11-05 18:39:22.710391-05	1599	FLAGGED! Slaton, Robbie (L5) 951022 - High Bar - None	3		41	1
1742	2015-11-05 18:39:22.711329-05	1708	Valencia, Aaron (L5) 951024 - Floor - None	3		41	1
1743	2015-11-05 18:39:22.712314-05	1709	Valencia, Aaron (L5) 951024 - Rings - None	3		41	1
1744	2015-11-05 18:39:22.713298-05	1710	Valencia, Aaron (L5) 951024 - Pommel Horse - None	3		41	1
1745	2015-11-05 18:39:22.714252-05	1711	Valencia, Aaron (L5) 951024 - Vault - None	3		41	1
1746	2015-11-05 18:39:22.715199-05	1712	Valencia, Aaron (L5) 951024 - Parallel Bars - None	3		41	1
1747	2015-11-05 18:39:22.716156-05	1713	Valencia, Aaron (L5) 951024 - High Bar - None	3		41	1
1748	2015-11-05 18:39:22.717085-05	1191	FLAGGED! Moroney, David (L5) 632105 - Floor - None	3		41	1
1749	2015-11-05 18:39:22.718076-05	1192	FLAGGED! Moroney, David (L5) 632105 - Rings - None	3		41	1
1750	2015-11-05 18:39:22.719067-05	1193	FLAGGED! Moroney, David (L5) 632105 - Pommel Horse - None	3		41	1
1751	2015-11-05 18:39:22.720036-05	1194	FLAGGED! Moroney, David (L5) 632105 - Vault - None	3		41	1
1752	2015-11-05 18:39:22.720972-05	1195	FLAGGED! Moroney, David (L5) 632105 - Parallel Bars - None	3		41	1
1753	2015-11-05 18:39:22.721922-05	1196	FLAGGED! Moroney, David (L5) 632105 - High Bar - None	3		41	1
1754	2015-11-05 18:39:22.722869-05	1534	Shedrick, Xavier (L6) 632109 - Floor - None	3		41	1
1755	2015-11-05 18:39:22.723789-05	1535	Shedrick, Xavier (L6) 632109 - Rings - None	3		41	1
1756	2015-11-05 18:39:22.724813-05	1536	Shedrick, Xavier (L6) 632109 - Pommel Horse - None	3		41	1
1757	2015-11-05 18:39:22.725814-05	1537	Shedrick, Xavier (L6) 632109 - Vault - None	3		41	1
1758	2015-11-05 18:39:22.726749-05	1538	Shedrick, Xavier (L6) 632109 - Parallel Bars - None	3		41	1
1759	2015-11-05 18:39:22.727761-05	1539	Shedrick, Xavier (L6) 632109 - High Bar - None	3		41	1
1760	2015-11-05 18:39:22.728665-05	1678	Thompson, Ellis (L6) 632111 - Floor - None	3		41	1
1761	2015-11-05 18:39:22.729595-05	1679	Thompson, Ellis (L6) 632111 - Rings - None	3		41	1
1762	2015-11-05 18:39:22.730515-05	1680	Thompson, Ellis (L6) 632111 - Pommel Horse - None	3		41	1
1763	2015-11-05 18:39:22.73143-05	1681	Thompson, Ellis (L6) 632111 - Vault - None	3		41	1
1764	2015-11-05 18:39:22.732366-05	1682	Thompson, Ellis (L6) 632111 - Parallel Bars - None	3		41	1
1765	2015-11-05 18:39:22.73336-05	1683	Thompson, Ellis (L6) 632111 - High Bar - None	3		41	1
1766	2015-11-05 18:39:22.734369-05	920	Kravet, Ethan (L10) 258301 - Floor - None	3		41	1
1767	2015-11-05 18:39:22.735339-05	921	Kravet, Ethan (L10) 258301 - Rings - None	3		41	1
1768	2015-11-05 18:39:22.736285-05	922	Kravet, Ethan (L10) 258301 - Pommel Horse - None	3		41	1
1769	2015-11-05 18:39:22.737257-05	923	Kravet, Ethan (L10) 258301 - Vault - None	3		41	1
1770	2015-11-05 18:39:22.738186-05	924	Kravet, Ethan (L10) 258301 - Parallel Bars - None	3		41	1
1771	2015-11-05 18:39:22.739105-05	925	Kravet, Ethan (L10) 258301 - High Bar - None	3		41	1
1772	2015-11-05 18:39:22.740046-05	1004	Lewis, Stephen (L10) 298421 - Floor - None	3		41	1
1773	2015-11-05 18:39:22.740927-05	1005	Lewis, Stephen (L10) 298421 - Rings - None	3		41	1
1774	2015-11-05 18:39:22.741861-05	1006	Lewis, Stephen (L10) 298421 - Pommel Horse - None	3		41	1
1775	2015-11-05 18:39:22.742797-05	1007	Lewis, Stephen (L10) 298421 - Vault - None	3		41	1
1776	2015-11-05 18:39:22.743754-05	1008	Lewis, Stephen (L10) 298421 - Parallel Bars - None	3		41	1
1777	2015-11-05 18:39:22.74467-05	1009	Lewis, Stephen (L10) 298421 - High Bar - None	3		41	1
1778	2015-11-05 18:39:22.745592-05	1088	Massey, Avery (L10) 562189 - Floor - None	3		41	1
1779	2015-11-05 18:39:22.746521-05	1089	Massey, Avery (L10) 562189 - Rings - None	3		41	1
1780	2015-11-05 18:39:22.747441-05	1090	Massey, Avery (L10) 562189 - Pommel Horse - None	3		41	1
1781	2015-11-05 18:39:22.748686-05	1091	Massey, Avery (L10) 562189 - Vault - None	3		41	1
1782	2015-11-05 18:39:22.749944-05	1092	Massey, Avery (L10) 562189 - Parallel Bars - None	3		41	1
1783	2015-11-05 18:39:22.750903-05	1093	Massey, Avery (L10) 562189 - High Bar - None	3		41	1
1784	2015-11-05 18:39:22.751896-05	86	Barrett, Dylan (L4) 1013307 - Floor - None	3		41	1
1785	2015-11-05 18:39:22.752844-05	87	Barrett, Dylan (L4) 1013307 - Rings - None	3		41	1
1786	2015-11-05 18:39:22.75379-05	88	Barrett, Dylan (L4) 1013307 - Pommel Horse - None	3		41	1
1787	2015-11-05 18:39:22.754737-05	89	Barrett, Dylan (L4) 1013307 - Vault - None	3		41	1
1788	2015-11-05 18:39:22.755685-05	90	Barrett, Dylan (L4) 1013307 - Parallel Bars - None	3		41	1
1789	2015-11-05 18:39:22.756619-05	91	Barrett, Dylan (L4) 1013307 - High Bar - None	3		41	1
1790	2015-11-05 18:39:22.757554-05	500	Gallo, Ashton (L4) 1013311 - Floor - None	3		41	1
1791	2015-11-05 18:39:22.758486-05	501	Gallo, Ashton (L4) 1013311 - Rings - None	3		41	1
1792	2015-11-05 18:39:22.759452-05	502	Gallo, Ashton (L4) 1013311 - Pommel Horse - None	3		41	1
1793	2015-11-05 18:39:22.76044-05	503	Gallo, Ashton (L4) 1013311 - Vault - None	3		41	1
1794	2015-11-05 18:39:22.761416-05	504	Gallo, Ashton (L4) 1013311 - Parallel Bars - None	3		41	1
1795	2015-11-05 18:39:22.762455-05	505	Gallo, Ashton (L4) 1013311 - High Bar - None	3		41	1
1796	2015-11-05 18:39:22.763395-05	608	FLAGGED! Greer, Marshall (L4) 960819 - Floor - None	3		41	1
1797	2015-11-05 18:39:22.764348-05	609	FLAGGED! Greer, Marshall (L4) 960819 - Rings - None	3		41	1
1798	2015-11-05 18:39:22.765453-05	610	FLAGGED! Greer, Marshall (L4) 960819 - Pommel Horse - None	3		41	1
1799	2015-11-05 18:39:22.766385-05	611	FLAGGED! Greer, Marshall (L4) 960819 - Vault - None	3		41	1
1800	2015-11-05 18:39:22.76732-05	612	FLAGGED! Greer, Marshall (L4) 960819 - Parallel Bars - None	3		41	1
1801	2015-11-05 18:39:22.768227-05	613	FLAGGED! Greer, Marshall (L4) 960819 - High Bar - None	3		41	1
1802	2015-11-05 18:39:22.769175-05	698	FLAGGED! Hastings, Connor (L4) 1018591 - Floor - None	3		41	1
1803	2015-11-05 18:39:22.77008-05	699	FLAGGED! Hastings, Connor (L4) 1018591 - Rings - None	3		41	1
1804	2015-11-05 18:39:22.770978-05	700	FLAGGED! Hastings, Connor (L4) 1018591 - Pommel Horse - None	3		41	1
1805	2015-11-05 18:39:22.771896-05	701	FLAGGED! Hastings, Connor (L4) 1018591 - Vault - None	3		41	1
1806	2015-11-05 18:39:22.772794-05	702	FLAGGED! Hastings, Connor (L4) 1018591 - Parallel Bars - None	3		41	1
1807	2015-11-05 18:39:22.773782-05	703	FLAGGED! Hastings, Connor (L4) 1018591 - High Bar - None	3		41	1
1808	2015-11-05 18:39:22.774783-05	794	Horrigan, Sean (L4) 960816 - Floor - None	3		41	1
1809	2015-11-05 18:39:22.775699-05	795	Horrigan, Sean (L4) 960816 - Rings - None	3		41	1
1810	2015-11-05 18:39:22.776609-05	796	Horrigan, Sean (L4) 960816 - Pommel Horse - None	3		41	1
1811	2015-11-05 18:39:22.777614-05	797	Horrigan, Sean (L4) 960816 - Vault - None	3		41	1
1812	2015-11-05 18:39:22.778533-05	798	Horrigan, Sean (L4) 960816 - Parallel Bars - None	3		41	1
1813	2015-11-05 18:39:22.779545-05	799	Horrigan, Sean (L4) 960816 - High Bar - None	3		41	1
1814	2015-11-05 18:39:22.78045-05	1076	FLAGGED! Marquez, Jullian (L4) 1013460 - Floor - None	3		41	1
1815	2015-11-05 18:39:22.781425-05	1077	FLAGGED! Marquez, Jullian (L4) 1013460 - Rings - None	3		41	1
1816	2015-11-05 18:39:22.782337-05	1078	FLAGGED! Marquez, Jullian (L4) 1013460 - Pommel Horse - None	3		41	1
1817	2015-11-05 18:39:22.783378-05	1079	FLAGGED! Marquez, Jullian (L4) 1013460 - Vault - None	3		41	1
1818	2015-11-05 18:39:22.784312-05	1080	FLAGGED! Marquez, Jullian (L4) 1013460 - Parallel Bars - None	3		41	1
1819	2015-11-05 18:39:22.785205-05	1081	FLAGGED! Marquez, Jullian (L4) 1013460 - High Bar - None	3		41	1
1820	2015-11-05 18:39:22.786206-05	1732	Vey, James (L4) 1013306 - Floor - None	3		41	1
1821	2015-11-05 18:39:22.787149-05	1733	Vey, James (L4) 1013306 - Rings - None	3		41	1
1822	2015-11-05 18:39:22.788097-05	1734	Vey, James (L4) 1013306 - Pommel Horse - None	3		41	1
1823	2015-11-05 18:39:22.789064-05	1735	Vey, James (L4) 1013306 - Vault - None	3		41	1
1824	2015-11-05 18:39:22.789997-05	1736	Vey, James (L4) 1013306 - Parallel Bars - None	3		41	1
1825	2015-11-05 18:39:22.790916-05	1737	Vey, James (L4) 1013306 - High Bar - None	3		41	1
1826	2015-11-05 18:39:22.792075-05	1792	Wilmot, Gregory (L4) 1013314 - Floor - None	3		41	1
1827	2015-11-05 18:39:22.793046-05	1793	Wilmot, Gregory (L4) 1013314 - Rings - None	3		41	1
1828	2015-11-05 18:39:22.794108-05	1794	Wilmot, Gregory (L4) 1013314 - Pommel Horse - None	3		41	1
1829	2015-11-05 18:39:22.795113-05	1795	Wilmot, Gregory (L4) 1013314 - Vault - None	3		41	1
1830	2015-11-05 18:39:22.79607-05	1796	Wilmot, Gregory (L4) 1013314 - Parallel Bars - None	3		41	1
1831	2015-11-05 18:39:22.797091-05	1797	Wilmot, Gregory (L4) 1013314 - High Bar - None	3		41	1
1832	2015-11-05 18:39:22.798104-05	98	Becker, Anderson (L5) 635665 - Floor - None	3		41	1
1833	2015-11-05 18:39:22.799051-05	99	Becker, Anderson (L5) 635665 - Rings - None	3		41	1
1834	2015-11-05 18:39:22.799985-05	100	Becker, Anderson (L5) 635665 - Pommel Horse - None	3		41	1
1835	2015-11-05 18:39:22.800928-05	101	Becker, Anderson (L5) 635665 - Vault - None	3		41	1
1836	2015-11-05 18:39:22.801846-05	102	Becker, Anderson (L5) 635665 - Parallel Bars - None	3		41	1
1837	2015-11-05 18:39:22.802744-05	103	Becker, Anderson (L5) 635665 - High Bar - None	3		41	1
1838	2015-11-05 18:39:22.80369-05	1010	Liang, Will (L5) 635674 - Floor - None	3		41	1
1839	2015-11-05 18:39:22.804628-05	1011	Liang, Will (L5) 635674 - Rings - None	3		41	1
1840	2015-11-05 18:39:22.80553-05	1012	Liang, Will (L5) 635674 - Pommel Horse - None	3		41	1
1841	2015-11-05 18:39:22.806485-05	1013	Liang, Will (L5) 635674 - Vault - None	3		41	1
1842	2015-11-05 18:39:22.807411-05	1014	Liang, Will (L5) 635674 - Parallel Bars - None	3		41	1
1843	2015-11-05 18:39:22.808275-05	1015	Liang, Will (L5) 635674 - High Bar - None	3		41	1
1844	2015-11-05 18:39:22.809159-05	1228	Napolitano, Enzo (L5) 1013320 - Floor - None	3		41	1
1845	2015-11-05 18:39:22.810066-05	1229	Napolitano, Enzo (L5) 1013320 - Rings - None	3		41	1
1846	2015-11-05 18:39:22.811008-05	1230	Napolitano, Enzo (L5) 1013320 - Pommel Horse - None	3		41	1
1847	2015-11-05 18:39:22.811922-05	1231	Napolitano, Enzo (L5) 1013320 - Vault - None	3		41	1
1848	2015-11-05 18:39:22.812865-05	1232	Napolitano, Enzo (L5) 1013320 - Parallel Bars - None	3		41	1
1849	2015-11-05 18:39:22.813816-05	1233	Napolitano, Enzo (L5) 1013320 - High Bar - None	3		41	1
1850	2015-11-05 18:39:22.814727-05	1234	Nesspor, Ryan (L5) 575912 - Floor - None	3		41	1
1851	2015-11-05 18:39:22.815637-05	1235	Nesspor, Ryan (L5) 575912 - Rings - None	3		41	1
1852	2015-11-05 18:39:22.816543-05	1236	Nesspor, Ryan (L5) 575912 - Pommel Horse - None	3		41	1
1853	2015-11-05 18:39:22.817475-05	1237	Nesspor, Ryan (L5) 575912 - Vault - None	3		41	1
1854	2015-11-05 18:39:22.818403-05	1238	Nesspor, Ryan (L5) 575912 - Parallel Bars - None	3		41	1
1855	2015-11-05 18:39:22.819295-05	1239	Nesspor, Ryan (L5) 575912 - High Bar - None	3		41	1
1856	2015-11-05 18:39:22.820183-05	1564	Silao, Zachary (L5) 960821 - Floor - None	3		41	1
1857	2015-11-05 18:39:22.821076-05	1565	Silao, Zachary (L5) 960821 - Rings - None	3		41	1
1858	2015-11-05 18:39:22.821965-05	1566	Silao, Zachary (L5) 960821 - Pommel Horse - None	3		41	1
1859	2015-11-05 18:39:22.822851-05	1567	Silao, Zachary (L5) 960821 - Vault - None	3		41	1
1860	2015-11-05 18:39:22.823776-05	1568	Silao, Zachary (L5) 960821 - Parallel Bars - None	3		41	1
1861	2015-11-05 18:39:22.824662-05	1569	Silao, Zachary (L5) 960821 - High Bar - None	3		41	1
1862	2015-11-05 18:39:22.825588-05	134	Black, Oliver (L6) 635671 - Floor - None	3		41	1
1863	2015-11-05 18:39:22.826589-05	135	Black, Oliver (L6) 635671 - Rings - None	3		41	1
1864	2015-11-05 18:39:22.827623-05	136	Black, Oliver (L6) 635671 - Pommel Horse - None	3		41	1
1865	2015-11-05 18:39:22.828619-05	137	Black, Oliver (L6) 635671 - Vault - None	3		41	1
1866	2015-11-05 18:39:22.829577-05	138	Black, Oliver (L6) 635671 - Parallel Bars - None	3		41	1
1867	2015-11-05 18:39:22.830512-05	139	Black, Oliver (L6) 635671 - High Bar - None	3		41	1
1868	2015-11-05 18:39:22.831468-05	818	Jackson, Ryan (L6) 575845 - Floor - None	3		41	1
1869	2015-11-05 18:39:22.832395-05	819	Jackson, Ryan (L6) 575845 - Rings - None	3		41	1
1870	2015-11-05 18:39:22.833317-05	820	Jackson, Ryan (L6) 575845 - Pommel Horse - None	3		41	1
1871	2015-11-05 18:39:22.834272-05	821	Jackson, Ryan (L6) 575845 - Vault - None	3		41	1
1872	2015-11-05 18:39:22.835176-05	822	Jackson, Ryan (L6) 575845 - Parallel Bars - None	3		41	1
1873	2015-11-05 18:39:22.836152-05	823	Jackson, Ryan (L6) 575845 - High Bar - None	3		41	1
1874	2015-11-05 18:39:22.837095-05	1414	Rosenberg, Benjamin (L6) 461900 - Floor - None	3		41	1
1875	2015-11-05 18:39:22.838046-05	1415	Rosenberg, Benjamin (L6) 461900 - Rings - None	3		41	1
1876	2015-11-05 18:39:22.839055-05	1416	Rosenberg, Benjamin (L6) 461900 - Pommel Horse - None	3		41	1
1877	2015-11-05 18:39:22.83997-05	1417	Rosenberg, Benjamin (L6) 461900 - Vault - None	3		41	1
1878	2015-11-05 18:39:22.8409-05	1418	Rosenberg, Benjamin (L6) 461900 - Parallel Bars - None	3		41	1
1879	2015-11-05 18:39:22.841847-05	1419	Rosenberg, Benjamin (L6) 461900 - High Bar - None	3		41	1
1880	2015-11-05 18:39:22.842754-05	890	FLAGGED! Kelly, Boaz (L7) 575925 - Floor - None	3		41	1
1881	2015-11-05 18:39:22.843753-05	891	FLAGGED! Kelly, Boaz (L7) 575925 - Rings - None	3		41	1
1882	2015-11-05 18:39:22.844735-05	892	FLAGGED! Kelly, Boaz (L7) 575925 - Pommel Horse - None	3		41	1
1883	2015-11-05 18:39:22.845674-05	893	FLAGGED! Kelly, Boaz (L7) 575925 - Vault - None	3		41	1
1884	2015-11-05 18:39:22.84664-05	894	FLAGGED! Kelly, Boaz (L7) 575925 - Parallel Bars - None	3		41	1
1885	2015-11-05 18:39:22.847641-05	895	FLAGGED! Kelly, Boaz (L7) 575925 - High Bar - None	3		41	1
1886	2015-11-05 18:39:22.848573-05	218	FLAGGED! Christopher, Gavin (L9) 433826 - Floor - None	3		41	1
1887	2015-11-05 18:39:22.849512-05	219	FLAGGED! Christopher, Gavin (L9) 433826 - Rings - None	3		41	1
1888	2015-11-05 18:39:22.850422-05	220	FLAGGED! Christopher, Gavin (L9) 433826 - Pommel Horse - None	3		41	1
1889	2015-11-05 18:39:22.851334-05	221	FLAGGED! Christopher, Gavin (L9) 433826 - Vault - None	3		41	1
1890	2015-11-05 18:39:22.85224-05	222	FLAGGED! Christopher, Gavin (L9) 433826 - Parallel Bars - None	3		41	1
1891	2015-11-05 18:39:22.853174-05	223	FLAGGED! Christopher, Gavin (L9) 433826 - High Bar - None	3		41	1
1892	2015-11-05 18:39:22.854067-05	968	FLAGGED! Lawler, Owen (L9) 584620 - Floor - None	3		41	1
1893	2015-11-05 18:39:22.855036-05	969	FLAGGED! Lawler, Owen (L9) 584620 - Rings - None	3		41	1
1894	2015-11-05 18:39:22.855993-05	970	FLAGGED! Lawler, Owen (L9) 584620 - Pommel Horse - None	3		41	1
1895	2015-11-05 18:39:22.856938-05	971	FLAGGED! Lawler, Owen (L9) 584620 - Vault - None	3		41	1
1896	2015-11-05 18:39:22.85783-05	972	FLAGGED! Lawler, Owen (L9) 584620 - Parallel Bars - None	3		41	1
1897	2015-11-05 18:39:22.858793-05	973	FLAGGED! Lawler, Owen (L9) 584620 - High Bar - None	3		41	1
1898	2015-11-05 18:39:22.859781-05	1420	Rosendahl, Matthew (L9) 385832 - Floor - None	3		41	1
1899	2015-11-05 18:39:22.860787-05	1421	Rosendahl, Matthew (L9) 385832 - Rings - None	3		41	1
1900	2015-11-05 18:39:22.861773-05	1422	Rosendahl, Matthew (L9) 385832 - Pommel Horse - None	3		41	1
1901	2015-11-05 18:39:22.862715-05	1423	Rosendahl, Matthew (L9) 385832 - Vault - None	3		41	1
1902	2015-11-05 18:39:22.86362-05	1424	Rosendahl, Matthew (L9) 385832 - Parallel Bars - None	3		41	1
1903	2015-11-05 18:39:22.864593-05	1425	Rosendahl, Matthew (L9) 385832 - High Bar - None	3		41	1
1904	2015-11-05 18:39:22.865538-05	1444	Rutz, Sebastian (L9) 385810 - Floor - None	3		41	1
1905	2015-11-05 18:39:22.866478-05	1445	Rutz, Sebastian (L9) 385810 - Rings - None	3		41	1
1906	2015-11-05 18:39:22.867406-05	1446	Rutz, Sebastian (L9) 385810 - Pommel Horse - None	3		41	1
1907	2015-11-05 18:39:22.868363-05	1447	Rutz, Sebastian (L9) 385810 - Vault - None	3		41	1
1908	2015-11-05 18:39:22.869288-05	1448	Rutz, Sebastian (L9) 385810 - Parallel Bars - None	3		41	1
1909	2015-11-05 18:39:22.870184-05	1449	Rutz, Sebastian (L9) 385810 - High Bar - None	3		41	1
1910	2015-11-05 18:39:22.871074-05	494	FLAGGED! Fritz, Brendan (L10) 243962 - Floor - None	3		41	1
1911	2015-11-05 18:39:22.871968-05	495	FLAGGED! Fritz, Brendan (L10) 243962 - Rings - None	3		41	1
1912	2015-11-05 18:39:22.87289-05	496	FLAGGED! Fritz, Brendan (L10) 243962 - Pommel Horse - None	3		41	1
1913	2015-11-05 18:39:22.873819-05	497	FLAGGED! Fritz, Brendan (L10) 243962 - Vault - None	3		41	1
1914	2015-11-05 18:39:22.874712-05	498	FLAGGED! Fritz, Brendan (L10) 243962 - Parallel Bars - None	3		41	1
1915	2015-11-05 18:39:22.875603-05	499	FLAGGED! Fritz, Brendan (L10) 243962 - High Bar - None	3		41	1
1916	2015-11-05 18:39:22.876573-05	980	FLAGGED! Leonard, Cameron (L10) 204504 - Floor - None	3		41	1
1917	2015-11-05 18:39:22.877536-05	981	FLAGGED! Leonard, Cameron (L10) 204504 - Rings - None	3		41	1
1918	2015-11-05 18:39:22.878463-05	982	FLAGGED! Leonard, Cameron (L10) 204504 - Pommel Horse - None	3		41	1
1919	2015-11-05 18:39:22.8795-05	983	FLAGGED! Leonard, Cameron (L10) 204504 - Vault - None	3		41	1
1920	2015-11-05 18:39:22.880392-05	984	FLAGGED! Leonard, Cameron (L10) 204504 - Parallel Bars - None	3		41	1
1921	2015-11-05 18:39:22.881426-05	985	FLAGGED! Leonard, Cameron (L10) 204504 - High Bar - None	3		41	1
1922	2015-11-05 18:39:22.882445-05	1624	Steele, Isaac (L4)  - Floor - None	3		41	1
1923	2015-11-05 18:39:22.883416-05	1625	Steele, Isaac (L4)  - Rings - None	3		41	1
1924	2015-11-05 18:39:22.884305-05	1626	Steele, Isaac (L4)  - Pommel Horse - None	3		41	1
1925	2015-11-05 18:39:22.885171-05	1627	Steele, Isaac (L4)  - Vault - None	3		41	1
1926	2015-11-05 18:39:22.886093-05	1628	Steele, Isaac (L4)  - Parallel Bars - None	3		41	1
1927	2015-11-05 18:39:22.887053-05	1629	Steele, Isaac (L4)  - High Bar - None	3		41	1
1928	2015-11-05 18:39:22.888013-05	44	Avatara, Rowan (L4) 1016535 - Floor - None	3		41	1
1929	2015-11-05 18:39:22.889267-05	45	Avatara, Rowan (L4) 1016535 - Rings - None	3		41	1
1930	2015-11-05 18:39:22.890497-05	46	Avatara, Rowan (L4) 1016535 - Pommel Horse - None	3		41	1
1931	2015-11-05 18:39:22.891837-05	47	Avatara, Rowan (L4) 1016535 - Vault - None	3		41	1
1932	2015-11-05 18:39:22.89296-05	48	Avatara, Rowan (L4) 1016535 - Parallel Bars - None	3		41	1
1933	2015-11-05 18:39:22.89399-05	49	Avatara, Rowan (L4) 1016535 - High Bar - None	3		41	1
1934	2015-11-05 18:39:22.895014-05	446	Felix, Gavin (L4) 1000825 - Floor - None	3		41	1
1935	2015-11-05 18:39:22.895999-05	447	Felix, Gavin (L4) 1000825 - Rings - None	3		41	1
1936	2015-11-05 18:39:22.896972-05	448	Felix, Gavin (L4) 1000825 - Pommel Horse - None	3		41	1
1937	2015-11-05 18:39:22.898072-05	449	Felix, Gavin (L4) 1000825 - Vault - None	3		41	1
1938	2015-11-05 18:39:22.89911-05	450	Felix, Gavin (L4) 1000825 - Parallel Bars - None	3		41	1
1939	2015-11-05 18:39:22.90015-05	451	Felix, Gavin (L4) 1000825 - High Bar - None	3		41	1
1940	2015-11-05 18:39:22.90118-05	578	Gonslaves, Aaron (L4) 1007598 - Floor - None	3		41	1
1941	2015-11-05 18:39:22.902191-05	579	Gonslaves, Aaron (L4) 1007598 - Rings - None	3		41	1
1942	2015-11-05 18:39:22.90326-05	580	Gonslaves, Aaron (L4) 1007598 - Pommel Horse - None	3		41	1
1943	2015-11-05 18:39:22.904269-05	581	Gonslaves, Aaron (L4) 1007598 - Vault - None	3		41	1
1944	2015-11-05 18:39:22.905199-05	582	Gonslaves, Aaron (L4) 1007598 - Parallel Bars - None	3		41	1
1945	2015-11-05 18:39:22.906214-05	583	Gonslaves, Aaron (L4) 1007598 - High Bar - None	3		41	1
1946	2015-11-05 18:39:22.907256-05	530	Geibel, Owen (L4) 1000824 - Floor - None	3		41	1
1947	2015-11-05 18:39:22.908135-05	531	Geibel, Owen (L4) 1000824 - Rings - None	3		41	1
1948	2015-11-05 18:39:22.90907-05	532	Geibel, Owen (L4) 1000824 - Pommel Horse - None	3		41	1
1949	2015-11-05 18:39:22.909969-05	533	Geibel, Owen (L4) 1000824 - Vault - None	3		41	1
1950	2015-11-05 18:39:22.910982-05	534	Geibel, Owen (L4) 1000824 - Parallel Bars - None	3		41	1
1951	2015-11-05 18:39:22.91196-05	535	Geibel, Owen (L4) 1000824 - High Bar - None	3		41	1
1952	2015-11-05 18:39:22.912943-05	1822	Zolper, Adam (L4) 1000826 - Floor - None	3		41	1
1953	2015-11-05 18:39:22.913928-05	1823	Zolper, Adam (L4) 1000826 - Rings - None	3		41	1
1954	2015-11-05 18:39:22.914857-05	1824	Zolper, Adam (L4) 1000826 - Pommel Horse - None	3		41	1
1955	2015-11-05 18:39:22.915777-05	1825	Zolper, Adam (L4) 1000826 - Vault - None	3		41	1
1956	2015-11-05 18:39:22.916693-05	1826	Zolper, Adam (L4) 1000826 - Parallel Bars - None	3		41	1
1957	2015-11-05 18:39:22.917676-05	1827	Zolper, Adam (L4) 1000826 - High Bar - None	3		41	1
1958	2015-11-05 18:39:22.918569-05	1516	Secord, Joshua (L4) 950067 - Floor - None	3		41	1
1959	2015-11-05 18:39:22.919527-05	1517	Secord, Joshua (L4) 950067 - Rings - None	3		41	1
1960	2015-11-05 18:39:22.920442-05	1518	Secord, Joshua (L4) 950067 - Pommel Horse - None	3		41	1
1961	2015-11-05 18:39:22.921333-05	1519	Secord, Joshua (L4) 950067 - Vault - None	3		41	1
1962	2015-11-05 18:39:22.922221-05	1520	Secord, Joshua (L4) 950067 - Parallel Bars - None	3		41	1
1963	2015-11-05 18:39:22.923125-05	1521	Secord, Joshua (L4) 950067 - High Bar - None	3		41	1
1964	2015-11-05 18:39:22.924111-05	1522	Secord, Zachary (L4) 950068 - Floor - None	3		41	1
1965	2015-11-05 18:39:22.925018-05	1523	Secord, Zachary (L4) 950068 - Rings - None	3		41	1
1966	2015-11-05 18:39:22.926025-05	1524	Secord, Zachary (L4) 950068 - Pommel Horse - None	3		41	1
1967	2015-11-05 18:39:22.926996-05	1525	Secord, Zachary (L4) 950068 - Vault - None	3		41	1
1968	2015-11-05 18:39:22.928084-05	1526	Secord, Zachary (L4) 950068 - Parallel Bars - None	3		41	1
1969	2015-11-05 18:39:22.929043-05	1527	Secord, Zachary (L4) 950068 - High Bar - None	3		41	1
1970	2015-11-05 18:39:22.929993-05	122	Biggs, Spencer (L5) 636882 - Floor - None	3		41	1
1971	2015-11-05 18:39:22.930962-05	123	Biggs, Spencer (L5) 636882 - Rings - None	3		41	1
1972	2015-11-05 18:39:22.931915-05	124	Biggs, Spencer (L5) 636882 - Pommel Horse - None	3		41	1
1973	2015-11-05 18:39:22.932901-05	125	Biggs, Spencer (L5) 636882 - Vault - None	3		41	1
1974	2015-11-05 18:39:22.933888-05	126	Biggs, Spencer (L5) 636882 - Parallel Bars - None	3		41	1
1975	2015-11-05 18:39:22.934777-05	127	Biggs, Spencer (L5) 636882 - High Bar - None	3		41	1
1976	2015-11-05 18:39:22.935673-05	374	DiPillo, AJ (L5) 950066 - Floor - None	3		41	1
1977	2015-11-05 18:39:22.93659-05	375	DiPillo, AJ (L5) 950066 - Rings - None	3		41	1
1978	2015-11-05 18:39:22.937533-05	376	DiPillo, AJ (L5) 950066 - Pommel Horse - None	3		41	1
1979	2015-11-05 18:39:22.938479-05	377	DiPillo, AJ (L5) 950066 - Vault - None	3		41	1
1980	2015-11-05 18:39:22.9394-05	378	DiPillo, AJ (L5) 950066 - Parallel Bars - None	3		41	1
1981	2015-11-05 18:39:22.940346-05	379	DiPillo, AJ (L5) 950066 - High Bar - None	3		41	1
1982	2015-11-05 18:39:22.941293-05	524	Geibel, Austin (L5) 950071 - Floor - None	3		41	1
1983	2015-11-05 18:39:22.94254-05	525	Geibel, Austin (L5) 950071 - Rings - None	3		41	1
1984	2015-11-05 18:39:22.943419-05	526	Geibel, Austin (L5) 950071 - Pommel Horse - None	3		41	1
1985	2015-11-05 18:39:22.94434-05	527	Geibel, Austin (L5) 950071 - Vault - None	3		41	1
1986	2015-11-05 18:39:22.945276-05	528	Geibel, Austin (L5) 950071 - Parallel Bars - None	3		41	1
1987	2015-11-05 18:39:22.946191-05	529	Geibel, Austin (L5) 950071 - High Bar - None	3		41	1
1988	2015-11-05 18:39:22.947129-05	998	Lewis, Spencer (L5) 641686 - Floor - None	3		41	1
1989	2015-11-05 18:39:22.948043-05	999	Lewis, Spencer (L5) 641686 - Rings - None	3		41	1
1990	2015-11-05 18:39:22.948965-05	1000	Lewis, Spencer (L5) 641686 - Pommel Horse - None	3		41	1
1991	2015-11-05 18:39:22.949861-05	1001	Lewis, Spencer (L5) 641686 - Vault - None	3		41	1
1992	2015-11-05 18:39:22.950872-05	1002	Lewis, Spencer (L5) 641686 - Parallel Bars - None	3		41	1
1993	2015-11-05 18:39:22.951787-05	1003	Lewis, Spencer (L5) 641686 - High Bar - None	3		41	1
1994	2015-11-05 18:39:22.952717-05	1064	March, Oliver (L5) 952156 - Floor - None	3		41	1
1995	2015-11-05 18:39:22.953596-05	1065	March, Oliver (L5) 952156 - Rings - None	3		41	1
1996	2015-11-05 18:39:22.954548-05	1066	March, Oliver (L5) 952156 - Pommel Horse - None	3		41	1
1997	2015-11-05 18:39:22.95554-05	1067	March, Oliver (L5) 952156 - Vault - None	3		41	1
1998	2015-11-05 18:39:22.956524-05	1068	March, Oliver (L5) 952156 - Parallel Bars - None	3		41	1
1999	2015-11-05 18:39:22.957492-05	1069	March, Oliver (L5) 952156 - High Bar - None	3		41	1
2000	2015-11-05 18:39:22.958433-05	1342	Pohorylo, Maksym (L5) 950070 - Floor - None	3		41	1
2001	2015-11-05 18:39:22.959445-05	1343	Pohorylo, Maksym (L5) 950070 - Rings - None	3		41	1
2002	2015-11-05 18:39:22.960416-05	1344	Pohorylo, Maksym (L5) 950070 - Pommel Horse - None	3		41	1
2003	2015-11-05 18:39:22.96141-05	1345	Pohorylo, Maksym (L5) 950070 - Vault - None	3		41	1
2004	2015-11-05 18:39:22.962341-05	1346	Pohorylo, Maksym (L5) 950070 - Parallel Bars - None	3		41	1
2005	2015-11-05 18:39:22.963227-05	1347	Pohorylo, Maksym (L5) 950070 - High Bar - None	3		41	1
2006	2015-11-05 18:39:22.964183-05	1474	Salisbury, Sean (L5) 636887 - Floor - None	3		41	1
2007	2015-11-05 18:39:22.965115-05	1475	Salisbury, Sean (L5) 636887 - Rings - None	3		41	1
2008	2015-11-05 18:39:22.966035-05	1476	Salisbury, Sean (L5) 636887 - Pommel Horse - None	3		41	1
2009	2015-11-05 18:39:22.96696-05	1477	Salisbury, Sean (L5) 636887 - Vault - None	3		41	1
2010	2015-11-05 18:39:22.967874-05	1478	Salisbury, Sean (L5) 636887 - Parallel Bars - None	3		41	1
2011	2015-11-05 18:39:22.96881-05	1479	Salisbury, Sean (L5) 636887 - High Bar - None	3		41	1
2012	2015-11-05 18:39:22.969809-05	1702	Uy, Ryan (L5) 978410 - Floor - None	3		41	1
2013	2015-11-05 18:39:22.970717-05	1703	Uy, Ryan (L5) 978410 - Rings - None	3		41	1
2014	2015-11-05 18:39:22.971605-05	1704	Uy, Ryan (L5) 978410 - Pommel Horse - None	3		41	1
2015	2015-11-05 18:39:22.972493-05	1705	Uy, Ryan (L5) 978410 - Vault - None	3		41	1
2016	2015-11-05 18:39:22.973406-05	1706	Uy, Ryan (L5) 978410 - Parallel Bars - None	3		41	1
2017	2015-11-05 18:39:22.974294-05	1707	Uy, Ryan (L5) 978410 - High Bar - None	3		41	1
2018	2015-11-05 18:39:22.975252-05	1672	FLAGGED! Thomas, Casey (L6) 477309 - Floor - None	3		41	1
2019	2015-11-05 18:39:22.976305-05	1673	FLAGGED! Thomas, Casey (L6) 477309 - Rings - None	3		41	1
2020	2015-11-05 18:39:22.977219-05	1674	FLAGGED! Thomas, Casey (L6) 477309 - Pommel Horse - None	3		41	1
2021	2015-11-05 18:39:22.978229-05	1675	FLAGGED! Thomas, Casey (L6) 477309 - Vault - None	3		41	1
2022	2015-11-05 18:39:22.979242-05	1676	FLAGGED! Thomas, Casey (L6) 477309 - Parallel Bars - None	3		41	1
2023	2015-11-05 18:39:22.980242-05	1677	FLAGGED! Thomas, Casey (L6) 477309 - High Bar - None	3		41	1
2024	2015-11-05 18:39:22.981278-05	776	Homan, Connor (L6) 578894 - Floor - None	3		41	1
2025	2015-11-05 18:39:22.982277-05	777	Homan, Connor (L6) 578894 - Rings - None	3		41	1
2026	2015-11-05 18:39:22.983326-05	778	Homan, Connor (L6) 578894 - Pommel Horse - None	3		41	1
2027	2015-11-05 18:39:22.984356-05	779	Homan, Connor (L6) 578894 - Vault - None	3		41	1
2028	2015-11-05 18:39:22.985397-05	780	Homan, Connor (L6) 578894 - Parallel Bars - None	3		41	1
2029	2015-11-05 18:39:22.986436-05	781	Homan, Connor (L6) 578894 - High Bar - None	3		41	1
2030	2015-11-05 18:39:22.987385-05	962	Langdon, TJ (L7) 424073 - Floor - None	3		41	1
2031	2015-11-05 18:39:22.988383-05	963	Langdon, TJ (L7) 424073 - Rings - None	3		41	1
2032	2015-11-05 18:39:22.989319-05	964	Langdon, TJ (L7) 424073 - Pommel Horse - None	3		41	1
2033	2015-11-05 18:39:22.99023-05	965	Langdon, TJ (L7) 424073 - Vault - None	3		41	1
2034	2015-11-05 18:39:22.991172-05	966	Langdon, TJ (L7) 424073 - Parallel Bars - None	3		41	1
2035	2015-11-05 18:39:22.992097-05	967	Langdon, TJ (L7) 424073 - High Bar - None	3		41	1
2036	2015-11-05 18:39:22.993066-05	602	Graves, Edris (L7) 532060 - Floor - None	3		41	1
2037	2015-11-05 18:39:22.994102-05	603	Graves, Edris (L7) 532060 - Rings - None	3		41	1
2038	2015-11-05 18:39:22.995079-05	604	Graves, Edris (L7) 532060 - Pommel Horse - None	3		41	1
2039	2015-11-05 18:39:22.99608-05	605	Graves, Edris (L7) 532060 - Vault - None	3		41	1
2040	2015-11-05 18:39:22.996997-05	606	Graves, Edris (L7) 532060 - Parallel Bars - None	3		41	1
2041	2015-11-05 18:39:22.997984-05	607	Graves, Edris (L7) 532060 - High Bar - None	3		41	1
2042	2015-11-05 18:39:22.998938-05	1744	Walchuk, Kyle (L8) 505115 - Floor - None	3		41	1
2043	2015-11-05 18:39:22.999838-05	1745	Walchuk, Kyle (L8) 505115 - Rings - None	3		41	1
2044	2015-11-05 18:39:23.000917-05	1746	Walchuk, Kyle (L8) 505115 - Pommel Horse - None	3		41	1
2045	2015-11-05 18:39:23.002054-05	1747	Walchuk, Kyle (L8) 505115 - Vault - None	3		41	1
2046	2015-11-05 18:39:23.003086-05	1748	Walchuk, Kyle (L8) 505115 - Parallel Bars - None	3		41	1
2047	2015-11-05 18:39:23.004116-05	1749	Walchuk, Kyle (L8) 505115 - High Bar - None	3		41	1
2048	2015-11-05 18:39:23.005117-05	56	Bachman, Liam (L9) 377434 - Floor - None	3		41	1
2049	2015-11-05 18:39:23.006132-05	57	Bachman, Liam (L9) 377434 - Rings - None	3		41	1
2050	2015-11-05 18:39:23.007135-05	58	Bachman, Liam (L9) 377434 - Pommel Horse - None	3		41	1
2051	2015-11-05 18:39:23.008221-05	59	Bachman, Liam (L9) 377434 - Vault - None	3		41	1
2052	2015-11-05 18:39:23.009185-05	60	Bachman, Liam (L9) 377434 - Parallel Bars - None	3		41	1
2053	2015-11-05 18:39:23.01012-05	61	Bachman, Liam (L9) 377434 - High Bar - None	3		41	1
2054	2015-11-05 18:39:23.011029-05	1492	Scheck, Jackson (L9) 374903 - Floor - None	3		41	1
2055	2015-11-05 18:39:23.011937-05	1493	Scheck, Jackson (L9) 374903 - Rings - None	3		41	1
2056	2015-11-05 18:39:23.01282-05	1494	Scheck, Jackson (L9) 374903 - Pommel Horse - None	3		41	1
2057	2015-11-05 18:39:23.013797-05	1495	Scheck, Jackson (L9) 374903 - Vault - None	3		41	1
2058	2015-11-05 18:39:23.014731-05	1496	Scheck, Jackson (L9) 374903 - Parallel Bars - None	3		41	1
2059	2015-11-05 18:39:23.01569-05	1497	Scheck, Jackson (L9) 374903 - High Bar - None	3		41	1
2060	2015-11-05 18:39:23.016576-05	248	Clark, Kieran (L9) 488032 - Floor - None	3		41	1
2061	2015-11-05 18:39:23.017526-05	249	Clark, Kieran (L9) 488032 - Rings - None	3		41	1
2062	2015-11-05 18:39:23.018419-05	250	Clark, Kieran (L9) 488032 - Pommel Horse - None	3		41	1
2063	2015-11-05 18:39:23.019337-05	251	Clark, Kieran (L9) 488032 - Vault - None	3		41	1
2064	2015-11-05 18:39:23.020225-05	252	Clark, Kieran (L9) 488032 - Parallel Bars - None	3		41	1
2065	2015-11-05 18:39:23.021144-05	253	Clark, Kieran (L9) 488032 - High Bar - None	3		41	1
2066	2015-11-05 18:39:23.022084-05	1288	Overman, Andrew (L9) 505112 - Floor - None	3		41	1
2067	2015-11-05 18:39:23.022996-05	1289	Overman, Andrew (L9) 505112 - Rings - None	3		41	1
2068	2015-11-05 18:39:23.023963-05	1290	Overman, Andrew (L9) 505112 - Pommel Horse - None	3		41	1
2069	2015-11-05 18:39:23.025004-05	1291	Overman, Andrew (L9) 505112 - Vault - None	3		41	1
2070	2015-11-05 18:39:23.026105-05	1292	Overman, Andrew (L9) 505112 - Parallel Bars - None	3		41	1
2071	2015-11-05 18:39:23.027534-05	1293	Overman, Andrew (L9) 505112 - High Bar - None	3		41	1
2072	2015-11-05 18:39:23.028615-05	296	Cunane, Collin (L9) 423834 - Floor - None	3		41	1
2073	2015-11-05 18:39:23.029587-05	297	Cunane, Collin (L9) 423834 - Rings - None	3		41	1
2074	2015-11-05 18:39:23.030588-05	298	Cunane, Collin (L9) 423834 - Pommel Horse - None	3		41	1
2075	2015-11-05 18:39:23.03155-05	299	Cunane, Collin (L9) 423834 - Vault - None	3		41	1
2076	2015-11-05 18:39:23.032549-05	300	Cunane, Collin (L9) 423834 - Parallel Bars - None	3		41	1
2077	2015-11-05 18:39:23.033489-05	301	Cunane, Collin (L9) 423834 - High Bar - None	3		41	1
2078	2015-11-05 18:39:23.034402-05	284	Cramer, Joe (L10) 258877 - Floor - None	3		41	1
2079	2015-11-05 18:39:23.035312-05	285	Cramer, Joe (L10) 258877 - Rings - None	3		41	1
2080	2015-11-05 18:39:23.036258-05	286	Cramer, Joe (L10) 258877 - Pommel Horse - None	3		41	1
2081	2015-11-05 18:39:23.037166-05	287	Cramer, Joe (L10) 258877 - Vault - None	3		41	1
2082	2015-11-05 18:39:23.038173-05	288	Cramer, Joe (L10) 258877 - Parallel Bars - None	3		41	1
2083	2015-11-05 18:39:23.039122-05	289	Cramer, Joe (L10) 258877 - High Bar - None	3		41	1
2084	2015-11-05 18:39:23.040032-05	92	Bauer, Adam (L10) 256327 - Floor - None	3		41	1
2085	2015-11-05 18:39:23.040936-05	93	Bauer, Adam (L10) 256327 - Rings - None	3		41	1
2086	2015-11-05 18:39:23.041902-05	94	Bauer, Adam (L10) 256327 - Pommel Horse - None	3		41	1
2087	2015-11-05 18:39:23.042937-05	95	Bauer, Adam (L10) 256327 - Vault - None	3		41	1
2088	2015-11-05 18:39:23.043993-05	96	Bauer, Adam (L10) 256327 - Parallel Bars - None	3		41	1
2089	2015-11-05 18:39:23.044956-05	97	Bauer, Adam (L10) 256327 - High Bar - None	3		41	1
2090	2015-11-05 18:39:23.045957-05	1450	Ryan, Carson (L10) 446268 - Floor - None	3		41	1
2091	2015-11-05 18:39:23.046919-05	1451	Ryan, Carson (L10) 446268 - Rings - None	3		41	1
2092	2015-11-05 18:39:23.047814-05	1452	Ryan, Carson (L10) 446268 - Pommel Horse - None	3		41	1
2093	2015-11-05 18:39:23.048726-05	1453	Ryan, Carson (L10) 446268 - Vault - None	3		41	1
2094	2015-11-05 18:39:23.049587-05	1454	Ryan, Carson (L10) 446268 - Parallel Bars - None	3		41	1
2095	2015-11-05 18:39:23.050499-05	1455	Ryan, Carson (L10) 446268 - High Bar - None	3		41	1
2096	2015-11-05 18:39:23.0514-05	1438	Rutherford, Grady (L8) 436001 - Floor - None	3		41	1
2097	2015-11-05 18:39:23.052293-05	1439	Rutherford, Grady (L8) 436001 - Rings - None	3		41	1
2098	2015-11-05 18:39:23.053215-05	1440	Rutherford, Grady (L8) 436001 - Pommel Horse - None	3		41	1
2099	2015-11-05 18:39:23.054254-05	1441	Rutherford, Grady (L8) 436001 - Vault - None	3		41	1
2100	2015-11-05 18:39:23.055172-05	1442	Rutherford, Grady (L8) 436001 - Parallel Bars - None	3		41	1
2101	2015-11-05 18:39:23.05615-05	1443	Rutherford, Grady (L8) 436001 - High Bar - None	3		41	1
2102	2015-11-05 18:39:23.057078-05	428	Faglioni, Mitchell (L6) 522955 - Floor - None	3		41	1
2103	2015-11-05 18:39:23.058004-05	429	Faglioni, Mitchell (L6) 522955 - Rings - None	3		41	1
2104	2015-11-05 18:39:23.058925-05	430	Faglioni, Mitchell (L6) 522955 - Pommel Horse - None	3		41	1
2105	2015-11-05 18:39:23.059826-05	431	Faglioni, Mitchell (L6) 522955 - Vault - None	3		41	1
2106	2015-11-05 18:39:23.060873-05	432	Faglioni, Mitchell (L6) 522955 - Parallel Bars - None	3		41	1
2107	2015-11-05 18:39:23.061831-05	433	Faglioni, Mitchell (L6) 522955 - High Bar - None	3		41	1
2108	2015-11-05 18:39:23.062788-05	758	Hicks, Hayden (L6) 636527 - Floor - None	3		41	1
2109	2015-11-05 18:39:23.063768-05	759	Hicks, Hayden (L6) 636527 - Rings - None	3		41	1
2110	2015-11-05 18:39:23.064721-05	760	Hicks, Hayden (L6) 636527 - Pommel Horse - None	3		41	1
2111	2015-11-05 18:39:23.065641-05	761	Hicks, Hayden (L6) 636527 - Vault - None	3		41	1
2112	2015-11-05 18:39:23.066559-05	762	Hicks, Hayden (L6) 636527 - Parallel Bars - None	3		41	1
2113	2015-11-05 18:39:23.067494-05	763	Hicks, Hayden (L6) 636527 - High Bar - None	3		41	1
2114	2015-11-05 18:39:23.068392-05	176	Burchard, Grayson (L6) 657526 - Floor - None	3		41	1
2115	2015-11-05 18:39:23.069325-05	177	Burchard, Grayson (L6) 657526 - Rings - None	3		41	1
2116	2015-11-05 18:39:23.070215-05	178	Burchard, Grayson (L6) 657526 - Pommel Horse - None	3		41	1
2117	2015-11-05 18:39:23.071343-05	179	Burchard, Grayson (L6) 657526 - Vault - None	3		41	1
2118	2015-11-05 18:39:23.072282-05	180	Burchard, Grayson (L6) 657526 - Parallel Bars - None	3		41	1
2119	2015-11-05 18:39:23.073198-05	181	Burchard, Grayson (L6) 657526 - High Bar - None	3		41	1
2120	2015-11-05 18:39:23.074152-05	104	FLAGGED! Becker, Kunda (L4) 938283 - Floor - None	3		41	1
2121	2015-11-05 18:39:23.075076-05	105	FLAGGED! Becker, Kunda (L4) 938283 - Rings - None	3		41	1
2122	2015-11-05 18:39:23.076031-05	106	FLAGGED! Becker, Kunda (L4) 938283 - Pommel Horse - None	3		41	1
2123	2015-11-05 18:39:23.076971-05	107	FLAGGED! Becker, Kunda (L4) 938283 - Vault - None	3		41	1
2124	2015-11-05 18:39:23.077941-05	108	FLAGGED! Becker, Kunda (L4) 938283 - Parallel Bars - None	3		41	1
2125	2015-11-05 18:39:23.078919-05	109	FLAGGED! Becker, Kunda (L4) 938283 - High Bar - None	3		41	1
2126	2015-11-05 18:39:23.079844-05	1119	Mazzuca, Zack (L4) 1008952 - Floor - None	3		41	1
2127	2015-11-05 18:39:23.080737-05	1120	Mazzuca, Zack (L4) 1008952 - Rings - None	3		41	1
2128	2015-11-05 18:39:23.081615-05	1121	Mazzuca, Zack (L4) 1008952 - Pommel Horse - None	3		41	1
2129	2015-11-05 18:39:23.082492-05	1122	Mazzuca, Zack (L4) 1008952 - Vault - None	3		41	1
2130	2015-11-05 18:39:23.083365-05	1123	Mazzuca, Zack (L4) 1008952 - Parallel Bars - None	3		41	1
2131	2015-11-05 18:39:23.084282-05	1124	Mazzuca, Zack (L4) 1008952 - High Bar - None	3		41	1
2132	2015-11-05 18:39:23.085155-05	1113	Mazzuca, Luke (L5) 621923 - Floor - None	3		41	1
2133	2015-11-05 18:39:23.086092-05	1114	Mazzuca, Luke (L5) 621923 - Rings - None	3		41	1
2134	2015-11-05 18:39:23.087063-05	1115	Mazzuca, Luke (L5) 621923 - Pommel Horse - None	3		41	1
2135	2015-11-05 18:39:23.08799-05	1116	Mazzuca, Luke (L5) 621923 - Vault - None	3		41	1
2136	2015-11-05 18:39:23.088884-05	1117	Mazzuca, Luke (L5) 621923 - Parallel Bars - None	3		41	1
2137	2015-11-05 18:39:23.089778-05	1118	Mazzuca, Luke (L5) 621923 - High Bar - None	3		41	1
2138	2015-11-05 18:39:23.090784-05	1155	Miller, Alex (L5) 938125 - Floor - None	3		41	1
2139	2015-11-05 18:39:23.091956-05	1156	Miller, Alex (L5) 938125 - Rings - None	3		41	1
2140	2015-11-05 18:39:23.093139-05	1157	Miller, Alex (L5) 938125 - Pommel Horse - None	3		41	1
2141	2015-11-05 18:39:23.094291-05	1158	Miller, Alex (L5) 938125 - Vault - None	3		41	1
2142	2015-11-05 18:39:23.095368-05	1159	Miller, Alex (L5) 938125 - Parallel Bars - None	3		41	1
2143	2015-11-05 18:39:23.096329-05	1160	Miller, Alex (L5) 938125 - High Bar - None	3		41	1
2144	2015-11-05 18:39:23.097326-05	1203	FLAGGED! Morrison, Colin (L5) 621924 - Floor - None	3		41	1
2145	2015-11-05 18:39:23.098438-05	1204	FLAGGED! Morrison, Colin (L5) 621924 - Rings - None	3		41	1
2146	2015-11-05 18:39:23.099484-05	1205	FLAGGED! Morrison, Colin (L5) 621924 - Pommel Horse - None	3		41	1
2147	2015-11-05 18:39:23.100521-05	1206	FLAGGED! Morrison, Colin (L5) 621924 - Vault - None	3		41	1
2148	2015-11-05 18:39:23.101564-05	1207	FLAGGED! Morrison, Colin (L5) 621924 - Parallel Bars - None	3		41	1
2149	2015-11-05 18:39:23.102584-05	1208	FLAGGED! Morrison, Colin (L5) 621924 - High Bar - None	3		41	1
2150	2015-11-05 18:39:23.103608-05	1209	FLAGGED! Morrison, Tyler (L5) 587041 - Floor - None	3		41	1
2151	2015-11-05 18:39:23.10464-05	1210	FLAGGED! Morrison, Tyler (L5) 587041 - Rings - None	3		41	1
2152	2015-11-05 18:39:23.105692-05	1212	FLAGGED! Morrison, Tyler (L5) 587041 - Pommel Horse - None	3		41	1
2153	2015-11-05 18:39:23.106751-05	1213	FLAGGED! Morrison, Tyler (L5) 587041 - Vault - None	3		41	1
2154	2015-11-05 18:39:23.107775-05	1214	FLAGGED! Morrison, Tyler (L5) 587041 - Parallel Bars - None	3		41	1
2155	2015-11-05 18:39:23.108783-05	1215	FLAGGED! Morrison, Tyler (L5) 587041 - High Bar - None	3		41	1
2156	2015-11-05 18:39:23.109781-05	1282	Ostrowski, Tyler (L5) 938128 - Floor - None	3		41	1
2157	2015-11-05 18:39:23.110724-05	1283	Ostrowski, Tyler (L5) 938128 - Rings - None	3		41	1
2158	2015-11-05 18:39:23.111668-05	1284	Ostrowski, Tyler (L5) 938128 - Pommel Horse - None	3		41	1
2159	2015-11-05 18:39:23.112652-05	1285	Ostrowski, Tyler (L5) 938128 - Vault - None	3		41	1
2160	2015-11-05 18:39:23.113824-05	1286	Ostrowski, Tyler (L5) 938128 - Parallel Bars - None	3		41	1
2161	2015-11-05 18:39:23.114749-05	1287	Ostrowski, Tyler (L5) 938128 - High Bar - None	3		41	1
2162	2015-11-05 18:39:23.115724-05	1384	Richards, Adam (L5) 661838 - Floor - None	3		41	1
2163	2015-11-05 18:39:23.116808-05	1385	Richards, Adam (L5) 661838 - Rings - None	3		41	1
2164	2015-11-05 18:39:23.11782-05	1386	Richards, Adam (L5) 661838 - Pommel Horse - None	3		41	1
2165	2015-11-05 18:39:23.118781-05	1387	Richards, Adam (L5) 661838 - Vault - None	3		41	1
2166	2015-11-05 18:39:23.119679-05	1388	Richards, Adam (L5) 661838 - Parallel Bars - None	3		41	1
2167	2015-11-05 18:39:23.120713-05	1389	Richards, Adam (L5) 661838 - High Bar - None	3		41	1
2168	2015-11-05 18:39:23.121637-05	1570	Simpson, Sergei (L5) 621927 - Floor - None	3		41	1
2169	2015-11-05 18:39:23.122607-05	1571	Simpson, Sergei (L5) 621927 - Rings - None	3		41	1
2170	2015-11-05 18:39:23.123536-05	1572	Simpson, Sergei (L5) 621927 - Pommel Horse - None	3		41	1
2171	2015-11-05 18:39:23.124434-05	1573	Simpson, Sergei (L5) 621927 - Vault - None	3		41	1
2172	2015-11-05 18:39:23.125366-05	1574	Simpson, Sergei (L5) 621927 - Parallel Bars - None	3		41	1
2173	2015-11-05 18:39:23.126262-05	1575	Simpson, Sergei (L5) 621927 - High Bar - None	3		41	1
2174	2015-11-05 18:39:23.127208-05	200	FLAGGED! Campbell, Orion (L5) 639727 - Floor - None	3		41	1
2175	2015-11-05 18:39:23.128187-05	201	FLAGGED! Campbell, Orion (L5) 639727 - Rings - None	3		41	1
2176	2015-11-05 18:39:23.129153-05	202	FLAGGED! Campbell, Orion (L5) 639727 - Pommel Horse - None	3		41	1
2177	2015-11-05 18:39:23.130131-05	203	FLAGGED! Campbell, Orion (L5) 639727 - Vault - None	3		41	1
2178	2015-11-05 18:39:23.131155-05	204	FLAGGED! Campbell, Orion (L5) 639727 - Parallel Bars - None	3		41	1
2179	2015-11-05 18:39:23.132071-05	205	FLAGGED! Campbell, Orion (L5) 639727 - High Bar - None	3		41	1
2180	2015-11-05 18:39:23.132995-05	896	FLAGGED! Kestler, Spencer (L5) 573985 - Floor - None	3		41	1
2181	2015-11-05 18:39:23.133946-05	897	FLAGGED! Kestler, Spencer (L5) 573985 - Rings - None	3		41	1
2182	2015-11-05 18:39:23.134866-05	898	FLAGGED! Kestler, Spencer (L5) 573985 - Pommel Horse - None	3		41	1
2183	2015-11-05 18:39:23.135806-05	899	FLAGGED! Kestler, Spencer (L5) 573985 - Vault - None	3		41	1
2184	2015-11-05 18:39:23.136937-05	900	FLAGGED! Kestler, Spencer (L5) 573985 - Parallel Bars - None	3		41	1
2185	2015-11-05 18:39:23.138294-05	901	FLAGGED! Kestler, Spencer (L5) 573985 - High Bar - None	3		41	1
2186	2015-11-05 18:39:23.139257-05	908	Kofie, Malakai (L5) 583018 - Floor - None	3		41	1
2187	2015-11-05 18:39:23.140201-05	909	Kofie, Malakai (L5) 583018 - Rings - None	3		41	1
2188	2015-11-05 18:39:23.141132-05	910	Kofie, Malakai (L5) 583018 - Pommel Horse - None	3		41	1
2189	2015-11-05 18:39:23.142054-05	911	Kofie, Malakai (L5) 583018 - Vault - None	3		41	1
2190	2015-11-05 18:39:23.142964-05	912	Kofie, Malakai (L5) 583018 - Parallel Bars - None	3		41	1
2191	2015-11-05 18:39:23.143878-05	913	Kofie, Malakai (L5) 583018 - High Bar - None	3		41	1
2192	2015-11-05 18:39:23.144863-05	212	Chiang, Thomas (L5) 1008955 - Floor - None	3		41	1
2193	2015-11-05 18:39:23.145895-05	213	Chiang, Thomas (L5) 1008955 - Rings - None	3		41	1
2194	2015-11-05 18:39:23.146854-05	214	Chiang, Thomas (L5) 1008955 - Pommel Horse - None	3		41	1
2195	2015-11-05 18:39:23.147786-05	215	Chiang, Thomas (L5) 1008955 - Vault - None	3		41	1
2196	2015-11-05 18:39:23.148704-05	216	Chiang, Thomas (L5) 1008955 - Parallel Bars - None	3		41	1
2197	2015-11-05 18:39:23.149638-05	217	Chiang, Thomas (L5) 1008955 - High Bar - None	3		41	1
2198	2015-11-05 18:39:23.150633-05	1216	Muhammad, Dawud (L5) 650435 - Floor - None	3		41	1
2199	2015-11-05 18:39:23.1516-05	1217	Muhammad, Dawud (L5) 650435 - Rings - None	3		41	1
2200	2015-11-05 18:39:23.152525-05	1218	Muhammad, Dawud (L5) 650435 - Pommel Horse - None	3		41	1
2201	2015-11-05 18:39:23.153444-05	1219	Muhammad, Dawud (L5) 650435 - Vault - None	3		41	1
2202	2015-11-05 18:39:23.154348-05	1220	Muhammad, Dawud (L5) 650435 - Parallel Bars - None	3		41	1
2203	2015-11-05 18:39:23.155246-05	1221	Muhammad, Dawud (L5) 650435 - High Bar - None	3		41	1
2204	2015-11-05 18:39:23.15614-05	1540	Sheppard, Keon (L6) 571647 - Floor - None	3		41	1
2205	2015-11-05 18:39:23.157111-05	1541	Sheppard, Keon (L6) 571647 - Rings - None	3		41	1
2206	2015-11-05 18:39:23.158136-05	1542	Sheppard, Keon (L6) 571647 - Pommel Horse - None	3		41	1
2207	2015-11-05 18:39:23.159083-05	1543	Sheppard, Keon (L6) 571647 - Vault - None	3		41	1
2208	2015-11-05 18:39:23.160057-05	1544	Sheppard, Keon (L6) 571647 - Parallel Bars - None	3		41	1
2209	2015-11-05 18:39:23.160981-05	1545	Sheppard, Keon (L6) 571647 - High Bar - None	3		41	1
2210	2015-11-05 18:39:23.161916-05	704	Haycock, Wesley (L6) 486369 - Floor - None	3		41	1
2211	2015-11-05 18:39:23.162832-05	705	Haycock, Wesley (L6) 486369 - Rings - None	3		41	1
2212	2015-11-05 18:39:23.163809-05	706	Haycock, Wesley (L6) 486369 - Pommel Horse - None	3		41	1
2213	2015-11-05 18:39:23.164783-05	707	Haycock, Wesley (L6) 486369 - Vault - None	3		41	1
2214	2015-11-05 18:39:23.165769-05	708	Haycock, Wesley (L6) 486369 - Parallel Bars - None	3		41	1
2215	2015-11-05 18:39:23.166718-05	709	Haycock, Wesley (L6) 486369 - High Bar - None	3		41	1
2216	2015-11-05 18:39:23.167665-05	680	Harman, Connor (L6) 554559 - Floor - None	3		41	1
2217	2015-11-05 18:39:23.168629-05	681	Harman, Connor (L6) 554559 - Rings - None	3		41	1
2218	2015-11-05 18:39:23.169553-05	682	Harman, Connor (L6) 554559 - Pommel Horse - None	3		41	1
2219	2015-11-05 18:39:23.170492-05	683	Harman, Connor (L6) 554559 - Vault - None	3		41	1
2220	2015-11-05 18:39:23.171416-05	684	Harman, Connor (L6) 554559 - Parallel Bars - None	3		41	1
2221	2015-11-05 18:39:23.172346-05	685	Harman, Connor (L6) 554559 - High Bar - None	3		41	1
2222	2015-11-05 18:39:23.173344-05	926	FLAGGED! Kunda, Bode (L6) 592599 - Floor - None	3		41	1
2223	2015-11-05 18:39:23.174301-05	927	FLAGGED! Kunda, Bode (L6) 592599 - Rings - None	3		41	1
2224	2015-11-05 18:39:23.175198-05	928	FLAGGED! Kunda, Bode (L6) 592599 - Pommel Horse - None	3		41	1
2225	2015-11-05 18:39:23.176156-05	929	FLAGGED! Kunda, Bode (L6) 592599 - Vault - None	3		41	1
2226	2015-11-05 18:39:23.177148-05	930	FLAGGED! Kunda, Bode (L6) 592599 - Parallel Bars - None	3		41	1
2227	2015-11-05 18:39:23.178117-05	931	FLAGGED! Kunda, Bode (L6) 592599 - High Bar - None	3		41	1
2228	2015-11-05 18:39:23.17915-05	116	Berman, Joshua (L8) 463969 - Floor - None	3		41	1
2229	2015-11-05 18:39:23.180104-05	117	Berman, Joshua (L8) 463969 - Rings - None	3		41	1
2230	2015-11-05 18:39:23.181029-05	118	Berman, Joshua (L8) 463969 - Pommel Horse - None	3		41	1
2231	2015-11-05 18:39:23.181963-05	119	Berman, Joshua (L8) 463969 - Vault - None	3		41	1
2232	2015-11-05 18:39:23.182883-05	120	Berman, Joshua (L8) 463969 - Parallel Bars - None	3		41	1
2233	2015-11-05 18:39:23.184232-05	121	Berman, Joshua (L8) 463969 - High Bar - None	3		41	1
2234	2015-11-05 18:39:23.185251-05	386	Donnely, Xavier (L8)  - Floor - None	3		41	1
2235	2015-11-05 18:39:23.186217-05	387	Donnely, Xavier (L8)  - Rings - None	3		41	1
2236	2015-11-05 18:39:23.18716-05	388	Donnely, Xavier (L8)  - Pommel Horse - None	3		41	1
2237	2015-11-05 18:39:23.188064-05	389	Donnely, Xavier (L8)  - Vault - None	3		41	1
2238	2015-11-05 18:39:23.188997-05	390	Donnely, Xavier (L8)  - Parallel Bars - None	3		41	1
2239	2015-11-05 18:39:23.189878-05	391	Donnely, Xavier (L8)  - High Bar - None	3		41	1
2240	2015-11-05 18:39:23.190754-05	356	FLAGGED! Dev, Sahil (L7) 429974 - Floor - None	3		41	1
2241	2015-11-05 18:39:23.191632-05	357	FLAGGED! Dev, Sahil (L7) 429974 - Rings - None	3		41	1
2242	2015-11-05 18:39:23.192599-05	358	FLAGGED! Dev, Sahil (L7) 429974 - Pommel Horse - None	3		41	1
2243	2015-11-05 18:39:23.193498-05	359	FLAGGED! Dev, Sahil (L7) 429974 - Vault - None	3		41	1
2244	2015-11-05 18:39:23.194467-05	360	FLAGGED! Dev, Sahil (L7) 429974 - Parallel Bars - None	3		41	1
2245	2015-11-05 18:39:23.19547-05	361	FLAGGED! Dev, Sahil (L7) 429974 - High Bar - None	3		41	1
2246	2015-11-05 18:39:23.196444-05	536	Gernhar..., James (L7) 506486 - Floor - None	3		41	1
2247	2015-11-05 18:39:23.197424-05	537	Gernhar..., James (L7) 506486 - Rings - None	3		41	1
2248	2015-11-05 18:39:23.198435-05	538	Gernhar..., James (L7) 506486 - Pommel Horse - None	3		41	1
2249	2015-11-05 18:39:23.199424-05	539	Gernhar..., James (L7) 506486 - Vault - None	3		41	1
2250	2015-11-05 18:39:23.200399-05	540	Gernhar..., James (L7) 506486 - Parallel Bars - None	3		41	1
2251	2015-11-05 18:39:23.201496-05	541	Gernhar..., James (L7) 506486 - High Bar - None	3		41	1
2252	2015-11-05 18:39:23.202625-05	542	Gernhart, Andrew (L7) 506477 - Floor - None	3		41	1
2253	2015-11-05 18:39:23.203694-05	543	Gernhart, Andrew (L7) 506477 - Rings - None	3		41	1
2254	2015-11-05 18:39:23.2048-05	544	Gernhart, Andrew (L7) 506477 - Pommel Horse - None	3		41	1
2255	2015-11-05 18:39:23.205888-05	545	Gernhart, Andrew (L7) 506477 - Vault - None	3		41	1
2256	2015-11-05 18:39:23.206912-05	546	Gernhart, Andrew (L7) 506477 - Parallel Bars - None	3		41	1
2257	2015-11-05 18:39:23.208031-05	547	Gernhart, Andrew (L7) 506477 - High Bar - None	3		41	1
2258	2015-11-05 18:39:23.209168-05	746	Hewitt, Griffin (L7) 511224 - Floor - None	3		41	1
2259	2015-11-05 18:39:23.21024-05	747	Hewitt, Griffin (L7) 511224 - Rings - None	3		41	1
2260	2015-11-05 18:39:23.211446-05	748	Hewitt, Griffin (L7) 511224 - Pommel Horse - None	3		41	1
2261	2015-11-05 18:39:23.212643-05	749	Hewitt, Griffin (L7) 511224 - Vault - None	3		41	1
2262	2015-11-05 18:39:23.213719-05	750	Hewitt, Griffin (L7) 511224 - Parallel Bars - None	3		41	1
2263	2015-11-05 18:39:23.214828-05	751	Hewitt, Griffin (L7) 511224 - High Bar - None	3		41	1
2264	2015-11-05 18:39:23.215888-05	1149	Mignardi, Gabe (L7) 396527 - Floor - None	3		41	1
2265	2015-11-05 18:39:23.217106-05	1150	Mignardi, Gabe (L7) 396527 - Rings - None	3		41	1
2266	2015-11-05 18:39:23.218232-05	1151	Mignardi, Gabe (L7) 396527 - Pommel Horse - None	3		41	1
2267	2015-11-05 18:39:23.219268-05	1152	Mignardi, Gabe (L7) 396527 - Vault - None	3		41	1
2268	2015-11-05 18:39:23.22022-05	1153	Mignardi, Gabe (L7) 396527 - Parallel Bars - None	3		41	1
2269	2015-11-05 18:39:23.221101-05	1154	Mignardi, Gabe (L7) 396527 - High Bar - None	3		41	1
2270	2015-11-05 18:39:23.221973-05	470	FLAGGED! Fisher, Elijah (L7) 482708 - Floor - None	3		41	1
2271	2015-11-05 18:39:23.222842-05	471	FLAGGED! Fisher, Elijah (L7) 482708 - Rings - None	3		41	1
2272	2015-11-05 18:39:23.223804-05	472	FLAGGED! Fisher, Elijah (L7) 482708 - Pommel Horse - None	3		41	1
2273	2015-11-05 18:39:23.224731-05	473	FLAGGED! Fisher, Elijah (L7) 482708 - Vault - None	3		41	1
2274	2015-11-05 18:39:23.225652-05	474	FLAGGED! Fisher, Elijah (L7) 482708 - Parallel Bars - None	3		41	1
2275	2015-11-05 18:39:23.226602-05	475	FLAGGED! Fisher, Elijah (L7) 482708 - High Bar - None	3		41	1
2276	2015-11-05 18:39:23.22771-05	1034	Luethy, Hollis (L7) 521581 - Floor - None	3		41	1
2277	2015-11-05 18:39:23.228797-05	1035	Luethy, Hollis (L7) 521581 - Rings - None	3		41	1
2278	2015-11-05 18:39:23.229773-05	1036	Luethy, Hollis (L7) 521581 - Pommel Horse - None	3		41	1
2279	2015-11-05 18:39:23.230705-05	1037	Luethy, Hollis (L7) 521581 - Vault - None	3		41	1
2280	2015-11-05 18:39:23.231656-05	1038	Luethy, Hollis (L7) 521581 - Parallel Bars - None	3		41	1
2281	2015-11-05 18:39:23.232581-05	1039	Luethy, Hollis (L7) 521581 - High Bar - None	3		41	1
2282	2015-11-05 18:39:23.233526-05	1546	FLAGGED! Shiffrin, Henry (L7) 519898 - Floor - None	3		41	1
2283	2015-11-05 18:39:23.234421-05	1547	FLAGGED! Shiffrin, Henry (L7) 519898 - Rings - None	3		41	1
2284	2015-11-05 18:39:23.235317-05	1548	FLAGGED! Shiffrin, Henry (L7) 519898 - Pommel Horse - None	3		41	1
2285	2015-11-05 18:39:23.236208-05	1549	FLAGGED! Shiffrin, Henry (L7) 519898 - Vault - None	3		41	1
2286	2015-11-05 18:39:23.237119-05	1550	FLAGGED! Shiffrin, Henry (L7) 519898 - Parallel Bars - None	3		41	1
2287	2015-11-05 18:39:23.238016-05	1551	FLAGGED! Shiffrin, Henry (L7) 519898 - High Bar - None	3		41	1
2288	2015-11-05 18:39:23.238928-05	1432	Rudie, Paul (L9) 433836 - Floor - None	3		41	1
2289	2015-11-05 18:39:23.239865-05	1433	Rudie, Paul (L9) 433836 - Rings - None	3		41	1
2290	2015-11-05 18:39:23.240759-05	1434	Rudie, Paul (L9) 433836 - Pommel Horse - None	3		41	1
2291	2015-11-05 18:39:23.241695-05	1435	Rudie, Paul (L9) 433836 - Vault - None	3		41	1
2292	2015-11-05 18:39:23.242724-05	1436	Rudie, Paul (L9) 433836 - Parallel Bars - None	3		41	1
2293	2015-11-05 18:39:23.243657-05	1437	Rudie, Paul (L9) 433836 - High Bar - None	3		41	1
2294	2015-11-05 18:39:23.244576-05	938	Kuzmenchuk, Aleksandr (L9) 372142 - Floor - None	3		41	1
2295	2015-11-05 18:39:23.245488-05	939	Kuzmenchuk, Aleksandr (L9) 372142 - Rings - None	3		41	1
2296	2015-11-05 18:39:23.246874-05	940	Kuzmenchuk, Aleksandr (L9) 372142 - Pommel Horse - None	3		41	1
2297	2015-11-05 18:39:23.247887-05	941	Kuzmenchuk, Aleksandr (L9) 372142 - Vault - None	3		41	1
2298	2015-11-05 18:39:23.248862-05	942	Kuzmenchuk, Aleksandr (L9) 372142 - Parallel Bars - None	3		41	1
2299	2015-11-05 18:39:23.249811-05	943	Kuzmenchuk, Aleksandr (L9) 372142 - High Bar - None	3		41	1
2300	2015-11-05 18:39:23.250741-05	1360	Powers, Zyler (L9) 433836 - Floor - None	3		41	1
2301	2015-11-05 18:39:23.251679-05	1361	Powers, Zyler (L9) 433836 - Rings - None	3		41	1
2302	2015-11-05 18:39:23.25268-05	1362	Powers, Zyler (L9) 433836 - Pommel Horse - None	3		41	1
2303	2015-11-05 18:39:23.253661-05	1363	Powers, Zyler (L9) 433836 - Vault - None	3		41	1
2304	2015-11-05 18:39:23.254669-05	1364	Powers, Zyler (L9) 433836 - Parallel Bars - None	3		41	1
2305	2015-11-05 18:39:23.255719-05	1365	Powers, Zyler (L9) 433836 - High Bar - None	3		41	1
2306	2015-11-05 18:39:23.256681-05	614	Gregory, Johnny (L9) 458583 - Floor - None	3		41	1
2307	2015-11-05 18:39:23.257614-05	615	Gregory, Johnny (L9) 458583 - Rings - None	3		41	1
2308	2015-11-05 18:39:23.258592-05	616	Gregory, Johnny (L9) 458583 - Pommel Horse - None	3		41	1
2309	2015-11-05 18:39:23.259511-05	617	Gregory, Johnny (L9) 458583 - Vault - None	3		41	1
2310	2015-11-05 18:39:23.26042-05	618	Gregory, Johnny (L9) 458583 - Parallel Bars - None	3		41	1
2311	2015-11-05 18:39:23.261402-05	619	Gregory, Johnny (L9) 458583 - High Bar - None	3		41	1
2312	2015-11-05 18:39:23.262421-05	1094	FLAGGED! Mateer, Christopher (L9) 431013 - Floor - None	3		41	1
2313	2015-11-05 18:39:23.263344-05	1095	FLAGGED! Mateer, Christopher (L9) 431013 - Rings - None	3		41	1
2314	2015-11-05 18:39:23.264355-05	1096	FLAGGED! Mateer, Christopher (L9) 431013 - Pommel Horse - None	3		41	1
2315	2015-11-05 18:39:23.265317-05	1097	FLAGGED! Mateer, Christopher (L9) 431013 - Vault - None	3		41	1
2316	2015-11-05 18:39:23.266233-05	1098	FLAGGED! Mateer, Christopher (L9) 431013 - Parallel Bars - None	3		41	1
2317	2015-11-05 18:39:23.267141-05	1099	FLAGGED! Mateer, Christopher (L9) 431013 - High Bar - None	3		41	1
2318	2015-11-05 18:39:23.268065-05	380	Dinmore, Ian (L9) 425358 - Floor - None	3		41	1
2319	2015-11-05 18:39:23.268966-05	381	Dinmore, Ian (L9) 425358 - Rings - None	3		41	1
2320	2015-11-05 18:39:23.269864-05	382	Dinmore, Ian (L9) 425358 - Pommel Horse - None	3		41	1
2321	2015-11-05 18:39:23.270805-05	383	Dinmore, Ian (L9) 425358 - Vault - None	3		41	1
2322	2015-11-05 18:39:23.271692-05	384	Dinmore, Ian (L9) 425358 - Parallel Bars - None	3		41	1
2323	2015-11-05 18:39:23.272644-05	385	Dinmore, Ian (L9) 425358 - High Bar - None	3		41	1
2324	2015-11-05 18:39:23.273561-05	1040	Lutchman, Dhiren (L9) 245810 - Floor - None	3		41	1
2325	2015-11-05 18:39:23.274445-05	1041	Lutchman, Dhiren (L9) 245810 - Rings - None	3		41	1
2326	2015-11-05 18:39:23.275329-05	1042	Lutchman, Dhiren (L9) 245810 - Pommel Horse - None	3		41	1
2327	2015-11-05 18:39:23.27622-05	1043	Lutchman, Dhiren (L9) 245810 - Vault - None	3		41	1
2328	2015-11-05 18:39:23.277126-05	1044	Lutchman, Dhiren (L9) 245810 - Parallel Bars - None	3		41	1
2329	2015-11-05 18:39:23.278011-05	1045	Lutchman, Dhiren (L9) 245810 - High Bar - None	3		41	1
2330	2015-11-05 18:39:23.278882-05	80	Barnhouse, Mark (L9) 621943 - Floor - None	3		41	1
2331	2015-11-05 18:39:23.279759-05	81	Barnhouse, Mark (L9) 621943 - Rings - None	3		41	1
2332	2015-11-05 18:39:23.280622-05	82	Barnhouse, Mark (L9) 621943 - Pommel Horse - None	3		41	1
2333	2015-11-05 18:39:23.281538-05	83	Barnhouse, Mark (L9) 621943 - Vault - None	3		41	1
2334	2015-11-05 18:39:23.282484-05	84	Barnhouse, Mark (L9) 621943 - Parallel Bars - None	3		41	1
2335	2015-11-05 18:39:23.283381-05	85	Barnhouse, Mark (L9) 621943 - High Bar - None	3		41	1
2336	2015-11-05 18:39:23.284365-05	140	FLAGGED! Bowling, Brett (L9) 380451 - Floor - None	3		41	1
2337	2015-11-05 18:39:23.285315-05	141	FLAGGED! Bowling, Brett (L9) 380451 - Rings - None	3		41	1
2338	2015-11-05 18:39:23.286236-05	142	FLAGGED! Bowling, Brett (L9) 380451 - Pommel Horse - None	3		41	1
2339	2015-11-05 18:39:23.287132-05	143	FLAGGED! Bowling, Brett (L9) 380451 - Vault - None	3		41	1
2340	2015-11-05 18:39:23.28808-05	144	FLAGGED! Bowling, Brett (L9) 380451 - Parallel Bars - None	3		41	1
2341	2015-11-05 18:39:23.28897-05	145	FLAGGED! Bowling, Brett (L9) 380451 - High Bar - None	3		41	1
2342	2015-11-05 18:46:34.81188-05	1978	Brewer, CJ (L4)  - Floor - None	3		41	1
2343	2015-11-05 18:46:34.818618-05	1979	Brewer, CJ (L4)  - Rings - None	3		41	1
2344	2015-11-05 18:46:34.820145-05	1980	Brewer, CJ (L4)  - Pommel Horse - None	3		41	1
2345	2015-11-05 18:46:34.821445-05	1981	Brewer, CJ (L4)  - Vault - None	3		41	1
2346	2015-11-05 18:46:34.822695-05	1982	Brewer, CJ (L4)  - Parallel Bars - None	3		41	1
2347	2015-11-05 18:46:34.823839-05	1983	Brewer, CJ (L4)  - High Bar - None	3		41	1
2348	2015-11-05 18:46:34.824869-05	2338	Gandia, Mason (L4)  - Floor - None	3		41	1
2349	2015-11-05 18:46:34.825864-05	2339	Gandia, Mason (L4)  - Rings - None	3		41	1
2350	2015-11-05 18:46:34.826964-05	2340	Gandia, Mason (L4)  - Pommel Horse - None	3		41	1
2351	2015-11-05 18:46:34.82805-05	2341	Gandia, Mason (L4)  - Vault - None	3		41	1
2352	2015-11-05 18:46:34.829025-05	2342	Gandia, Mason (L4)  - Parallel Bars - None	3		41	1
2353	2015-11-05 18:46:34.829915-05	2343	Gandia, Mason (L4)  - High Bar - None	3		41	1
2354	2015-11-05 18:46:34.830846-05	2410	Good, Stone (L4)  - Floor - None	3		41	1
2355	2015-11-05 18:46:34.831782-05	2411	Good, Stone (L4)  - Rings - None	3		41	1
2356	2015-11-05 18:46:34.832694-05	2412	Good, Stone (L4)  - Pommel Horse - None	3		41	1
2357	2015-11-05 18:46:34.833691-05	2413	Good, Stone (L4)  - Vault - None	3		41	1
2358	2015-11-05 18:46:34.834704-05	2414	Good, Stone (L4)  - Parallel Bars - None	3		41	1
2359	2015-11-05 18:46:34.83567-05	2415	Good, Stone (L4)  - High Bar - None	3		41	1
2360	2015-11-05 18:46:34.836604-05	1984	Bridges, Jayden (L5) 942336 - Floor - None	3		41	1
2361	2015-11-05 18:46:34.837519-05	1985	Bridges, Jayden (L5) 942336 - Rings - None	3		41	1
2362	2015-11-05 18:46:34.838436-05	1986	Bridges, Jayden (L5) 942336 - Pommel Horse - None	3		41	1
2363	2015-11-05 18:46:34.839348-05	1987	Bridges, Jayden (L5) 942336 - Vault - None	3		41	1
2364	2015-11-05 18:46:34.840277-05	1988	Bridges, Jayden (L5) 942336 - Parallel Bars - None	3		41	1
2365	2015-11-05 18:46:34.841164-05	1989	Bridges, Jayden (L5) 942336 - High Bar - None	3		41	1
2366	2015-11-05 18:46:34.842048-05	1990	Bridges, Justin (L5) 942338 - Floor - None	3		41	1
2367	2015-11-05 18:46:34.842933-05	1991	Bridges, Justin (L5) 942338 - Rings - None	3		41	1
2368	2015-11-05 18:46:34.843853-05	1992	Bridges, Justin (L5) 942338 - Pommel Horse - None	3		41	1
2369	2015-11-05 18:46:34.844736-05	1993	Bridges, Justin (L5) 942338 - Vault - None	3		41	1
2370	2015-11-05 18:46:34.845722-05	1994	Bridges, Justin (L5) 942338 - Parallel Bars - None	3		41	1
2371	2015-11-05 18:46:34.84661-05	1995	Bridges, Justin (L5) 942338 - High Bar - None	3		41	1
2372	2015-11-05 18:46:34.847493-05	2164	Davis, Tristan (L5) 970193 - Floor - None	3		41	1
2373	2015-11-05 18:46:34.848384-05	2165	Davis, Tristan (L5) 970193 - Rings - None	3		41	1
2374	2015-11-05 18:46:34.849422-05	2166	Davis, Tristan (L5) 970193 - Pommel Horse - None	3		41	1
2375	2015-11-05 18:46:34.850395-05	2167	Davis, Tristan (L5) 970193 - Vault - None	3		41	1
2376	2015-11-05 18:46:34.85136-05	2168	Davis, Tristan (L5) 970193 - Parallel Bars - None	3		41	1
2377	2015-11-05 18:46:34.852367-05	2169	Davis, Tristan (L5) 970193 - High Bar - None	3		41	1
2378	2015-11-05 18:46:34.853366-05	2308	Freeman, TJ (L5) 637230 - Floor - None	3		41	1
2379	2015-11-05 18:46:34.854397-05	2309	Freeman, TJ (L5) 637230 - Rings - None	3		41	1
2380	2015-11-05 18:46:34.855459-05	2310	Freeman, TJ (L5) 637230 - Pommel Horse - None	3		41	1
2381	2015-11-05 18:46:34.85648-05	2311	Freeman, TJ (L5) 637230 - Vault - None	3		41	1
2382	2015-11-05 18:46:34.85746-05	2312	Freeman, TJ (L5) 637230 - Parallel Bars - None	3		41	1
2383	2015-11-05 18:46:34.858374-05	2313	Freeman, TJ (L5) 637230 - High Bar - None	3		41	1
2384	2015-11-05 18:46:34.859295-05	2344	Gatewood, Remy (L5) 942339 - Floor - None	3		41	1
2385	2015-11-05 18:46:34.860185-05	2345	Gatewood, Remy (L5) 942339 - Rings - None	3		41	1
2386	2015-11-05 18:46:34.861089-05	2346	Gatewood, Remy (L5) 942339 - Pommel Horse - None	3		41	1
2387	2015-11-05 18:46:34.862051-05	2347	Gatewood, Remy (L5) 942339 - Vault - None	3		41	1
2388	2015-11-05 18:46:34.862943-05	2348	Gatewood, Remy (L5) 942339 - Parallel Bars - None	3		41	1
2389	2015-11-05 18:46:34.863865-05	2349	Gatewood, Remy (L5) 942339 - High Bar - None	3		41	1
2390	2015-11-05 18:46:34.864745-05	2458	Guida, Jacob (L5) 622274 - Floor - None	3		41	1
2391	2015-11-05 18:46:34.865622-05	2459	Guida, Jacob (L5) 622274 - Rings - None	3		41	1
2392	2015-11-05 18:46:34.86686-05	2460	Guida, Jacob (L5) 622274 - Pommel Horse - None	3		41	1
2393	2015-11-05 18:46:34.867909-05	2461	Guida, Jacob (L5) 622274 - Vault - None	3		41	1
2394	2015-11-05 18:46:34.86892-05	2462	Guida, Jacob (L5) 622274 - Parallel Bars - None	3		41	1
2395	2015-11-05 18:46:34.869858-05	2463	Guida, Jacob (L5) 622274 - High Bar - None	3		41	1
2396	2015-11-05 18:46:34.870775-05	2536	Haydysch, Connor (L5) 982056 - Floor - None	3		41	1
2397	2015-11-05 18:46:34.87171-05	2537	Haydysch, Connor (L5) 982056 - Rings - None	3		41	1
2398	2015-11-05 18:46:34.872759-05	2538	Haydysch, Connor (L5) 982056 - Pommel Horse - None	3		41	1
2399	2015-11-05 18:46:34.873686-05	2539	Haydysch, Connor (L5) 982056 - Vault - None	3		41	1
2400	2015-11-05 18:46:34.874545-05	2540	Haydysch, Connor (L5) 982056 - Parallel Bars - None	3		41	1
2401	2015-11-05 18:46:34.875525-05	2541	Haydysch, Connor (L5) 982056 - High Bar - None	3		41	1
2402	2015-11-05 18:46:34.87658-05	2710	Kellogg, Sean (L5) 628047 - Floor - None	3		41	1
2403	2015-11-05 18:46:34.877584-05	2711	Kellogg, Sean (L5) 628047 - Rings - None	3		41	1
2404	2015-11-05 18:46:34.878502-05	2712	Kellogg, Sean (L5) 628047 - Pommel Horse - None	3		41	1
2405	2015-11-05 18:46:34.87941-05	2713	Kellogg, Sean (L5) 628047 - Vault - None	3		41	1
2406	2015-11-05 18:46:34.880423-05	2714	Kellogg, Sean (L5) 628047 - Parallel Bars - None	3		41	1
2407	2015-11-05 18:46:34.881437-05	2715	Kellogg, Sean (L5) 628047 - High Bar - None	3		41	1
2408	2015-11-05 18:46:34.882452-05	2776	Lakin, Kai (L5) 622279 - Floor - None	3		41	1
2409	2015-11-05 18:46:34.883427-05	2777	Lakin, Kai (L5) 622279 - Rings - None	3		41	1
2410	2015-11-05 18:46:34.884792-05	2778	Lakin, Kai (L5) 622279 - Pommel Horse - None	3		41	1
2411	2015-11-05 18:46:34.885798-05	2779	Lakin, Kai (L5) 622279 - Vault - None	3		41	1
2412	2015-11-05 18:46:34.886736-05	2780	Lakin, Kai (L5) 622279 - Parallel Bars - None	3		41	1
2413	2015-11-05 18:46:34.887705-05	2781	Lakin, Kai (L5) 622279 - High Bar - None	3		41	1
2414	2015-11-05 18:46:34.888626-05	3280	FLAGGED! Ryan, Lochrie (L5) 955643 - Floor - None	3		41	1
2415	2015-11-05 18:46:34.889611-05	3281	FLAGGED! Ryan, Lochrie (L5) 955643 - Rings - None	3		41	1
2416	2015-11-05 18:46:34.890584-05	3282	FLAGGED! Ryan, Lochrie (L5) 955643 - Pommel Horse - None	3		41	1
2417	2015-11-05 18:46:34.8915-05	3283	FLAGGED! Ryan, Lochrie (L5) 955643 - Vault - None	3		41	1
2418	2015-11-05 18:46:34.892392-05	3284	FLAGGED! Ryan, Lochrie (L5) 955643 - Parallel Bars - None	3		41	1
2419	2015-11-05 18:46:34.89332-05	3285	FLAGGED! Ryan, Lochrie (L5) 955643 - High Bar - None	3		41	1
2420	2015-11-05 18:46:34.894208-05	3574	Walker, Brennan (L5) 622288 - Floor - None	3		41	1
2421	2015-11-05 18:46:34.895097-05	3575	Walker, Brennan (L5) 622288 - Rings - None	3		41	1
2422	2015-11-05 18:46:34.896016-05	3576	Walker, Brennan (L5) 622288 - Pommel Horse - None	3		41	1
2423	2015-11-05 18:46:34.896897-05	3577	Walker, Brennan (L5) 622288 - Vault - None	3		41	1
2424	2015-11-05 18:46:34.897784-05	3578	Walker, Brennan (L5) 622288 - Parallel Bars - None	3		41	1
2425	2015-11-05 18:46:34.898664-05	3579	Walker, Brennan (L5) 622288 - High Bar - None	3		41	1
2426	2015-11-05 18:46:34.899543-05	2032	Carter, Matt (L6) 622268 - Floor - None	3		41	1
2427	2015-11-05 18:46:34.900486-05	2033	Carter, Matt (L6) 622268 - Rings - None	3		41	1
2428	2015-11-05 18:46:34.901491-05	2034	Carter, Matt (L6) 622268 - Pommel Horse - None	3		41	1
2429	2015-11-05 18:46:34.902447-05	2035	Carter, Matt (L6) 622268 - Vault - None	3		41	1
2430	2015-11-05 18:46:34.903368-05	2036	Carter, Matt (L6) 622268 - Parallel Bars - None	3		41	1
2431	2015-11-05 18:46:34.904387-05	2037	Carter, Matt (L6) 622268 - High Bar - None	3		41	1
2432	2015-11-05 18:46:34.9053-05	2518	Harwood, Remy (L6) 942340 - Floor - None	3		41	1
2433	2015-11-05 18:46:34.906265-05	2519	Harwood, Remy (L6) 942340 - Rings - None	3		41	1
2434	2015-11-05 18:46:34.907185-05	2520	Harwood, Remy (L6) 942340 - Pommel Horse - None	3		41	1
2435	2015-11-05 18:46:34.908093-05	2521	Harwood, Remy (L6) 942340 - Vault - None	3		41	1
2436	2015-11-05 18:46:34.908998-05	2522	Harwood, Remy (L6) 942340 - Parallel Bars - None	3		41	1
2437	2015-11-05 18:46:34.909997-05	2523	Harwood, Remy (L6) 942340 - High Bar - None	3		41	1
2438	2015-11-05 18:46:34.910883-05	3022	Morrison, Caleb (L6) 622283 - Floor - None	3		41	1
2439	2015-11-05 18:46:34.911764-05	3023	Morrison, Caleb (L6) 622283 - Rings - None	3		41	1
2440	2015-11-05 18:46:34.912669-05	3024	Morrison, Caleb (L6) 622283 - Pommel Horse - None	3		41	1
2441	2015-11-05 18:46:34.913576-05	3025	Morrison, Caleb (L6) 622283 - Vault - None	3		41	1
2442	2015-11-05 18:46:34.914576-05	3026	Morrison, Caleb (L6) 622283 - Parallel Bars - None	3		41	1
2443	2015-11-05 18:46:34.91552-05	3027	Morrison, Caleb (L6) 622283 - High Bar - None	3		41	1
2444	2015-11-05 18:46:34.916456-05	3508	FLAGGED! Thurston , Jack (L6) 661303 - Floor - None	3		41	1
2445	2015-11-05 18:46:34.917415-05	3509	FLAGGED! Thurston , Jack (L6) 661303 - Rings - None	3		41	1
2446	2015-11-05 18:46:34.918412-05	3510	FLAGGED! Thurston , Jack (L6) 661303 - Pommel Horse - None	3		41	1
2447	2015-11-05 18:46:34.919289-05	3511	FLAGGED! Thurston , Jack (L6) 661303 - Vault - None	3		41	1
2448	2015-11-05 18:46:34.920245-05	3512	FLAGGED! Thurston , Jack (L6) 661303 - Parallel Bars - None	3		41	1
2449	2015-11-05 18:46:34.921194-05	3513	FLAGGED! Thurston , Jack (L6) 661303 - High Bar - None	3		41	1
2450	2015-11-05 18:46:34.922114-05	2416	Granados, Zachary (L7)  - Floor - None	3		41	1
2451	2015-11-05 18:46:34.922999-05	2417	Granados, Zachary (L7)  - Rings - None	3		41	1
2452	2015-11-05 18:46:34.923871-05	2418	Granados, Zachary (L7)  - Pommel Horse - None	3		41	1
2453	2015-11-05 18:46:34.924723-05	2419	Granados, Zachary (L7)  - Vault - None	3		41	1
2454	2015-11-05 18:46:34.925678-05	2420	Granados, Zachary (L7)  - Parallel Bars - None	3		41	1
2455	2015-11-05 18:46:34.926584-05	2421	Granados, Zachary (L7)  - High Bar - None	3		41	1
2456	2015-11-05 18:46:34.927492-05	2638	Isbell, Matvei (L7) 495813 - Floor - None	3		41	1
2457	2015-11-05 18:46:34.928453-05	2639	Isbell, Matvei (L7) 495813 - Rings - None	3		41	1
2458	2015-11-05 18:46:34.929355-05	2640	Isbell, Matvei (L7) 495813 - Pommel Horse - None	3		41	1
2459	2015-11-05 18:46:34.930286-05	2641	Isbell, Matvei (L7) 495813 - Vault - None	3		41	1
2460	2015-11-05 18:46:34.931178-05	2642	Isbell, Matvei (L7) 495813 - Parallel Bars - None	3		41	1
2461	2015-11-05 18:46:34.932068-05	2643	Isbell, Matvei (L7) 495813 - High Bar - None	3		41	1
2462	2015-11-05 18:46:34.932956-05	2848	Lippy, Elliot (L7) 627271 - Floor - None	3		41	1
2463	2015-11-05 18:46:34.933954-05	2849	Lippy, Elliot (L7) 627271 - Rings - None	3		41	1
2464	2015-11-05 18:46:34.934955-05	2850	Lippy, Elliot (L7) 627271 - Pommel Horse - None	3		41	1
2465	2015-11-05 18:46:34.936047-05	2851	Lippy, Elliot (L7) 627271 - Vault - None	3		41	1
2466	2015-11-05 18:46:34.936986-05	2852	Lippy, Elliot (L7) 627271 - Parallel Bars - None	3		41	1
2467	2015-11-05 18:46:34.937923-05	2853	Lippy, Elliot (L7) 627271 - High Bar - None	3		41	1
2468	2015-11-05 18:46:34.938842-05	2968	Melton, Caleb (L7)  - Floor - None	3		41	1
2469	2015-11-05 18:46:34.93979-05	2969	Melton, Caleb (L7)  - Rings - None	3		41	1
2979	2015-11-05 18:46:35.423957-05	2105	Cowan, Drew (L6) 614763 - Rings - None	3		41	1
2470	2015-11-05 18:46:34.940694-05	2970	Melton, Caleb (L7)  - Pommel Horse - None	3		41	1
2471	2015-11-05 18:46:34.941632-05	2971	Melton, Caleb (L7)  - Vault - None	3		41	1
2472	2015-11-05 18:46:34.942519-05	2972	Melton, Caleb (L7)  - Parallel Bars - None	3		41	1
2473	2015-11-05 18:46:34.943426-05	2973	Melton, Caleb (L7)  - High Bar - None	3		41	1
2474	2015-11-05 18:46:34.944316-05	3094	Noah, Simons (L7)  - Floor - None	3		41	1
2475	2015-11-05 18:46:34.945202-05	3095	Noah, Simons (L7)  - Rings - None	3		41	1
2476	2015-11-05 18:46:34.946178-05	3096	Noah, Simons (L7)  - Pommel Horse - None	3		41	1
2477	2015-11-05 18:46:34.947217-05	3097	Noah, Simons (L7)  - Vault - None	3		41	1
2478	2015-11-05 18:46:34.948102-05	3098	Noah, Simons (L7)  - Parallel Bars - None	3		41	1
2479	2015-11-05 18:46:34.949052-05	3099	Noah, Simons (L7)  - High Bar - None	3		41	1
2480	2015-11-05 18:46:34.949962-05	2398	Gomez, Jarel (L8)  - Floor - None	3		41	1
2481	2015-11-05 18:46:34.950813-05	2399	Gomez, Jarel (L8)  - Rings - None	3		41	1
2482	2015-11-05 18:46:34.951776-05	2400	Gomez, Jarel (L8)  - Pommel Horse - None	3		41	1
2483	2015-11-05 18:46:34.952731-05	2401	Gomez, Jarel (L8)  - Vault - None	3		41	1
2484	2015-11-05 18:46:34.953647-05	2402	Gomez, Jarel (L8)  - Parallel Bars - None	3		41	1
2485	2015-11-05 18:46:34.954554-05	2403	Gomez, Jarel (L8)  - High Bar - None	3		41	1
2486	2015-11-05 18:46:34.95546-05	3376	Shilling, Kyle (L8) 457824 - Floor - None	3		41	1
2487	2015-11-05 18:46:34.956387-05	3377	Shilling, Kyle (L8) 457824 - Rings - None	3		41	1
2488	2015-11-05 18:46:34.957423-05	3378	Shilling, Kyle (L8) 457824 - Pommel Horse - None	3		41	1
2489	2015-11-05 18:46:34.958435-05	3379	Shilling, Kyle (L8) 457824 - Vault - None	3		41	1
2490	2015-11-05 18:46:34.959467-05	3380	Shilling, Kyle (L8) 457824 - Parallel Bars - None	3		41	1
2491	2015-11-05 18:46:34.96044-05	3381	Shilling, Kyle (L8) 457824 - High Bar - None	3		41	1
2492	2015-11-05 18:46:34.961399-05	2380	Golden, Aaron (L9) 431070 - Floor - None	3		41	1
2493	2015-11-05 18:46:34.962341-05	2381	Golden, Aaron (L9) 431070 - Rings - None	3		41	1
2494	2015-11-05 18:46:34.963642-05	2382	Golden, Aaron (L9) 431070 - Pommel Horse - None	3		41	1
2495	2015-11-05 18:46:34.964725-05	2383	Golden, Aaron (L9) 431070 - Vault - None	3		41	1
2496	2015-11-05 18:46:34.965697-05	2384	Golden, Aaron (L9) 431070 - Parallel Bars - None	3		41	1
2497	2015-11-05 18:46:34.966695-05	2385	Golden, Aaron (L9) 431070 - High Bar - None	3		41	1
2498	2015-11-05 18:46:34.967643-05	2392	Golden, Samuel (L9) 431067 - Floor - None	3		41	1
2499	2015-11-05 18:46:34.968615-05	2393	Golden, Samuel (L9) 431067 - Rings - None	3		41	1
2500	2015-11-05 18:46:34.969625-05	2394	Golden, Samuel (L9) 431067 - Pommel Horse - None	3		41	1
2501	2015-11-05 18:46:34.97052-05	2395	Golden, Samuel (L9) 431067 - Vault - None	3		41	1
2502	2015-11-05 18:46:34.971456-05	2396	Golden, Samuel (L9) 431067 - Parallel Bars - None	3		41	1
2503	2015-11-05 18:46:34.972371-05	2397	Golden, Samuel (L9) 431067 - High Bar - None	3		41	1
2504	2015-11-05 18:46:34.97329-05	3004	Moore, Xavier (L9)  - Floor - None	3		41	1
2505	2015-11-05 18:46:34.974204-05	3005	Moore, Xavier (L9)  - Rings - None	3		41	1
2506	2015-11-05 18:46:34.975086-05	3006	Moore, Xavier (L9)  - Pommel Horse - None	3		41	1
2507	2015-11-05 18:46:34.976007-05	3007	Moore, Xavier (L9)  - Vault - None	3		41	1
2508	2015-11-05 18:46:34.976888-05	3008	Moore, Xavier (L9)  - Parallel Bars - None	3		41	1
2509	2015-11-05 18:46:34.978131-05	3009	Moore, Xavier (L9)  - High Bar - None	3		41	1
2510	2015-11-05 18:46:34.979049-05	3172	Policarpo, Joao (L9)  - Floor - None	3		41	1
2511	2015-11-05 18:46:34.980061-05	3173	Policarpo, Joao (L9)  - Rings - None	3		41	1
2512	2015-11-05 18:46:34.980936-05	3174	Policarpo, Joao (L9)  - Pommel Horse - None	3		41	1
2513	2015-11-05 18:46:34.982168-05	3175	Policarpo, Joao (L9)  - Vault - None	3		41	1
2514	2015-11-05 18:46:34.983065-05	3176	Policarpo, Joao (L9)  - Parallel Bars - None	3		41	1
2515	2015-11-05 18:46:34.98396-05	3177	Policarpo, Joao (L9)  - High Bar - None	3		41	1
2516	2015-11-05 18:46:34.98489-05	3412	Sipes, Owen (L9)  - Floor - None	3		41	1
2517	2015-11-05 18:46:34.985911-05	3413	Sipes, Owen (L9)  - Rings - None	3		41	1
2518	2015-11-05 18:46:34.986824-05	3414	Sipes, Owen (L9)  - Pommel Horse - None	3		41	1
2519	2015-11-05 18:46:34.98772-05	3415	Sipes, Owen (L9)  - Vault - None	3		41	1
2520	2015-11-05 18:46:34.988613-05	3416	Sipes, Owen (L9)  - Parallel Bars - None	3		41	1
2521	2015-11-05 18:46:34.989503-05	3417	Sipes, Owen (L9)  - High Bar - None	3		41	1
2522	2015-11-05 18:46:34.99072-05	3622	Woodard, Tyrus (L9)  - Floor - None	3		41	1
2523	2015-11-05 18:46:34.991819-05	3623	Woodard, Tyrus (L9)  - Rings - None	3		41	1
2524	2015-11-05 18:46:34.99276-05	3624	Woodard, Tyrus (L9)  - Pommel Horse - None	3		41	1
2525	2015-11-05 18:46:34.99374-05	3625	Woodard, Tyrus (L9)  - Vault - None	3		41	1
2526	2015-11-05 18:46:34.994686-05	3626	Woodard, Tyrus (L9)  - Parallel Bars - None	3		41	1
2527	2015-11-05 18:46:34.995629-05	3627	Woodard, Tyrus (L9)  - High Bar - None	3		41	1
2528	2015-11-05 18:46:34.996596-05	2452	Griffin, Solomon (L10) 427885 - Floor - None	3		41	1
2529	2015-11-05 18:46:34.997538-05	2453	Griffin, Solomon (L10) 427885 - Rings - None	3		41	1
2530	2015-11-05 18:46:34.998505-05	2454	Griffin, Solomon (L10) 427885 - Pommel Horse - None	3		41	1
2531	2015-11-05 18:46:34.999424-05	2455	Griffin, Solomon (L10) 427885 - Vault - None	3		41	1
2532	2015-11-05 18:46:35.000346-05	2456	Griffin, Solomon (L10) 427885 - Parallel Bars - None	3		41	1
2533	2015-11-05 18:46:35.001295-05	2457	Griffin, Solomon (L10) 427885 - High Bar - None	3		41	1
2534	2015-11-05 18:46:35.002182-05	2596	Holloway, Ryan (L10) 297601 - Floor - None	3		41	1
2535	2015-11-05 18:46:35.003099-05	2597	Holloway, Ryan (L10) 297601 - Rings - None	3		41	1
2536	2015-11-05 18:46:35.004047-05	2598	Holloway, Ryan (L10) 297601 - Pommel Horse - None	3		41	1
2537	2015-11-05 18:46:35.004945-05	2599	Holloway, Ryan (L10) 297601 - Vault - None	3		41	1
2538	2015-11-05 18:46:35.005826-05	2600	Holloway, Ryan (L10) 297601 - Parallel Bars - None	3		41	1
2539	2015-11-05 18:46:35.006938-05	2601	Holloway, Ryan (L10) 297601 - High Bar - None	3		41	1
2540	2015-11-05 18:46:35.008098-05	2692	Kasiski, Garrett (L10) 420868 - Floor - None	3		41	1
2541	2015-11-05 18:46:35.009077-05	2693	Kasiski, Garrett (L10) 420868 - Rings - None	3		41	1
2542	2015-11-05 18:46:35.010086-05	2694	Kasiski, Garrett (L10) 420868 - Pommel Horse - None	3		41	1
2543	2015-11-05 18:46:35.01124-05	2695	Kasiski, Garrett (L10) 420868 - Vault - None	3		41	1
2544	2015-11-05 18:46:35.012585-05	2696	Kasiski, Garrett (L10) 420868 - Parallel Bars - None	3		41	1
2545	2015-11-05 18:46:35.013557-05	2697	Kasiski, Garrett (L10) 420868 - High Bar - None	3		41	1
2546	2015-11-05 18:46:35.014475-05	2770	Ladner, Joey (L10) 389053 - Floor - None	3		41	1
2547	2015-11-05 18:46:35.015443-05	2771	Ladner, Joey (L10) 389053 - Rings - None	3		41	1
2548	2015-11-05 18:46:35.01638-05	2772	Ladner, Joey (L10) 389053 - Pommel Horse - None	3		41	1
2549	2015-11-05 18:46:35.017282-05	2773	Ladner, Joey (L10) 389053 - Vault - None	3		41	1
2550	2015-11-05 18:46:35.018263-05	2774	Ladner, Joey (L10) 389053 - Parallel Bars - None	3		41	1
2551	2015-11-05 18:46:35.019293-05	2775	Ladner, Joey (L10) 389053 - High Bar - None	3		41	1
2552	2015-11-05 18:46:35.020326-05	2950	McCord, Chris (L10) 205892 - Floor - None	3		41	1
2553	2015-11-05 18:46:35.021274-05	2951	McCord, Chris (L10) 205892 - Rings - None	3		41	1
2554	2015-11-05 18:46:35.022204-05	2952	McCord, Chris (L10) 205892 - Pommel Horse - None	3		41	1
2555	2015-11-05 18:46:35.023133-05	2953	McCord, Chris (L10) 205892 - Vault - None	3		41	1
2556	2015-11-05 18:46:35.024165-05	2954	McCord, Chris (L10) 205892 - Parallel Bars - None	3		41	1
2557	2015-11-05 18:46:35.025162-05	2955	McCord, Chris (L10) 205892 - High Bar - None	3		41	1
2558	2015-11-05 18:46:35.026145-05	3118	Palacios, Isaac (L10) 438122 - Floor - None	3		41	1
2559	2015-11-05 18:46:35.027071-05	3119	Palacios, Isaac (L10) 438122 - Rings - None	3		41	1
2560	2015-11-05 18:46:35.027993-05	3120	Palacios, Isaac (L10) 438122 - Pommel Horse - None	3		41	1
2561	2015-11-05 18:46:35.028975-05	3121	Palacios, Isaac (L10) 438122 - Vault - None	3		41	1
2562	2015-11-05 18:46:35.029866-05	3122	Palacios, Isaac (L10) 438122 - Parallel Bars - None	3		41	1
2563	2015-11-05 18:46:35.030749-05	3123	Palacios, Isaac (L10) 438122 - High Bar - None	3		41	1
2564	2015-11-05 18:46:35.031683-05	2884	FLAGGED! Maletzky, Jeremy (L5) 958086 - Floor - None	3		41	1
2565	2015-11-05 18:46:35.032597-05	2885	FLAGGED! Maletzky, Jeremy (L5) 958086 - Rings - None	3		41	1
2566	2015-11-05 18:46:35.033484-05	2886	FLAGGED! Maletzky, Jeremy (L5) 958086 - Pommel Horse - None	3		41	1
2567	2015-11-05 18:46:35.034436-05	2887	FLAGGED! Maletzky, Jeremy (L5) 958086 - Vault - None	3		41	1
2568	2015-11-05 18:46:35.035467-05	2888	FLAGGED! Maletzky, Jeremy (L5) 958086 - Parallel Bars - None	3		41	1
2569	2015-11-05 18:46:35.036443-05	2889	FLAGGED! Maletzky, Jeremy (L5) 958086 - High Bar - None	3		41	1
2570	2015-11-05 18:46:35.037378-05	2698	Kaus, Ryan (L5) 577616 - Floor - None	3		41	1
2571	2015-11-05 18:46:35.038339-05	2699	Kaus, Ryan (L5) 577616 - Rings - None	3		41	1
2572	2015-11-05 18:46:35.039281-05	2700	Kaus, Ryan (L5) 577616 - Pommel Horse - None	3		41	1
2573	2015-11-05 18:46:35.040237-05	2701	Kaus, Ryan (L5) 577616 - Vault - None	3		41	1
2574	2015-11-05 18:46:35.041167-05	2702	Kaus, Ryan (L5) 577616 - Parallel Bars - None	3		41	1
2575	2015-11-05 18:46:35.042162-05	2703	Kaus, Ryan (L5) 577616 - High Bar - None	3		41	1
2576	2015-11-05 18:46:35.043131-05	2674	FLAGGED! Joseph, Schneider (L5) 571338 - Floor - None	3		41	1
2577	2015-11-05 18:46:35.044069-05	2675	FLAGGED! Joseph, Schneider (L5) 571338 - Rings - None	3		41	1
2578	2015-11-05 18:46:35.045005-05	2676	FLAGGED! Joseph, Schneider (L5) 571338 - Pommel Horse - None	3		41	1
2579	2015-11-05 18:46:35.045937-05	2677	FLAGGED! Joseph, Schneider (L5) 571338 - Vault - None	3		41	1
2580	2015-11-05 18:46:35.046855-05	2678	FLAGGED! Joseph, Schneider (L5) 571338 - Parallel Bars - None	3		41	1
2581	2015-11-05 18:46:35.047748-05	2679	FLAGGED! Joseph, Schneider (L5) 571338 - High Bar - None	3		41	1
2582	2015-11-05 18:46:35.048635-05	2188	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Floor - None	3		41	1
2583	2015-11-05 18:46:35.049546-05	2189	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Rings - None	3		41	1
2584	2015-11-05 18:46:35.050507-05	2190	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Pommel Horse - None	3		41	1
2585	2015-11-05 18:46:35.05148-05	2191	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Vault - None	3		41	1
2586	2015-11-05 18:46:35.052609-05	2192	FLAGGED! Dhayagude, Nikhil (L8) 571419 - Parallel Bars - None	3		41	1
2587	2015-11-05 18:46:35.053576-05	2193	FLAGGED! Dhayagude, Nikhil (L8) 571419 - High Bar - None	3		41	1
2588	2015-11-05 18:46:35.05449-05	2590	Hoberman, Benjamin (L5) 574047 - Floor - None	3		41	1
2589	2015-11-05 18:46:35.055404-05	2591	Hoberman, Benjamin (L5) 574047 - Rings - None	3		41	1
2590	2015-11-05 18:46:35.056446-05	2592	Hoberman, Benjamin (L5) 574047 - Pommel Horse - None	3		41	1
2591	2015-11-05 18:46:35.057402-05	2593	Hoberman, Benjamin (L5) 574047 - Vault - None	3		41	1
2592	2015-11-05 18:46:35.05833-05	2594	Hoberman, Benjamin (L5) 574047 - Parallel Bars - None	3		41	1
2593	2015-11-05 18:46:35.059245-05	2595	Hoberman, Benjamin (L5) 574047 - High Bar - None	3		41	1
2594	2015-11-05 18:46:35.060149-05	1840	Aksu, Aslan (L5) 629300 - Floor - None	3		41	1
2595	2015-11-05 18:46:35.061041-05	1841	Aksu, Aslan (L5) 629300 - Rings - None	3		41	1
2596	2015-11-05 18:46:35.06236-05	1842	Aksu, Aslan (L5) 629300 - Pommel Horse - None	3		41	1
2597	2015-11-05 18:46:35.063704-05	1843	Aksu, Aslan (L5) 629300 - Vault - None	3		41	1
2598	2015-11-05 18:46:35.064721-05	1844	Aksu, Aslan (L5) 629300 - Parallel Bars - None	3		41	1
2599	2015-11-05 18:46:35.065672-05	1845	Aksu, Aslan (L5) 629300 - High Bar - None	3		41	1
2600	2015-11-05 18:46:35.066642-05	3304	Samuel, Issac (L5) 577619 - Floor - None	3		41	1
2601	2015-11-05 18:46:35.067615-05	3305	Samuel, Issac (L5) 577619 - Rings - None	3		41	1
2602	2015-11-05 18:46:35.068563-05	3306	Samuel, Issac (L5) 577619 - Pommel Horse - None	3		41	1
2603	2015-11-05 18:46:35.069474-05	3307	Samuel, Issac (L5) 577619 - Vault - None	3		41	1
2604	2015-11-05 18:46:35.070383-05	3308	Samuel, Issac (L5) 577619 - Parallel Bars - None	3		41	1
2605	2015-11-05 18:46:35.071285-05	3309	Samuel, Issac (L5) 577619 - High Bar - None	3		41	1
2606	2015-11-05 18:46:35.072177-05	2800	Lee, Sullivan (L6) 571413 - Floor - None	3		41	1
2607	2015-11-05 18:46:35.073173-05	2801	Lee, Sullivan (L6) 571413 - Rings - None	3		41	1
2608	2015-11-05 18:46:35.074417-05	2802	Lee, Sullivan (L6) 571413 - Pommel Horse - None	3		41	1
2609	2015-11-05 18:46:35.075292-05	2803	Lee, Sullivan (L6) 571413 - Vault - None	3		41	1
2610	2015-11-05 18:46:35.076238-05	2804	Lee, Sullivan (L6) 571413 - Parallel Bars - None	3		41	1
2611	2015-11-05 18:46:35.077172-05	2805	Lee, Sullivan (L6) 571413 - High Bar - None	3		41	1
2612	2015-11-05 18:46:35.078099-05	2896	Marchenko, Vlad (L6) 968415 - Floor - None	3		41	1
2613	2015-11-05 18:46:35.079032-05	2897	Marchenko, Vlad (L6) 968415 - Rings - None	3		41	1
2614	2015-11-05 18:46:35.079976-05	2898	Marchenko, Vlad (L6) 968415 - Pommel Horse - None	3		41	1
2615	2015-11-05 18:46:35.080883-05	2899	Marchenko, Vlad (L6) 968415 - Vault - None	3		41	1
2616	2015-11-05 18:46:35.08184-05	2900	Marchenko, Vlad (L6) 968415 - Parallel Bars - None	3		41	1
2617	2015-11-05 18:46:35.082727-05	2901	Marchenko, Vlad (L6) 968415 - High Bar - None	3		41	1
2618	2015-11-05 18:46:35.083635-05	2740	Kraft, Colin (L6) 509832 - Floor - None	3		41	1
2619	2015-11-05 18:46:35.084856-05	2741	Kraft, Colin (L6) 509832 - Rings - None	3		41	1
2620	2015-11-05 18:46:35.086089-05	2742	Kraft, Colin (L6) 509832 - Pommel Horse - None	3		41	1
2621	2015-11-05 18:46:35.087189-05	2743	Kraft, Colin (L6) 509832 - Vault - None	3		41	1
2622	2015-11-05 18:46:35.088204-05	2744	Kraft, Colin (L6) 509832 - Parallel Bars - None	3		41	1
2623	2015-11-05 18:46:35.089141-05	2745	Kraft, Colin (L6) 509832 - High Bar - None	3		41	1
2624	2015-11-05 18:46:35.090154-05	3490	FLAGGED! Thackston, Parker (L8) 471446 - Floor - None	3		41	1
2625	2015-11-05 18:46:35.091114-05	3491	FLAGGED! Thackston, Parker (L8) 471446 - Rings - None	3		41	1
2626	2015-11-05 18:46:35.092025-05	3492	FLAGGED! Thackston, Parker (L8) 471446 - Pommel Horse - None	3		41	1
2627	2015-11-05 18:46:35.092951-05	3493	FLAGGED! Thackston, Parker (L8) 471446 - Vault - None	3		41	1
2628	2015-11-05 18:46:35.09385-05	3494	FLAGGED! Thackston, Parker (L8) 471446 - Parallel Bars - None	3		41	1
2629	2015-11-05 18:46:35.095008-05	3495	FLAGGED! Thackston, Parker (L8) 471446 - High Bar - None	3		41	1
2630	2015-11-05 18:46:35.096179-05	2278	Feltquate, Jakob (L8) 509427 - Floor - None	3		41	1
2631	2015-11-05 18:46:35.097168-05	2279	Feltquate, Jakob (L8) 509427 - Rings - None	3		41	1
2632	2015-11-05 18:46:35.098095-05	2280	Feltquate, Jakob (L8) 509427 - Pommel Horse - None	3		41	1
2633	2015-11-05 18:46:35.099083-05	2281	Feltquate, Jakob (L8) 509427 - Vault - None	3		41	1
2634	2015-11-05 18:46:35.100001-05	2282	Feltquate, Jakob (L8) 509427 - Parallel Bars - None	3		41	1
2635	2015-11-05 18:46:35.100951-05	2283	Feltquate, Jakob (L8) 509427 - High Bar - None	3		41	1
2636	2015-11-05 18:46:35.10189-05	3436	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Floor - None	3		41	1
2637	2015-11-05 18:46:35.102839-05	3437	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Rings - None	3		41	1
2638	2015-11-05 18:46:35.103764-05	3438	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Pommel Horse - None	3		41	1
2639	2015-11-05 18:46:35.104701-05	3439	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Vault - None	3		41	1
2640	2015-11-05 18:46:35.105652-05	3440	FLAGGED! Spagnoletti, P.J. (L9) 537029 - Parallel Bars - None	3		41	1
2641	2015-11-05 18:46:35.106542-05	3441	FLAGGED! Spagnoletti, P.J. (L9) 537029 - High Bar - None	3		41	1
2642	2015-11-05 18:46:35.107436-05	3544	FLAGGED! Vaughn, Dylan (L9) 440614 - Floor - None	3		41	1
2643	2015-11-05 18:46:35.10832-05	3545	FLAGGED! Vaughn, Dylan (L9) 440614 - Rings - None	3		41	1
2644	2015-11-05 18:46:35.109308-05	3546	FLAGGED! Vaughn, Dylan (L9) 440614 - Pommel Horse - None	3		41	1
2645	2015-11-05 18:46:35.110265-05	3547	FLAGGED! Vaughn, Dylan (L9) 440614 - Vault - None	3		41	1
2646	2015-11-05 18:46:35.111123-05	3548	FLAGGED! Vaughn, Dylan (L9) 440614 - Parallel Bars - None	3		41	1
2647	2015-11-05 18:46:35.112002-05	3549	FLAGGED! Vaughn, Dylan (L9) 440614 - High Bar - None	3		41	1
2648	2015-11-05 18:46:35.112923-05	3424	FLAGGED! Smith, Brendan (L10) 523711 - Floor - None	3		41	1
2649	2015-11-05 18:46:35.11383-05	3425	FLAGGED! Smith, Brendan (L10) 523711 - Rings - None	3		41	1
2650	2015-11-05 18:46:35.114729-05	3426	FLAGGED! Smith, Brendan (L10) 523711 - Pommel Horse - None	3		41	1
2651	2015-11-05 18:46:35.115677-05	3427	FLAGGED! Smith, Brendan (L10) 523711 - Vault - None	3		41	1
2652	2015-11-05 18:46:35.116593-05	3428	FLAGGED! Smith, Brendan (L10) 523711 - Parallel Bars - None	3		41	1
2653	2015-11-05 18:46:35.11752-05	3429	FLAGGED! Smith, Brendan (L10) 523711 - High Bar - None	3		41	1
2654	2015-11-05 18:46:35.118428-05	3124	Patrizio, Harrison (L10) 212820 - Floor - None	3		41	1
2655	2015-11-05 18:46:35.119325-05	3125	Patrizio, Harrison (L10) 212820 - Rings - None	3		41	1
2656	2015-11-05 18:46:35.120219-05	3126	Patrizio, Harrison (L10) 212820 - Pommel Horse - None	3		41	1
2657	2015-11-05 18:46:35.121097-05	3127	Patrizio, Harrison (L10) 212820 - Vault - None	3		41	1
2658	2015-11-05 18:46:35.121975-05	3128	Patrizio, Harrison (L10) 212820 - Parallel Bars - None	3		41	1
2659	2015-11-05 18:46:35.122884-05	3129	Patrizio, Harrison (L10) 212820 - High Bar - None	3		41	1
2660	2015-11-05 18:46:35.123802-05	2140	Damanti, Joey (L5) 956183 - Floor - None	3		41	1
2661	2015-11-05 18:46:35.124675-05	2141	Damanti, Joey (L5) 956183 - Rings - None	3		41	1
2662	2015-11-05 18:46:35.125551-05	2142	Damanti, Joey (L5) 956183 - Pommel Horse - None	3		41	1
2663	2015-11-05 18:46:35.126426-05	2143	Damanti, Joey (L5) 956183 - Vault - None	3		41	1
2664	2015-11-05 18:46:35.127413-05	2144	Damanti, Joey (L5) 956183 - Parallel Bars - None	3		41	1
2665	2015-11-05 18:46:35.128553-05	2145	Damanti, Joey (L5) 956183 - High Bar - None	3		41	1
2666	2015-11-05 18:46:35.129686-05	3430	Sobusiak, Kevin (L5) 956182 - Floor - None	3		41	1
2667	2015-11-05 18:46:35.130681-05	3431	Sobusiak, Kevin (L5) 956182 - Rings - None	3		41	1
2668	2015-11-05 18:46:35.131581-05	3432	Sobusiak, Kevin (L5) 956182 - Pommel Horse - None	3		41	1
2669	2015-11-05 18:46:35.132642-05	3433	Sobusiak, Kevin (L5) 956182 - Vault - None	3		41	1
2670	2015-11-05 18:46:35.133538-05	3434	Sobusiak, Kevin (L5) 956182 - Parallel Bars - None	3		41	1
2671	2015-11-05 18:46:35.134453-05	3435	Sobusiak, Kevin (L5) 956182 - High Bar - None	3		41	1
2672	2015-11-05 18:46:35.135429-05	2236	FLAGGED! Esberg, Adin (L6) 626828 - Floor - None	3		41	1
2673	2015-11-05 18:46:35.136466-05	2237	FLAGGED! Esberg, Adin (L6) 626828 - Rings - None	3		41	1
2674	2015-11-05 18:46:35.137455-05	2238	FLAGGED! Esberg, Adin (L6) 626828 - Pommel Horse - None	3		41	1
2675	2015-11-05 18:46:35.138439-05	2239	FLAGGED! Esberg, Adin (L6) 626828 - Vault - None	3		41	1
2676	2015-11-05 18:46:35.139347-05	2240	FLAGGED! Esberg, Adin (L6) 626828 - Parallel Bars - None	3		41	1
2677	2015-11-05 18:46:35.140251-05	2241	FLAGGED! Esberg, Adin (L6) 626828 - High Bar - None	3		41	1
2678	2015-11-05 18:46:35.141165-05	3160	Phillipps, Josh (L6) 629454 - Floor - None	3		41	1
2679	2015-11-05 18:46:35.142066-05	3161	Phillipps, Josh (L6) 629454 - Rings - None	3		41	1
2680	2015-11-05 18:46:35.143-05	3162	Phillipps, Josh (L6) 629454 - Pommel Horse - None	3		41	1
2681	2015-11-05 18:46:35.144024-05	3163	Phillipps, Josh (L6) 629454 - Vault - None	3		41	1
2682	2015-11-05 18:46:35.144955-05	3164	Phillipps, Josh (L6) 629454 - Parallel Bars - None	3		41	1
2683	2015-11-05 18:46:35.145904-05	3165	Phillipps, Josh (L6) 629454 - High Bar - None	3		41	1
2684	2015-11-05 18:46:35.146813-05	2242	Evans, Caleb (L9) 468234 - Floor - None	3		41	1
2685	2015-11-05 18:46:35.147744-05	2243	Evans, Caleb (L9) 468234 - Rings - None	3		41	1
2686	2015-11-05 18:46:35.148657-05	2244	Evans, Caleb (L9) 468234 - Pommel Horse - None	3		41	1
2687	2015-11-05 18:46:35.149575-05	2245	Evans, Caleb (L9) 468234 - Vault - None	3		41	1
2688	2015-11-05 18:46:35.150469-05	2246	Evans, Caleb (L9) 468234 - Parallel Bars - None	3		41	1
2689	2015-11-05 18:46:35.151417-05	2247	Evans, Caleb (L9) 468234 - High Bar - None	3		41	1
2690	2015-11-05 18:46:35.152397-05	1852	FLAGGED! Altwater, Antony (L5) 959356 - Floor - None	3		41	1
2691	2015-11-05 18:46:35.153343-05	1853	FLAGGED! Altwater, Antony (L5) 959356 - Rings - None	3		41	1
2692	2015-11-05 18:46:35.154269-05	1854	FLAGGED! Altwater, Antony (L5) 959356 - Pommel Horse - None	3		41	1
2693	2015-11-05 18:46:35.15522-05	1855	FLAGGED! Altwater, Antony (L5) 959356 - Vault - None	3		41	1
2694	2015-11-05 18:46:35.156245-05	1856	FLAGGED! Altwater, Antony (L5) 959356 - Parallel Bars - None	3		41	1
2695	2015-11-05 18:46:35.157212-05	1857	FLAGGED! Altwater, Antony (L5) 959356 - High Bar - None	3		41	1
2696	2015-11-05 18:46:35.158211-05	2134	Dahllof, Caleb (L4) 959353 - Floor - None	3		41	1
2697	2015-11-05 18:46:35.159168-05	2135	Dahllof, Caleb (L4) 959353 - Rings - None	3		41	1
2698	2015-11-05 18:46:35.160194-05	2136	Dahllof, Caleb (L4) 959353 - Pommel Horse - None	3		41	1
2699	2015-11-05 18:46:35.16115-05	2137	Dahllof, Caleb (L4) 959353 - Vault - None	3		41	1
2700	2015-11-05 18:46:35.162073-05	2138	Dahllof, Caleb (L4) 959353 - Parallel Bars - None	3		41	1
2701	2015-11-05 18:46:35.162989-05	2139	Dahllof, Caleb (L4) 959353 - High Bar - None	3		41	1
2702	2015-11-05 18:46:35.163904-05	2248	Fabian, Owen (L4) 959359 - Floor - None	3		41	1
2703	2015-11-05 18:46:35.164809-05	2249	Fabian, Owen (L4) 959359 - Rings - None	3		41	1
2704	2015-11-05 18:46:35.165755-05	2250	Fabian, Owen (L4) 959359 - Pommel Horse - None	3		41	1
2705	2015-11-05 18:46:35.166797-05	2251	Fabian, Owen (L4) 959359 - Vault - None	3		41	1
2706	2015-11-05 18:46:35.167693-05	2252	Fabian, Owen (L4) 959359 - Parallel Bars - None	3		41	1
2707	2015-11-05 18:46:35.168688-05	2253	Fabian, Owen (L4) 959359 - High Bar - None	3		41	1
2708	2015-11-05 18:46:35.169709-05	2986	FLAGGED! Miller, Solomon (L4) 959355 - Floor - None	3		41	1
2709	2015-11-05 18:46:35.170681-05	2987	FLAGGED! Miller, Solomon (L4) 959355 - Rings - None	3		41	1
2710	2015-11-05 18:46:35.171634-05	2988	FLAGGED! Miller, Solomon (L4) 959355 - Pommel Horse - None	3		41	1
2711	2015-11-05 18:46:35.172551-05	2989	FLAGGED! Miller, Solomon (L4) 959355 - Vault - None	3		41	1
2712	2015-11-05 18:46:35.173476-05	2990	FLAGGED! Miller, Solomon (L4) 959355 - Parallel Bars - None	3		41	1
2713	2015-11-05 18:46:35.174379-05	2991	FLAGGED! Miller, Solomon (L4) 959355 - High Bar - None	3		41	1
2714	2015-11-05 18:46:35.175287-05	3214	Robell, Peter (L5) 959357 - Floor - None	3		41	1
2715	2015-11-05 18:46:35.176171-05	3215	Robell, Peter (L5) 959357 - Rings - None	3		41	1
2716	2015-11-05 18:46:35.177051-05	3216	Robell, Peter (L5) 959357 - Pommel Horse - None	3		41	1
2717	2015-11-05 18:46:35.177933-05	3217	Robell, Peter (L5) 959357 - Vault - None	3		41	1
2718	2015-11-05 18:46:35.178823-05	3218	Robell, Peter (L5) 959357 - Parallel Bars - None	3		41	1
2719	2015-11-05 18:46:35.17977-05	3219	Robell, Peter (L5) 959357 - High Bar - None	3		41	1
2720	2015-11-05 18:46:35.180733-05	2092	Colin, Nate (L4) 1011424 - Floor - None	3		41	1
2721	2015-11-05 18:46:35.18162-05	2093	Colin, Nate (L4) 1011424 - Rings - None	3		41	1
2722	2015-11-05 18:46:35.182498-05	2094	Colin, Nate (L4) 1011424 - Pommel Horse - None	3		41	1
2723	2015-11-05 18:46:35.183381-05	2095	Colin, Nate (L4) 1011424 - Vault - None	3		41	1
2724	2015-11-05 18:46:35.184258-05	2096	Colin, Nate (L4) 1011424 - Parallel Bars - None	3		41	1
2725	2015-11-05 18:46:35.185245-05	2097	Colin, Nate (L4) 1011424 - High Bar - None	3		41	1
2726	2015-11-05 18:46:35.186133-05	2872	Magness, Charles (L4) 1011466 - Floor - None	3		41	1
2727	2015-11-05 18:46:35.187009-05	2873	Magness, Charles (L4) 1011466 - Rings - None	3		41	1
2728	2015-11-05 18:46:35.187935-05	2874	Magness, Charles (L4) 1011466 - Pommel Horse - None	3		41	1
2729	2015-11-05 18:46:35.188818-05	2875	Magness, Charles (L4) 1011466 - Vault - None	3		41	1
2730	2015-11-05 18:46:35.189701-05	2876	Magness, Charles (L4) 1011466 - Parallel Bars - None	3		41	1
2731	2015-11-05 18:46:35.190579-05	2877	Magness, Charles (L4) 1011466 - High Bar - None	3		41	1
2732	2015-11-05 18:46:35.191491-05	3178	Portaro, Marc (L4) 1011470 - Floor - None	3		41	1
2733	2015-11-05 18:46:35.192498-05	3179	Portaro, Marc (L4) 1011470 - Rings - None	3		41	1
2734	2015-11-05 18:46:35.193416-05	3180	Portaro, Marc (L4) 1011470 - Pommel Horse - None	3		41	1
2735	2015-11-05 18:46:35.19429-05	3181	Portaro, Marc (L4) 1011470 - Vault - None	3		41	1
2736	2015-11-05 18:46:35.195189-05	3182	Portaro, Marc (L4) 1011470 - Parallel Bars - None	3		41	1
2737	2015-11-05 18:46:35.196145-05	3183	Portaro, Marc (L4) 1011470 - High Bar - None	3		41	1
2738	2015-11-05 18:46:35.197029-05	3586	Watkins, Tristan (L4) 1011493 - Floor - None	3		41	1
2739	2015-11-05 18:46:35.197907-05	3587	Watkins, Tristan (L4) 1011493 - Rings - None	3		41	1
2740	2015-11-05 18:46:35.198828-05	3588	Watkins, Tristan (L4) 1011493 - Pommel Horse - None	3		41	1
2741	2015-11-05 18:46:35.199711-05	3589	Watkins, Tristan (L4) 1011493 - Vault - None	3		41	1
2742	2015-11-05 18:46:35.200679-05	3590	Watkins, Tristan (L4) 1011493 - Parallel Bars - None	3		41	1
2743	2015-11-05 18:46:35.201668-05	3591	Watkins, Tristan (L4) 1011493 - High Bar - None	3		41	1
2744	2015-11-05 18:46:35.202692-05	3610	Willis, Brent (L5) 1011494 - Floor - None	3		41	1
2745	2015-11-05 18:46:35.203633-05	3611	Willis, Brent (L5) 1011494 - Rings - None	3		41	1
2746	2015-11-05 18:46:35.204499-05	3612	Willis, Brent (L5) 1011494 - Pommel Horse - None	3		41	1
2747	2015-11-05 18:46:35.205437-05	3613	Willis, Brent (L5) 1011494 - Vault - None	3		41	1
2748	2015-11-05 18:46:35.20635-05	3614	Willis, Brent (L5) 1011494 - Parallel Bars - None	3		41	1
2749	2015-11-05 18:46:35.207294-05	3615	Willis, Brent (L5) 1011494 - High Bar - None	3		41	1
2750	2015-11-05 18:46:35.208216-05	2704	Keefer, Gavin (L5) 974232 - Floor - None	3		41	1
2751	2015-11-05 18:46:35.209128-05	2705	Keefer, Gavin (L5) 974232 - Rings - None	3		41	1
2752	2015-11-05 18:46:35.210098-05	2706	Keefer, Gavin (L5) 974232 - Pommel Horse - None	3		41	1
2753	2015-11-05 18:46:35.211005-05	2707	Keefer, Gavin (L5) 974232 - Vault - None	3		41	1
2754	2015-11-05 18:46:35.21193-05	2708	Keefer, Gavin (L5) 974232 - Parallel Bars - None	3		41	1
2755	2015-11-05 18:46:35.212869-05	2709	Keefer, Gavin (L5) 974232 - High Bar - None	3		41	1
2756	2015-11-05 18:46:35.213758-05	2956	FLAGGED! McCready, Brandon (L5) 967055 - Floor - None	3		41	1
2757	2015-11-05 18:46:35.214656-05	2957	FLAGGED! McCready, Brandon (L5) 967055 - Rings - None	3		41	1
2758	2015-11-05 18:46:35.215671-05	2958	FLAGGED! McCready, Brandon (L5) 967055 - Pommel Horse - None	3		41	1
2759	2015-11-05 18:46:35.216579-05	2959	FLAGGED! McCready, Brandon (L5) 967055 - Vault - None	3		41	1
2760	2015-11-05 18:46:35.21748-05	2960	FLAGGED! McCready, Brandon (L5) 967055 - Parallel Bars - None	3		41	1
2761	2015-11-05 18:46:35.218587-05	2961	FLAGGED! McCready, Brandon (L5) 967055 - High Bar - None	3		41	1
2762	2015-11-05 18:46:35.219529-05	2632	FLAGGED! Irons, Isaiah (L6) 643614 - Floor - None	3		41	1
2763	2015-11-05 18:46:35.220434-05	2633	FLAGGED! Irons, Isaiah (L6) 643614 - Rings - None	3		41	1
2764	2015-11-05 18:46:35.22133-05	2634	FLAGGED! Irons, Isaiah (L6) 643614 - Pommel Horse - None	3		41	1
2765	2015-11-05 18:46:35.222233-05	2635	FLAGGED! Irons, Isaiah (L6) 643614 - Vault - None	3		41	1
2766	2015-11-05 18:46:35.22311-05	2636	FLAGGED! Irons, Isaiah (L6) 643614 - Parallel Bars - None	3		41	1
2767	2015-11-05 18:46:35.224144-05	2637	FLAGGED! Irons, Isaiah (L6) 643614 - High Bar - None	3		41	1
2768	2015-11-05 18:46:35.225027-05	1846	FLAGGED! Allen, Evan (L6) 643620 - Floor - None	3		41	1
2769	2015-11-05 18:46:35.225955-05	1847	FLAGGED! Allen, Evan (L6) 643620 - Rings - None	3		41	1
2770	2015-11-05 18:46:35.226833-05	1848	FLAGGED! Allen, Evan (L6) 643620 - Pommel Horse - None	3		41	1
2771	2015-11-05 18:46:35.227794-05	1849	FLAGGED! Allen, Evan (L6) 643620 - Vault - None	3		41	1
2772	2015-11-05 18:46:35.228674-05	1850	FLAGGED! Allen, Evan (L6) 643620 - Parallel Bars - None	3		41	1
2773	2015-11-05 18:46:35.229638-05	1851	FLAGGED! Allen, Evan (L6) 643620 - High Bar - None	3		41	1
2774	2015-11-05 18:46:35.23052-05	2728	Kirvan, Michael (L6) 579620 - Floor - None	3		41	1
2775	2015-11-05 18:46:35.231399-05	2729	Kirvan, Michael (L6) 579620 - Rings - None	3		41	1
2776	2015-11-05 18:46:35.232295-05	2730	Kirvan, Michael (L6) 579620 - Pommel Horse - None	3		41	1
2777	2015-11-05 18:46:35.233207-05	2731	Kirvan, Michael (L6) 579620 - Vault - None	3		41	1
2778	2015-11-05 18:46:35.234081-05	2732	Kirvan, Michael (L6) 579620 - Parallel Bars - None	3		41	1
2779	2015-11-05 18:46:35.234918-05	2733	Kirvan, Michael (L6) 579620 - High Bar - None	3		41	1
2780	2015-11-05 18:46:35.235894-05	2146	Damm, Stephen (L6) 579601 - Floor - None	3		41	1
2781	2015-11-05 18:46:35.236871-05	2147	Damm, Stephen (L6) 579601 - Rings - None	3		41	1
2782	2015-11-05 18:46:35.237794-05	2148	Damm, Stephen (L6) 579601 - Pommel Horse - None	3		41	1
2783	2015-11-05 18:46:35.238709-05	2149	Damm, Stephen (L6) 579601 - Vault - None	3		41	1
2784	2015-11-05 18:46:35.239673-05	2150	Damm, Stephen (L6) 579601 - Parallel Bars - None	3		41	1
2785	2015-11-05 18:46:35.240589-05	2151	Damm, Stephen (L6) 579601 - High Bar - None	3		41	1
2786	2015-11-05 18:46:35.241481-05	1864	FLAGGED! Auchincloss, Alexander (L6) 523288 - Floor - None	3		41	1
2787	2015-11-05 18:46:35.242401-05	1865	FLAGGED! Auchincloss, Alexander (L6) 523288 - Rings - None	3		41	1
2788	2015-11-05 18:46:35.24336-05	1866	FLAGGED! Auchincloss, Alexander (L6) 523288 - Pommel Horse - None	3		41	1
2789	2015-11-05 18:46:35.24426-05	1867	FLAGGED! Auchincloss, Alexander (L6) 523288 - Vault - None	3		41	1
2790	2015-11-05 18:46:35.245146-05	1868	FLAGGED! Auchincloss, Alexander (L6) 523288 - Parallel Bars - None	3		41	1
2791	2015-11-05 18:46:35.24607-05	1869	FLAGGED! Auchincloss, Alexander (L6) 523288 - High Bar - None	3		41	1
2792	2015-11-05 18:46:35.247001-05	3100	O'Toole, Liam (L7) 582005 - Floor - None	3		41	1
2793	2015-11-05 18:46:35.247892-05	3101	O'Toole, Liam (L7) 582005 - Rings - None	3		41	1
2794	2015-11-05 18:46:35.248816-05	3102	O'Toole, Liam (L7) 582005 - Pommel Horse - None	3		41	1
2795	2015-11-05 18:46:35.249759-05	3103	O'Toole, Liam (L7) 582005 - Vault - None	3		41	1
2796	2015-11-05 18:46:35.250662-05	3104	O'Toole, Liam (L7) 582005 - Parallel Bars - None	3		41	1
2797	2015-11-05 18:46:35.251583-05	3105	O'Toole, Liam (L7) 582005 - High Bar - None	3		41	1
2798	2015-11-05 18:46:35.252559-05	2230	Eid, Marcel (L7) 523296 - Floor - None	3		41	1
2799	2015-11-05 18:46:35.253713-05	2231	Eid, Marcel (L7) 523296 - Rings - None	3		41	1
2800	2015-11-05 18:46:35.25472-05	2232	Eid, Marcel (L7) 523296 - Pommel Horse - None	3		41	1
2801	2015-11-05 18:46:35.255714-05	2233	Eid, Marcel (L7) 523296 - Vault - None	3		41	1
2802	2015-11-05 18:46:35.256745-05	2234	Eid, Marcel (L7) 523296 - Parallel Bars - None	3		41	1
2803	2015-11-05 18:46:35.257801-05	2235	Eid, Marcel (L7) 523296 - High Bar - None	3		41	1
2804	2015-11-05 18:46:35.258776-05	2680	Joyner, Adam (L7) 523298 - Floor - None	3		41	1
2805	2015-11-05 18:46:35.259693-05	2681	Joyner, Adam (L7) 523298 - Rings - None	3		41	1
2806	2015-11-05 18:46:35.260659-05	2682	Joyner, Adam (L7) 523298 - Pommel Horse - None	3		41	1
2807	2015-11-05 18:46:35.261569-05	2683	Joyner, Adam (L7) 523298 - Vault - None	3		41	1
2808	2015-11-05 18:46:35.262503-05	2684	Joyner, Adam (L7) 523298 - Parallel Bars - None	3		41	1
2809	2015-11-05 18:46:35.263397-05	2685	Joyner, Adam (L7) 523298 - High Bar - None	3		41	1
2810	2015-11-05 18:46:35.26428-05	3640	York, Jacob (L4) 989666 - Floor - None	3		41	1
2811	2015-11-05 18:46:35.265221-05	3641	York, Jacob (L4) 989666 - Rings - None	3		41	1
2812	2015-11-05 18:46:35.266148-05	3642	York, Jacob (L4) 989666 - Pommel Horse - None	3		41	1
2813	2015-11-05 18:46:35.267033-05	3643	York, Jacob (L4) 989666 - Vault - None	3		41	1
2814	2015-11-05 18:46:35.267918-05	3644	York, Jacob (L4) 989666 - Parallel Bars - None	3		41	1
2815	2015-11-05 18:46:35.268868-05	3645	York, Jacob (L4) 989666 - High Bar - None	3		41	1
2816	2015-11-05 18:46:35.269752-05	3196	Rearden, Alex (L4) 989668 - Floor - None	3		41	1
2817	2015-11-05 18:46:35.270701-05	3197	Rearden, Alex (L4) 989668 - Rings - None	3		41	1
2818	2015-11-05 18:46:35.271773-05	3198	Rearden, Alex (L4) 989668 - Pommel Horse - None	3		41	1
2819	2015-11-05 18:46:35.272659-05	3199	Rearden, Alex (L4) 989668 - Vault - None	3		41	1
2820	2015-11-05 18:46:35.273658-05	3200	Rearden, Alex (L4) 989668 - Parallel Bars - None	3		41	1
2821	2015-11-05 18:46:35.274611-05	3201	Rearden, Alex (L4) 989668 - High Bar - None	3		41	1
2822	2015-11-05 18:46:35.275572-05	2662	Jekal, Daniel (L5) 939766 - Floor - None	3		41	1
2823	2015-11-05 18:46:35.27653-05	2663	Jekal, Daniel (L5) 939766 - Rings - None	3		41	1
2824	2015-11-05 18:46:35.277507-05	2664	Jekal, Daniel (L5) 939766 - Pommel Horse - None	3		41	1
2825	2015-11-05 18:46:35.278443-05	2665	Jekal, Daniel (L5) 939766 - Vault - None	3		41	1
2826	2015-11-05 18:46:35.279357-05	2666	Jekal, Daniel (L5) 939766 - Parallel Bars - None	3		41	1
2827	2015-11-05 18:46:35.280367-05	2667	Jekal, Daniel (L5) 939766 - High Bar - None	3		41	1
2828	2015-11-05 18:46:35.281286-05	2842	Lin, Conner (L4) 989664 - Floor - None	3		41	1
2829	2015-11-05 18:46:35.282195-05	2843	Lin, Conner (L4) 989664 - Rings - None	3		41	1
2830	2015-11-05 18:46:35.283177-05	2844	Lin, Conner (L4) 989664 - Pommel Horse - None	3		41	1
2831	2015-11-05 18:46:35.284317-05	2845	Lin, Conner (L4) 989664 - Vault - None	3		41	1
2832	2015-11-05 18:46:35.285317-05	2846	Lin, Conner (L4) 989664 - Parallel Bars - None	3		41	1
2833	2015-11-05 18:46:35.286286-05	2847	Lin, Conner (L4) 989664 - High Bar - None	3		41	1
2834	2015-11-05 18:46:35.287234-05	2218	Durante, Tyler (L4) 989662 - Floor - None	3		41	1
2835	2015-11-05 18:46:35.288264-05	2219	Durante, Tyler (L4) 989662 - Rings - None	3		41	1
2836	2015-11-05 18:46:35.289215-05	2220	Durante, Tyler (L4) 989662 - Pommel Horse - None	3		41	1
2837	2015-11-05 18:46:35.290162-05	2221	Durante, Tyler (L4) 989662 - Vault - None	3		41	1
2838	2015-11-05 18:46:35.29111-05	2222	Durante, Tyler (L4) 989662 - Parallel Bars - None	3		41	1
2839	2015-11-05 18:46:35.292035-05	2223	Durante, Tyler (L4) 989662 - High Bar - None	3		41	1
2840	2015-11-05 18:46:35.292928-05	2494	Hanny, Jesse (L5) 939774 - Floor - None	3		41	1
2841	2015-11-05 18:46:35.293806-05	2495	Hanny, Jesse (L5) 939774 - Rings - None	3		41	1
2842	2015-11-05 18:46:35.294715-05	2496	Hanny, Jesse (L5) 939774 - Pommel Horse - None	3		41	1
2843	2015-11-05 18:46:35.295647-05	2497	Hanny, Jesse (L5) 939774 - Vault - None	3		41	1
2844	2015-11-05 18:46:35.296598-05	2498	Hanny, Jesse (L5) 939774 - Parallel Bars - None	3		41	1
2845	2015-11-05 18:46:35.297515-05	2499	Hanny, Jesse (L5) 939774 - High Bar - None	3		41	1
2846	2015-11-05 18:46:35.298395-05	2500	Hanny, Joshua (L5) 939769 - Floor - None	3		41	1
2847	2015-11-05 18:46:35.299274-05	2501	Hanny, Joshua (L5) 939769 - Rings - None	3		41	1
2848	2015-11-05 18:46:35.300161-05	2502	Hanny, Joshua (L5) 939769 - Pommel Horse - None	3		41	1
2849	2015-11-05 18:46:35.301039-05	2503	Hanny, Joshua (L5) 939769 - Vault - None	3		41	1
2850	2015-11-05 18:46:35.301903-05	2504	Hanny, Joshua (L5) 939769 - Parallel Bars - None	3		41	1
2851	2015-11-05 18:46:35.302817-05	2505	Hanny, Joshua (L5) 939769 - High Bar - None	3		41	1
2852	2015-11-05 18:46:35.303761-05	3154	Peppiatt, Michael (L4) 1004176 - Floor - None	3		41	1
2853	2015-11-05 18:46:35.304683-05	3155	Peppiatt, Michael (L4) 1004176 - Rings - None	3		41	1
2854	2015-11-05 18:46:35.305604-05	3156	Peppiatt, Michael (L4) 1004176 - Pommel Horse - None	3		41	1
2855	2015-11-05 18:46:35.306514-05	3157	Peppiatt, Michael (L4) 1004176 - Vault - None	3		41	1
2856	2015-11-05 18:46:35.30742-05	3158	Peppiatt, Michael (L4) 1004176 - Parallel Bars - None	3		41	1
2857	2015-11-05 18:46:35.308329-05	3159	Peppiatt, Michael (L4) 1004176 - High Bar - None	3		41	1
2858	2015-11-05 18:46:35.309237-05	3634	Yoder, Tiernan (L5) 939768 - Floor - None	3		41	1
2859	2015-11-05 18:46:35.310127-05	3635	Yoder, Tiernan (L5) 939768 - Rings - None	3		41	1
2860	2015-11-05 18:46:35.311011-05	3636	Yoder, Tiernan (L5) 939768 - Pommel Horse - None	3		41	1
2861	2015-11-05 18:46:35.311889-05	3637	Yoder, Tiernan (L5) 939768 - Vault - None	3		41	1
2862	2015-11-05 18:46:35.312776-05	3638	Yoder, Tiernan (L5) 939768 - Parallel Bars - None	3		41	1
2863	2015-11-05 18:46:35.313695-05	3639	Yoder, Tiernan (L5) 939768 - High Bar - None	3		41	1
2864	2015-11-05 18:46:35.31462-05	2194	DiPietro, Lucas (L5) 619644 - Floor - None	3		41	1
2865	2015-11-05 18:46:35.31562-05	2195	DiPietro, Lucas (L5) 619644 - Rings - None	3		41	1
2866	2015-11-05 18:46:35.316609-05	2196	DiPietro, Lucas (L5) 619644 - Pommel Horse - None	3		41	1
2867	2015-11-05 18:46:35.317586-05	2197	DiPietro, Lucas (L5) 619644 - Vault - None	3		41	1
2868	2015-11-05 18:46:35.318502-05	2198	DiPietro, Lucas (L5) 619644 - Parallel Bars - None	3		41	1
2869	2015-11-05 18:46:35.31939-05	2199	DiPietro, Lucas (L5) 619644 - High Bar - None	3		41	1
2870	2015-11-05 18:46:35.3204-05	3604	Wells, Ethan (L5) 619653 - Floor - None	3		41	1
2871	2015-11-05 18:46:35.321312-05	3605	Wells, Ethan (L5) 619653 - Rings - None	3		41	1
2872	2015-11-05 18:46:35.322287-05	3606	Wells, Ethan (L5) 619653 - Pommel Horse - None	3		41	1
2873	2015-11-05 18:46:35.323277-05	3607	Wells, Ethan (L5) 619653 - Vault - None	3		41	1
2874	2015-11-05 18:46:35.324215-05	3608	Wells, Ethan (L5) 619653 - Parallel Bars - None	3		41	1
2875	2015-11-05 18:46:35.325159-05	3609	Wells, Ethan (L5) 619653 - High Bar - None	3		41	1
2876	2015-11-05 18:46:35.326061-05	3010	Morgan, Neil (L6) 552928 - Floor - None	3		41	1
2877	2015-11-05 18:46:35.326948-05	3011	Morgan, Neil (L6) 552928 - Rings - None	3		41	1
2878	2015-11-05 18:46:35.327883-05	3012	Morgan, Neil (L6) 552928 - Pommel Horse - None	3		41	1
2879	2015-11-05 18:46:35.328868-05	3013	Morgan, Neil (L6) 552928 - Vault - None	3		41	1
2880	2015-11-05 18:46:35.329887-05	3014	Morgan, Neil (L6) 552928 - Parallel Bars - None	3		41	1
2881	2015-11-05 18:46:35.330829-05	3015	Morgan, Neil (L6) 552928 - High Bar - None	3		41	1
2882	2015-11-05 18:46:35.331734-05	3136	FLAGGED! Pelligrini, David (L6) 619648 - Floor - None	3		41	1
2883	2015-11-05 18:46:35.332662-05	3137	FLAGGED! Pelligrini, David (L6) 619648 - Rings - None	3		41	1
2884	2015-11-05 18:46:35.333634-05	3138	FLAGGED! Pelligrini, David (L6) 619648 - Pommel Horse - None	3		41	1
2885	2015-11-05 18:46:35.334633-05	3139	FLAGGED! Pelligrini, David (L6) 619648 - Vault - None	3		41	1
2886	2015-11-05 18:46:35.335674-05	3140	FLAGGED! Pelligrini, David (L6) 619648 - Parallel Bars - None	3		41	1
2887	2015-11-05 18:46:35.336667-05	3141	FLAGGED! Pelligrini, David (L6) 619648 - High Bar - None	3		41	1
2888	2015-11-05 18:46:35.33762-05	3142	FLAGGED! Pelligrini, Josef (L6) 619651 - Floor - None	3		41	1
2889	2015-11-05 18:46:35.338588-05	3143	FLAGGED! Pelligrini, Josef (L6) 619651 - Rings - None	3		41	1
2890	2015-11-05 18:46:35.339563-05	3144	FLAGGED! Pelligrini, Josef (L6) 619651 - Pommel Horse - None	3		41	1
2891	2015-11-05 18:46:35.340479-05	3145	FLAGGED! Pelligrini, Josef (L6) 619651 - Vault - None	3		41	1
2892	2015-11-05 18:46:35.341364-05	3146	FLAGGED! Pelligrini, Josef (L6) 619651 - Parallel Bars - None	3		41	1
2893	2015-11-05 18:46:35.342253-05	3147	FLAGGED! Pelligrini, Josef (L6) 619651 - High Bar - None	3		41	1
2894	2015-11-05 18:46:35.343211-05	2488	Hanny, Benjamin (L8) 939779 - Floor - None	3		41	1
2895	2015-11-05 18:46:35.344094-05	2489	Hanny, Benjamin (L8) 939779 - Rings - None	3		41	1
2896	2015-11-05 18:46:35.344973-05	2490	Hanny, Benjamin (L8) 939779 - Pommel Horse - None	3		41	1
2897	2015-11-05 18:46:35.345905-05	2491	Hanny, Benjamin (L8) 939779 - Vault - None	3		41	1
2898	2015-11-05 18:46:35.346787-05	2492	Hanny, Benjamin (L8) 939779 - Parallel Bars - None	3		41	1
2899	2015-11-05 18:46:35.347688-05	2493	Hanny, Benjamin (L8) 939779 - High Bar - None	3		41	1
2900	2015-11-05 18:46:35.348572-05	2260	Falgiano, Colin (L8) 494201 - Floor - None	3		41	1
2901	2015-11-05 18:46:35.349451-05	2261	Falgiano, Colin (L8) 494201 - Rings - None	3		41	1
2902	2015-11-05 18:46:35.350327-05	2262	Falgiano, Colin (L8) 494201 - Pommel Horse - None	3		41	1
2903	2015-11-05 18:46:35.351236-05	2263	Falgiano, Colin (L8) 494201 - Vault - None	3		41	1
2904	2015-11-05 18:46:35.352116-05	2264	Falgiano, Colin (L8) 494201 - Parallel Bars - None	3		41	1
2905	2015-11-05 18:46:35.353099-05	2265	Falgiano, Colin (L8) 494201 - High Bar - None	3		41	1
2906	2015-11-05 18:46:35.354378-05	3454	Sternberg, Paul (L8) 405143 - Floor - None	3		41	1
2907	2015-11-05 18:46:35.35549-05	3455	Sternberg, Paul (L8) 405143 - Rings - None	3		41	1
2908	2015-11-05 18:46:35.356476-05	3456	Sternberg, Paul (L8) 405143 - Pommel Horse - None	3		41	1
2909	2015-11-05 18:46:35.357462-05	3457	Sternberg, Paul (L8) 405143 - Vault - None	3		41	1
2910	2015-11-05 18:46:35.35847-05	3458	Sternberg, Paul (L8) 405143 - Parallel Bars - None	3		41	1
2911	2015-11-05 18:46:35.359474-05	3459	Sternberg, Paul (L8) 405143 - High Bar - None	3		41	1
2912	2015-11-05 18:46:35.36046-05	2080	Clingman, Chase (L9) 360792 - Floor - None	3		41	1
2913	2015-11-05 18:46:35.361471-05	2081	Clingman, Chase (L9) 360792 - Rings - None	3		41	1
2914	2015-11-05 18:46:35.362479-05	2082	Clingman, Chase (L9) 360792 - Pommel Horse - None	3		41	1
2915	2015-11-05 18:46:35.363495-05	2083	Clingman, Chase (L9) 360792 - Vault - None	3		41	1
2916	2015-11-05 18:46:35.364533-05	2084	Clingman, Chase (L9) 360792 - Parallel Bars - None	3		41	1
2917	2015-11-05 18:46:35.365581-05	2085	Clingman, Chase (L9) 360792 - High Bar - None	3		41	1
2918	2015-11-05 18:46:35.366599-05	3562	Voegele, Logan (L10) 272066 - Floor - None	3		41	1
2919	2015-11-05 18:46:35.367619-05	3563	Voegele, Logan (L10) 272066 - Rings - None	3		41	1
2920	2015-11-05 18:46:35.368609-05	3564	Voegele, Logan (L10) 272066 - Pommel Horse - None	3		41	1
2921	2015-11-05 18:46:35.369613-05	3565	Voegele, Logan (L10) 272066 - Vault - None	3		41	1
2922	2015-11-05 18:46:35.370631-05	3566	Voegele, Logan (L10) 272066 - Parallel Bars - None	3		41	1
2923	2015-11-05 18:46:35.371612-05	3567	Voegele, Logan (L10) 272066 - High Bar - None	3		41	1
2924	2015-11-05 18:46:35.372627-05	2086	Clingman, Nathan (L10) 272071 - Floor - None	3		41	1
2925	2015-11-05 18:46:35.373553-05	2087	Clingman, Nathan (L10) 272071 - Rings - None	3		41	1
2926	2015-11-05 18:46:35.374521-05	2088	Clingman, Nathan (L10) 272071 - Pommel Horse - None	3		41	1
2927	2015-11-05 18:46:35.375435-05	2089	Clingman, Nathan (L10) 272071 - Vault - None	3		41	1
2928	2015-11-05 18:46:35.37636-05	2090	Clingman, Nathan (L10) 272071 - Parallel Bars - None	3		41	1
2929	2015-11-05 18:46:35.377264-05	2091	Clingman, Nathan (L10) 272071 - High Bar - None	3		41	1
2930	2015-11-05 18:46:35.378187-05	1876	Ayodele, Aaron (L8) 547953 - Floor - None	3		41	1
2931	2015-11-05 18:46:35.37907-05	1877	Ayodele, Aaron (L8) 547953 - Rings - None	3		41	1
2932	2015-11-05 18:46:35.379941-05	1878	Ayodele, Aaron (L8) 547953 - Pommel Horse - None	3		41	1
2933	2015-11-05 18:46:35.380853-05	1879	Ayodele, Aaron (L8) 547953 - Vault - None	3		41	1
2934	2015-11-05 18:46:35.381734-05	1880	Ayodele, Aaron (L8) 547953 - Parallel Bars - None	3		41	1
2935	2015-11-05 18:46:35.382633-05	1881	Ayodele, Aaron (L8) 547953 - High Bar - None	3		41	1
2936	2015-11-05 18:46:35.383519-05	1888	Bailey, Deven (L4) 991256 - Floor - None	3		41	1
2937	2015-11-05 18:46:35.3844-05	1889	Bailey, Deven (L4) 991256 - Rings - None	3		41	1
2938	2015-11-05 18:46:35.385381-05	1890	Bailey, Deven (L4) 991256 - Pommel Horse - None	3		41	1
2939	2015-11-05 18:46:35.386325-05	1891	Bailey, Deven (L4) 991256 - Vault - None	3		41	1
2940	2015-11-05 18:46:35.387341-05	1892	Bailey, Deven (L4) 991256 - Parallel Bars - None	3		41	1
2941	2015-11-05 18:46:35.388284-05	1893	Bailey, Deven (L4) 991256 - High Bar - None	3		41	1
2942	2015-11-05 18:46:35.389209-05	1936	FLAGGED! Bennet, Pierce (L4) 991260 - Floor - None	3		41	1
2943	2015-11-05 18:46:35.390153-05	1937	FLAGGED! Bennet, Pierce (L4) 991260 - Rings - None	3		41	1
2944	2015-11-05 18:46:35.391072-05	1938	FLAGGED! Bennet, Pierce (L4) 991260 - Pommel Horse - None	3		41	1
2945	2015-11-05 18:46:35.39199-05	1939	FLAGGED! Bennet, Pierce (L4) 991260 - Vault - None	3		41	1
2946	2015-11-05 18:46:35.392868-05	1940	FLAGGED! Bennet, Pierce (L4) 991260 - Parallel Bars - None	3		41	1
2947	2015-11-05 18:46:35.393785-05	1941	FLAGGED! Bennet, Pierce (L4) 991260 - High Bar - None	3		41	1
2948	2015-11-05 18:46:35.394744-05	2050	Chu, Damien (L8) 500052 - Floor - None	3		41	1
2949	2015-11-05 18:46:35.395663-05	2051	Chu, Damien (L8) 500052 - Rings - None	3		41	1
2950	2015-11-05 18:46:35.396639-05	2052	Chu, Damien (L8) 500052 - Pommel Horse - None	3		41	1
2951	2015-11-05 18:46:35.397591-05	2053	Chu, Damien (L8) 500052 - Vault - None	3		41	1
2952	2015-11-05 18:46:35.398499-05	2054	Chu, Damien (L8) 500052 - Parallel Bars - None	3		41	1
2953	2015-11-05 18:46:35.399455-05	2055	Chu, Damien (L8) 500052 - High Bar - None	3		41	1
2954	2015-11-05 18:46:35.400355-05	2056	FLAGGED! Chu, Patrick (L4) 937186 - Floor - None	3		41	1
2955	2015-11-05 18:46:35.40124-05	2057	FLAGGED! Chu, Patrick (L4) 937186 - Rings - None	3		41	1
2956	2015-11-05 18:46:35.402101-05	2058	FLAGGED! Chu, Patrick (L4) 937186 - Pommel Horse - None	3		41	1
2957	2015-11-05 18:46:35.403074-05	2059	FLAGGED! Chu, Patrick (L4) 937186 - Vault - None	3		41	1
2958	2015-11-05 18:46:35.404139-05	2060	FLAGGED! Chu, Patrick (L4) 937186 - Parallel Bars - None	3		41	1
2959	2015-11-05 18:46:35.405121-05	2061	FLAGGED! Chu, Patrick (L4) 937186 - High Bar - None	3		41	1
2960	2015-11-05 18:46:35.406312-05	2062	Chung, Riley (L6) 614756 - Floor - None	3		41	1
2961	2015-11-05 18:46:35.407227-05	2063	Chung, Riley (L6) 614756 - Rings - None	3		41	1
2962	2015-11-05 18:46:35.408135-05	2064	Chung, Riley (L6) 614756 - Pommel Horse - None	3		41	1
2963	2015-11-05 18:46:35.409072-05	2065	Chung, Riley (L6) 614756 - Vault - None	3		41	1
2964	2015-11-05 18:46:35.409931-05	2066	Chung, Riley (L6) 614756 - Parallel Bars - None	3		41	1
2965	2015-11-05 18:46:35.410839-05	2067	Chung, Riley (L6) 614756 - High Bar - None	3		41	1
2966	2015-11-05 18:46:35.411718-05	2068	Clark, Henry (L5) 581777 - Floor - None	3		41	1
2967	2015-11-05 18:46:35.412648-05	2069	Clark, Henry (L5) 581777 - Rings - None	3		41	1
2968	2015-11-05 18:46:35.413642-05	2070	Clark, Henry (L5) 581777 - Pommel Horse - None	3		41	1
2969	2015-11-05 18:46:35.414559-05	2071	Clark, Henry (L5) 581777 - Vault - None	3		41	1
2970	2015-11-05 18:46:35.415534-05	2072	Clark, Henry (L5) 581777 - Parallel Bars - None	3		41	1
2971	2015-11-05 18:46:35.416506-05	2073	Clark, Henry (L5) 581777 - High Bar - None	3		41	1
2972	2015-11-05 18:46:35.417438-05	2098	Cooper, Logan (L4) 995890 - Floor - None	3		41	1
2973	2015-11-05 18:46:35.418391-05	2099	Cooper, Logan (L4) 995890 - Rings - None	3		41	1
2974	2015-11-05 18:46:35.419416-05	2100	Cooper, Logan (L4) 995890 - Pommel Horse - None	3		41	1
2975	2015-11-05 18:46:35.420322-05	2101	Cooper, Logan (L4) 995890 - Vault - None	3		41	1
2976	2015-11-05 18:46:35.421222-05	2102	Cooper, Logan (L4) 995890 - Parallel Bars - None	3		41	1
2977	2015-11-05 18:46:35.422152-05	2103	Cooper, Logan (L4) 995890 - High Bar - None	3		41	1
2978	2015-11-05 18:46:35.423035-05	2104	Cowan, Drew (L6) 614763 - Floor - None	3		41	1
2980	2015-11-05 18:46:35.424839-05	2106	Cowan, Drew (L6) 614763 - Pommel Horse - None	3		41	1
2981	2015-11-05 18:46:35.425793-05	2107	Cowan, Drew (L6) 614763 - Vault - None	3		41	1
2982	2015-11-05 18:46:35.426676-05	2108	Cowan, Drew (L6) 614763 - Parallel Bars - None	3		41	1
2983	2015-11-05 18:46:35.427599-05	2109	Cowan, Drew (L6) 614763 - High Bar - None	3		41	1
2984	2015-11-05 18:46:35.428483-05	2116	FLAGGED! Cronin, Asher (L6) 936964 - Floor - None	3		41	1
2985	2015-11-05 18:46:35.429406-05	2117	FLAGGED! Cronin, Asher (L6) 936964 - Rings - None	3		41	1
2986	2015-11-05 18:46:35.430286-05	2118	FLAGGED! Cronin, Asher (L6) 936964 - Pommel Horse - None	3		41	1
2987	2015-11-05 18:46:35.431167-05	2119	FLAGGED! Cronin, Asher (L6) 936964 - Vault - None	3		41	1
2988	2015-11-05 18:46:35.43212-05	2120	FLAGGED! Cronin, Asher (L6) 936964 - Parallel Bars - None	3		41	1
2989	2015-11-05 18:46:35.433071-05	2121	FLAGGED! Cronin, Asher (L6) 936964 - High Bar - None	3		41	1
2990	2015-11-05 18:46:35.434002-05	2152	Dao, Jonathan (L6) 614758 - Floor - None	3		41	1
2991	2015-11-05 18:46:35.434936-05	2153	Dao, Jonathan (L6) 614758 - Rings - None	3		41	1
2992	2015-11-05 18:46:35.435886-05	2154	Dao, Jonathan (L6) 614758 - Pommel Horse - None	3		41	1
2993	2015-11-05 18:46:35.436839-05	2155	Dao, Jonathan (L6) 614758 - Vault - None	3		41	1
2994	2015-11-05 18:46:35.437812-05	2156	Dao, Jonathan (L6) 614758 - Parallel Bars - None	3		41	1
2995	2015-11-05 18:46:35.438781-05	2157	Dao, Jonathan (L6) 614758 - High Bar - None	3		41	1
2996	2015-11-05 18:46:35.439748-05	2224	Durso, Reese (L9) 1014104 - Floor - None	3		41	1
2997	2015-11-05 18:46:35.440798-05	2225	Durso, Reese (L9) 1014104 - Rings - None	3		41	1
2998	2015-11-05 18:46:35.441717-05	2226	Durso, Reese (L9) 1014104 - Pommel Horse - None	3		41	1
2999	2015-11-05 18:46:35.442647-05	2227	Durso, Reese (L9) 1014104 - Vault - None	3		41	1
3000	2015-11-05 18:46:35.443604-05	2228	Durso, Reese (L9) 1014104 - Parallel Bars - None	3		41	1
3001	2015-11-05 18:46:35.444615-05	2229	Durso, Reese (L9) 1014104 - High Bar - None	3		41	1
3002	2015-11-05 18:46:35.445591-05	2266	Farias, Simon (L4) 996935 - Floor - None	3		41	1
3003	2015-11-05 18:46:35.446597-05	2267	Farias, Simon (L4) 996935 - Rings - None	3		41	1
3004	2015-11-05 18:46:35.447537-05	2268	Farias, Simon (L4) 996935 - Pommel Horse - None	3		41	1
3005	2015-11-05 18:46:35.448469-05	2269	Farias, Simon (L4) 996935 - Vault - None	3		41	1
3006	2015-11-05 18:46:35.4494-05	2270	Farias, Simon (L4) 996935 - Parallel Bars - None	3		41	1
3007	2015-11-05 18:46:35.450286-05	2271	Farias, Simon (L4) 996935 - High Bar - None	3		41	1
3008	2015-11-05 18:46:35.451173-05	2332	Galvez, Julian (L7) 548134 - Floor - None	3		41	1
3009	2015-11-05 18:46:35.452089-05	2333	Galvez, Julian (L7) 548134 - Rings - None	3		41	1
3010	2015-11-05 18:46:35.453097-05	2334	Galvez, Julian (L7) 548134 - Pommel Horse - None	3		41	1
3011	2015-11-05 18:46:35.454005-05	2335	Galvez, Julian (L7) 548134 - Vault - None	3		41	1
3012	2015-11-05 18:46:35.454906-05	2336	Galvez, Julian (L7) 548134 - Parallel Bars - None	3		41	1
3013	2015-11-05 18:46:35.455871-05	2337	Galvez, Julian (L7) 548134 - High Bar - None	3		41	1
3014	2015-11-05 18:46:35.456923-05	2422	Graninger, Kenneth (L8) 500058 - Floor - None	3		41	1
3015	2015-11-05 18:46:35.458033-05	2423	Graninger, Kenneth (L8) 500058 - Rings - None	3		41	1
3016	2015-11-05 18:46:35.459068-05	2424	Graninger, Kenneth (L8) 500058 - Pommel Horse - None	3		41	1
3017	2015-11-05 18:46:35.459991-05	2425	Graninger, Kenneth (L8) 500058 - Vault - None	3		41	1
3018	2015-11-05 18:46:35.460972-05	2426	Graninger, Kenneth (L8) 500058 - Parallel Bars - None	3		41	1
3019	2015-11-05 18:46:35.461874-05	2427	Graninger, Kenneth (L8) 500058 - High Bar - None	3		41	1
3020	2015-11-05 18:46:35.462806-05	2464	Hall, Donovan (L6) 565343 - Floor - None	3		41	1
3021	2015-11-05 18:46:35.463727-05	2465	Hall, Donovan (L6) 565343 - Rings - None	3		41	1
3022	2015-11-05 18:46:35.464604-05	2466	Hall, Donovan (L6) 565343 - Pommel Horse - None	3		41	1
3023	2015-11-05 18:46:35.465513-05	2467	Hall, Donovan (L6) 565343 - Vault - None	3		41	1
3024	2015-11-05 18:46:35.466391-05	2468	Hall, Donovan (L6) 565343 - Parallel Bars - None	3		41	1
3025	2015-11-05 18:46:35.467304-05	2469	Hall, Donovan (L6) 565343 - High Bar - None	3		41	1
3026	2015-11-05 18:46:35.468183-05	2470	Hall, Finn (L5) 937188 - Floor - None	3		41	1
3027	2015-11-05 18:46:35.46906-05	2471	Hall, Finn (L5) 937188 - Rings - None	3		41	1
3028	2015-11-05 18:46:35.470065-05	2472	Hall, Finn (L5) 937188 - Pommel Horse - None	3		41	1
3029	2015-11-05 18:46:35.471065-05	2473	Hall, Finn (L5) 937188 - Vault - None	3		41	1
3030	2015-11-05 18:46:35.47203-05	2474	Hall, Finn (L5) 937188 - Parallel Bars - None	3		41	1
3031	2015-11-05 18:46:35.472952-05	2475	Hall, Finn (L5) 937188 - High Bar - None	3		41	1
3032	2015-11-05 18:46:35.473926-05	2476	Hall, Kai (L5) 943289 - Floor - None	3		41	1
3033	2015-11-05 18:46:35.474853-05	2477	Hall, Kai (L5) 943289 - Rings - None	3		41	1
3034	2015-11-05 18:46:35.475775-05	2478	Hall, Kai (L5) 943289 - Pommel Horse - None	3		41	1
3035	2015-11-05 18:46:35.476656-05	2479	Hall, Kai (L5) 943289 - Vault - None	3		41	1
3036	2015-11-05 18:46:35.477588-05	2480	Hall, Kai (L5) 943289 - Parallel Bars - None	3		41	1
3037	2015-11-05 18:46:35.478476-05	2481	Hall, Kai (L5) 943289 - High Bar - None	3		41	1
3038	2015-11-05 18:46:35.479391-05	2482	Hall, Landon (L4) 996936 - Floor - None	3		41	1
3039	2015-11-05 18:46:35.480467-05	2483	Hall, Landon (L4) 996936 - Rings - None	3		41	1
3040	2015-11-05 18:46:35.481485-05	2484	Hall, Landon (L4) 996936 - Pommel Horse - None	3		41	1
3041	2015-11-05 18:46:35.482361-05	2485	Hall, Landon (L4) 996936 - Vault - None	3		41	1
3042	2015-11-05 18:46:35.483315-05	2486	Hall, Landon (L4) 996936 - Parallel Bars - None	3		41	1
3043	2015-11-05 18:46:35.484292-05	2487	Hall, Landon (L4) 996936 - High Bar - None	3		41	1
3044	2015-11-05 18:46:35.485245-05	2542	Hayter, Jackson (L4) 991283 - Floor - None	3		41	1
3045	2015-11-05 18:46:35.486191-05	2543	Hayter, Jackson (L4) 991283 - Rings - None	3		41	1
3046	2015-11-05 18:46:35.487112-05	2544	Hayter, Jackson (L4) 991283 - Pommel Horse - None	3		41	1
3047	2015-11-05 18:46:35.488044-05	2545	Hayter, Jackson (L4) 991283 - Vault - None	3		41	1
3048	2015-11-05 18:46:35.48898-05	2546	Hayter, Jackson (L4) 991283 - Parallel Bars - None	3		41	1
3049	2015-11-05 18:46:35.489873-05	2547	Hayter, Jackson (L4) 991283 - High Bar - None	3		41	1
3050	2015-11-05 18:46:35.4908-05	2548	Hayter, Miles (L5) 937335 - Floor - None	3		41	1
3051	2015-11-05 18:46:35.491704-05	2549	Hayter, Miles (L5) 937335 - Rings - None	3		41	1
3052	2015-11-05 18:46:35.492649-05	2550	Hayter, Miles (L5) 937335 - Pommel Horse - None	3		41	1
3053	2015-11-05 18:46:35.493578-05	2551	Hayter, Miles (L5) 937335 - Vault - None	3		41	1
3054	2015-11-05 18:46:35.494461-05	2552	Hayter, Miles (L5) 937335 - Parallel Bars - None	3		41	1
3055	2015-11-05 18:46:35.49544-05	2553	Hayter, Miles (L5) 937335 - High Bar - None	3		41	1
3056	2015-11-05 18:46:35.496325-05	2878	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Floor - None	3		41	1
3057	2015-11-05 18:46:35.497208-05	2879	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Rings - None	3		41	1
3058	2015-11-05 18:46:35.49809-05	2880	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Pommel Horse - None	3		41	1
3059	2015-11-05 18:46:35.49897-05	2881	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Vault - None	3		41	1
3060	2015-11-05 18:46:35.499897-05	2882	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - Parallel Bars - None	3		41	1
3061	2015-11-05 18:46:35.500782-05	2883	FLAGGED! Maher-Rippin, Stanley (L4) 995900 - High Bar - None	3		41	1
3062	2015-11-05 18:46:35.501741-05	2560	FLAGGED! Henry-Price, Joshua (L8) 455261 - Floor - None	3		41	1
3063	2015-11-05 18:46:35.502721-05	2561	FLAGGED! Henry-Price, Joshua (L8) 455261 - Rings - None	3		41	1
3064	2015-11-05 18:46:35.503722-05	2562	FLAGGED! Henry-Price, Joshua (L8) 455261 - Pommel Horse - None	3		41	1
3065	2015-11-05 18:46:35.504695-05	2563	FLAGGED! Henry-Price, Joshua (L8) 455261 - Vault - None	3		41	1
3066	2015-11-05 18:46:35.505637-05	2564	FLAGGED! Henry-Price, Joshua (L8) 455261 - Parallel Bars - None	3		41	1
3067	2015-11-05 18:46:35.506555-05	2565	FLAGGED! Henry-Price, Joshua (L8) 455261 - High Bar - None	3		41	1
3068	2015-11-05 18:46:35.507467-05	2566	Hewitt, Donovan (L9) 405498 - Floor - None	3		41	1
3069	2015-11-05 18:46:35.50839-05	2567	Hewitt, Donovan (L9) 405498 - Rings - None	3		41	1
3070	2015-11-05 18:46:35.509339-05	2568	Hewitt, Donovan (L9) 405498 - Pommel Horse - None	3		41	1
3071	2015-11-05 18:46:35.510382-05	2569	Hewitt, Donovan (L9) 405498 - Vault - None	3		41	1
3072	2015-11-05 18:46:35.511513-05	2570	Hewitt, Donovan (L9) 405498 - Parallel Bars - None	3		41	1
3073	2015-11-05 18:46:35.512803-05	2571	Hewitt, Donovan (L9) 405498 - High Bar - None	3		41	1
3074	2015-11-05 18:46:35.513788-05	2650	Jackson, Tyler (L4) 999856 - Floor - None	3		41	1
3075	2015-11-05 18:46:35.514778-05	2651	Jackson, Tyler (L4) 999856 - Rings - None	3		41	1
3076	2015-11-05 18:46:35.515802-05	2652	Jackson, Tyler (L4) 999856 - Pommel Horse - None	3		41	1
3077	2015-11-05 18:46:35.51675-05	2653	Jackson, Tyler (L4) 999856 - Vault - None	3		41	1
3078	2015-11-05 18:46:35.517696-05	2654	Jackson, Tyler (L4) 999856 - Parallel Bars - None	3		41	1
3079	2015-11-05 18:46:35.518628-05	2655	Jackson, Tyler (L4) 999856 - High Bar - None	3		41	1
3080	2015-11-05 18:46:35.519583-05	2656	Jarrell, Christian (L10) 198617 - Floor - None	3		41	1
3081	2015-11-05 18:46:35.520521-05	2657	Jarrell, Christian (L10) 198617 - Rings - None	3		41	1
3082	2015-11-05 18:46:35.521435-05	2658	Jarrell, Christian (L10) 198617 - Pommel Horse - None	3		41	1
3083	2015-11-05 18:46:35.522325-05	2659	Jarrell, Christian (L10) 198617 - Vault - None	3		41	1
3084	2015-11-05 18:46:35.523268-05	2660	Jarrell, Christian (L10) 198617 - Parallel Bars - None	3		41	1
3085	2015-11-05 18:46:35.524191-05	2661	Jarrell, Christian (L10) 198617 - High Bar - None	3		41	1
3086	2015-11-05 18:46:35.525073-05	2686	Kanthan, Kush (L7) 500063 - Floor - None	3		41	1
3087	2015-11-05 18:46:35.525995-05	2687	Kanthan, Kush (L7) 500063 - Rings - None	3		41	1
3088	2015-11-05 18:46:35.526881-05	2688	Kanthan, Kush (L7) 500063 - Pommel Horse - None	3		41	1
3089	2015-11-05 18:46:35.527762-05	2689	Kanthan, Kush (L7) 500063 - Vault - None	3		41	1
3090	2015-11-05 18:46:35.528645-05	2690	Kanthan, Kush (L7) 500063 - Parallel Bars - None	3		41	1
3091	2015-11-05 18:46:35.529522-05	2691	Kanthan, Kush (L7) 500063 - High Bar - None	3		41	1
3092	2015-11-05 18:46:35.530631-05	2854	Louloudes, NIcholas (L9) 422161 - Floor - None	3		41	1
3093	2015-11-05 18:46:35.531998-05	2855	Louloudes, NIcholas (L9) 422161 - Rings - None	3		41	1
3094	2015-11-05 18:46:35.533119-05	2856	Louloudes, NIcholas (L9) 422161 - Pommel Horse - None	3		41	1
3095	2015-11-05 18:46:35.534152-05	2857	Louloudes, NIcholas (L9) 422161 - Vault - None	3		41	1
3096	2015-11-05 18:46:35.535178-05	2858	Louloudes, NIcholas (L9) 422161 - Parallel Bars - None	3		41	1
3097	2015-11-05 18:46:35.536128-05	2859	Louloudes, NIcholas (L9) 422161 - High Bar - None	3		41	1
3098	2015-11-05 18:46:35.537099-05	2908	Mason, Jan (L4) 991280 - Floor - None	3		41	1
3099	2015-11-05 18:46:35.538138-05	2909	Mason, Jan (L4) 991280 - Rings - None	3		41	1
3100	2015-11-05 18:46:35.539145-05	2910	Mason, Jan (L4) 991280 - Pommel Horse - None	3		41	1
3101	2015-11-05 18:46:35.540143-05	2911	Mason, Jan (L4) 991280 - Vault - None	3		41	1
3102	2015-11-05 18:46:35.541143-05	2912	Mason, Jan (L4) 991280 - Parallel Bars - None	3		41	1
3103	2015-11-05 18:46:35.542121-05	2913	Mason, Jan (L4) 991280 - High Bar - None	3		41	1
3104	2015-11-05 18:46:35.543136-05	2962	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Floor - None	3		41	1
3105	2015-11-05 18:46:35.544122-05	2963	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Rings - None	3		41	1
3106	2015-11-05 18:46:35.545118-05	2964	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Pommel Horse - None	3		41	1
3107	2015-11-05 18:46:35.546099-05	2965	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Vault - None	3		41	1
3108	2015-11-05 18:46:35.547124-05	2966	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - Parallel Bars - None	3		41	1
3109	2015-11-05 18:46:35.548163-05	2967	FLAGGED! Mejia-Gabriel, Geovanny (L5) 969397 - High Bar - None	3		41	1
3110	2015-11-05 18:46:35.549141-05	3064	Ngo, Quinlan (L8) 500064 - Floor - None	3		41	1
3111	2015-11-05 18:46:35.550064-05	3065	Ngo, Quinlan (L8) 500064 - Rings - None	3		41	1
3112	2015-11-05 18:46:35.55097-05	3066	Ngo, Quinlan (L8) 500064 - Pommel Horse - None	3		41	1
3113	2015-11-05 18:46:35.551985-05	3067	Ngo, Quinlan (L8) 500064 - Vault - None	3		41	1
3114	2015-11-05 18:46:35.552904-05	3068	Ngo, Quinlan (L8) 500064 - Parallel Bars - None	3		41	1
3115	2015-11-05 18:46:35.553874-05	3069	Ngo, Quinlan (L8) 500064 - High Bar - None	3		41	1
3116	2015-11-05 18:46:35.554827-05	3070	Nguyen, Damon (L6) 547955 - Floor - None	3		41	1
3117	2015-11-05 18:46:35.555717-05	3071	Nguyen, Damon (L6) 547955 - Rings - None	3		41	1
3118	2015-11-05 18:46:35.556749-05	3072	Nguyen, Damon (L6) 547955 - Pommel Horse - None	3		41	1
3119	2015-11-05 18:46:35.557705-05	3073	Nguyen, Damon (L6) 547955 - Vault - None	3		41	1
3120	2015-11-05 18:46:35.558625-05	3074	Nguyen, Damon (L6) 547955 - Parallel Bars - None	3		41	1
3121	2015-11-05 18:46:35.559508-05	3075	Nguyen, Damon (L6) 547955 - High Bar - None	3		41	1
3122	2015-11-05 18:46:35.56039-05	3076	Nguyen, Thanh-Trieu (L6) 614759 - Floor - None	3		41	1
3123	2015-11-05 18:46:35.561347-05	3077	Nguyen, Thanh-Trieu (L6) 614759 - Rings - None	3		41	1
3124	2015-11-05 18:46:35.562282-05	3078	Nguyen, Thanh-Trieu (L6) 614759 - Pommel Horse - None	3		41	1
3125	2015-11-05 18:46:35.563227-05	3079	Nguyen, Thanh-Trieu (L6) 614759 - Vault - None	3		41	1
3126	2015-11-05 18:46:35.564199-05	3080	Nguyen, Thanh-Trieu (L6) 614759 - Parallel Bars - None	3		41	1
3127	2015-11-05 18:46:35.565094-05	3081	Nguyen, Thanh-Trieu (L6) 614759 - High Bar - None	3		41	1
3128	2015-11-05 18:46:35.566024-05	3082	Nguyen, Thien-Trieu (L4) 1010423 - Floor - None	3		41	1
3129	2015-11-05 18:46:35.566921-05	3083	Nguyen, Thien-Trieu (L4) 1010423 - Rings - None	3		41	1
3130	2015-11-05 18:46:35.567874-05	3084	Nguyen, Thien-Trieu (L4) 1010423 - Pommel Horse - None	3		41	1
3131	2015-11-05 18:46:35.568771-05	3085	Nguyen, Thien-Trieu (L4) 1010423 - Vault - None	3		41	1
3132	2015-11-05 18:46:35.569718-05	3086	Nguyen, Thien-Trieu (L4) 1010423 - Parallel Bars - None	3		41	1
3133	2015-11-05 18:46:35.570607-05	3087	Nguyen, Thien-Trieu (L4) 1010423 - High Bar - None	3		41	1
3134	2015-11-05 18:46:35.571493-05	3190	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Floor - None	3		41	1
3135	2015-11-05 18:46:35.572382-05	3191	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Rings - None	3		41	1
3136	2015-11-05 18:46:35.573305-05	3192	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Pommel Horse - None	3		41	1
3137	2015-11-05 18:46:35.574284-05	3193	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Vault - None	3		41	1
3138	2015-11-05 18:46:35.575246-05	3194	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - Parallel Bars - None	3		41	1
3139	2015-11-05 18:46:35.576171-05	3195	FLAGGED! Ra-Akbar, Jadon (L8) 456209 - High Bar - None	3		41	1
3140	2015-11-05 18:46:35.577101-05	3202	Rice, Cameron (L10) 274588 - Floor - None	3		41	1
3141	2015-11-05 18:46:35.578026-05	3203	Rice, Cameron (L10) 274588 - Rings - None	3		41	1
3142	2015-11-05 18:46:35.578945-05	3204	Rice, Cameron (L10) 274588 - Pommel Horse - None	3		41	1
3143	2015-11-05 18:46:35.57987-05	3205	Rice, Cameron (L10) 274588 - Vault - None	3		41	1
3144	2015-11-05 18:46:35.580755-05	3206	Rice, Cameron (L10) 274588 - Parallel Bars - None	3		41	1
3145	2015-11-05 18:46:35.581676-05	3207	Rice, Cameron (L10) 274588 - High Bar - None	3		41	1
3146	2015-11-05 18:46:35.582583-05	3232	Rollins, Zachary (L7) 547957 - Floor - None	3		41	1
3147	2015-11-05 18:46:35.58351-05	3233	Rollins, Zachary (L7) 547957 - Rings - None	3		41	1
3148	2015-11-05 18:46:35.584411-05	3234	Rollins, Zachary (L7) 547957 - Pommel Horse - None	3		41	1
3149	2015-11-05 18:46:35.585291-05	3235	Rollins, Zachary (L7) 547957 - Vault - None	3		41	1
3150	2015-11-05 18:46:35.586184-05	3236	Rollins, Zachary (L7) 547957 - Parallel Bars - None	3		41	1
3151	2015-11-05 18:46:35.587145-05	3237	Rollins, Zachary (L7) 547957 - High Bar - None	3		41	1
3152	2015-11-05 18:46:35.588202-05	3292	Saine, Dawda (L6) 614762 - Floor - None	3		41	1
3153	2015-11-05 18:46:35.589145-05	3293	Saine, Dawda (L6) 614762 - Rings - None	3		41	1
3154	2015-11-05 18:46:35.590038-05	3294	Saine, Dawda (L6) 614762 - Pommel Horse - None	3		41	1
3155	2015-11-05 18:46:35.59093-05	3295	Saine, Dawda (L6) 614762 - Vault - None	3		41	1
3156	2015-11-05 18:46:35.591817-05	3296	Saine, Dawda (L6) 614762 - Parallel Bars - None	3		41	1
3157	2015-11-05 18:46:35.592701-05	3297	Saine, Dawda (L6) 614762 - High Bar - None	3		41	1
3158	2015-11-05 18:46:35.593644-05	3400	Singleton, Brandon (L8) 455967 - Floor - None	3		41	1
3159	2015-11-05 18:46:35.594534-05	3401	Singleton, Brandon (L8) 455967 - Rings - None	3		41	1
3160	2015-11-05 18:46:35.595451-05	3402	Singleton, Brandon (L8) 455967 - Pommel Horse - None	3		41	1
3161	2015-11-05 18:46:35.596494-05	3403	Singleton, Brandon (L8) 455967 - Vault - None	3		41	1
3162	2015-11-05 18:46:35.597812-05	3404	Singleton, Brandon (L8) 455967 - Parallel Bars - None	3		41	1
3163	2015-11-05 18:46:35.598761-05	3405	Singleton, Brandon (L8) 455967 - High Bar - None	3		41	1
3164	2015-11-05 18:46:35.599681-05	3406	Singleton, Jason (L7) 547954 - Floor - None	3		41	1
3165	2015-11-05 18:46:35.600595-05	3407	Singleton, Jason (L7) 547954 - Rings - None	3		41	1
3166	2015-11-05 18:46:35.601527-05	3408	Singleton, Jason (L7) 547954 - Pommel Horse - None	3		41	1
3167	2015-11-05 18:46:35.602419-05	3409	Singleton, Jason (L7) 547954 - Vault - None	3		41	1
3168	2015-11-05 18:46:35.603379-05	3410	Singleton, Jason (L7) 547954 - Parallel Bars - None	3		41	1
3169	2015-11-05 18:46:35.604291-05	3411	Singleton, Jason (L7) 547954 - High Bar - None	3		41	1
3170	2015-11-05 18:46:35.605226-05	3442	Spurlock, Ibraheem (L8) 614761 - Floor - None	3		41	1
3171	2015-11-05 18:46:35.606143-05	3443	Spurlock, Ibraheem (L8) 614761 - Rings - None	3		41	1
3172	2015-11-05 18:46:35.60705-05	3444	Spurlock, Ibraheem (L8) 614761 - Pommel Horse - None	3		41	1
3173	2015-11-05 18:46:35.607993-05	3445	Spurlock, Ibraheem (L8) 614761 - Vault - None	3		41	1
3174	2015-11-05 18:46:35.608894-05	3446	Spurlock, Ibraheem (L8) 614761 - Parallel Bars - None	3		41	1
3175	2015-11-05 18:46:35.60983-05	3447	Spurlock, Ibraheem (L8) 614761 - High Bar - None	3		41	1
3176	2015-11-05 18:46:35.610721-05	3478	Syed, Aaban (L8) 500067 - Floor - None	3		41	1
3177	2015-11-05 18:46:35.611633-05	3479	Syed, Aaban (L8) 500067 - Rings - None	3		41	1
3178	2015-11-05 18:46:35.612489-05	3480	Syed, Aaban (L8) 500067 - Pommel Horse - None	3		41	1
3179	2015-11-05 18:46:35.613387-05	3481	Syed, Aaban (L8) 500067 - Vault - None	3		41	1
3180	2015-11-05 18:46:35.614273-05	3482	Syed, Aaban (L8) 500067 - Parallel Bars - None	3		41	1
3181	2015-11-05 18:46:35.615199-05	3483	Syed, Aaban (L8) 500067 - High Bar - None	3		41	1
3182	2015-11-05 18:46:35.61609-05	3514	Tran, Eric (L8) 500072 - Floor - None	3		41	1
3183	2015-11-05 18:46:35.616975-05	3515	Tran, Eric (L8) 500072 - Rings - None	3		41	1
3184	2015-11-05 18:46:35.617861-05	3516	Tran, Eric (L8) 500072 - Pommel Horse - None	3		41	1
3185	2015-11-05 18:46:35.618746-05	3517	Tran, Eric (L8) 500072 - Vault - None	3		41	1
3186	2015-11-05 18:46:35.61965-05	3518	Tran, Eric (L8) 500072 - Parallel Bars - None	3		41	1
3187	2015-11-05 18:46:35.620667-05	3519	Tran, Eric (L8) 500072 - High Bar - None	3		41	1
3188	2015-11-05 18:46:35.621687-05	3550	Venit, Michael (L8) 500075 - Floor - None	3		41	1
3189	2015-11-05 18:46:35.622604-05	3551	Venit, Michael (L8) 500075 - Rings - None	3		41	1
3190	2015-11-05 18:46:35.623573-05	3552	Venit, Michael (L8) 500075 - Pommel Horse - None	3		41	1
3191	2015-11-05 18:46:35.624576-05	3553	Venit, Michael (L8) 500075 - Vault - None	3		41	1
3192	2015-11-05 18:46:35.625549-05	3554	Venit, Michael (L8) 500075 - Parallel Bars - None	3		41	1
3193	2015-11-05 18:46:35.626477-05	3555	Venit, Michael (L8) 500075 - High Bar - None	3		41	1
3194	2015-11-05 18:46:35.627368-05	3598	Wedge, Simon (L4) 994241 - Floor - None	3		41	1
3195	2015-11-05 18:46:35.628298-05	3599	Wedge, Simon (L4) 994241 - Rings - None	3		41	1
3196	2015-11-05 18:46:35.629185-05	3600	Wedge, Simon (L4) 994241 - Pommel Horse - None	3		41	1
3197	2015-11-05 18:46:35.630069-05	3601	Wedge, Simon (L4) 994241 - Vault - None	3		41	1
3198	2015-11-05 18:46:35.630954-05	3602	Wedge, Simon (L4) 994241 - Parallel Bars - None	3		41	1
3199	2015-11-05 18:46:35.631916-05	3603	Wedge, Simon (L4) 994241 - High Bar - None	3		41	1
3200	2015-11-05 18:46:35.632825-05	3226	FLAGGED! Roham, Nima (L6) 472060 - Floor - None	3		41	1
3201	2015-11-05 18:46:35.633735-05	3227	FLAGGED! Roham, Nima (L6) 472060 - Rings - None	3		41	1
3202	2015-11-05 18:46:35.634639-05	3228	FLAGGED! Roham, Nima (L6) 472060 - Pommel Horse - None	3		41	1
3203	2015-11-05 18:46:35.635523-05	3229	FLAGGED! Roham, Nima (L6) 472060 - Vault - None	3		41	1
3204	2015-11-05 18:46:35.636522-05	3230	FLAGGED! Roham, Nima (L6) 472060 - Parallel Bars - None	3		41	1
3205	2015-11-05 18:46:35.637426-05	3231	FLAGGED! Roham, Nima (L6) 472060 - High Bar - None	3		41	1
3206	2015-11-05 18:46:35.638405-05	3250	Rothwell, Daniel (L6) 643533 - Floor - None	3		41	1
3207	2015-11-05 18:46:35.639312-05	3251	Rothwell, Daniel (L6) 643533 - Rings - None	3		41	1
3208	2015-11-05 18:46:35.640281-05	3252	Rothwell, Daniel (L6) 643533 - Pommel Horse - None	3		41	1
3209	2015-11-05 18:46:35.641185-05	3253	Rothwell, Daniel (L6) 643533 - Vault - None	3		41	1
3210	2015-11-05 18:46:35.642162-05	3254	Rothwell, Daniel (L6) 643533 - Parallel Bars - None	3		41	1
3211	2015-11-05 18:46:35.643071-05	3255	Rothwell, Daniel (L6) 643533 - High Bar - None	3		41	1
3212	2015-11-05 18:46:35.64395-05	3484	FLAGGED! Synder, Luke (L6) 382688 - Floor - None	3		41	1
3213	2015-11-05 18:46:35.64488-05	3485	FLAGGED! Synder, Luke (L6) 382688 - Rings - None	3		41	1
3214	2015-11-05 18:46:35.645796-05	3486	FLAGGED! Synder, Luke (L6) 382688 - Pommel Horse - None	3		41	1
3215	2015-11-05 18:46:35.646746-05	3487	FLAGGED! Synder, Luke (L6) 382688 - Vault - None	3		41	1
3216	2015-11-05 18:46:35.647671-05	3488	FLAGGED! Synder, Luke (L6) 382688 - Parallel Bars - None	3		41	1
3217	2015-11-05 18:46:35.648574-05	3489	FLAGGED! Synder, Luke (L6) 382688 - High Bar - None	3		41	1
3218	2015-11-05 18:46:35.649476-05	2386	Golden, Benjamin (L5) 535082 - Floor - None	3		41	1
3219	2015-11-05 18:46:35.650382-05	2387	Golden, Benjamin (L5) 535082 - Rings - None	3		41	1
3220	2015-11-05 18:46:35.65135-05	2388	Golden, Benjamin (L5) 535082 - Pommel Horse - None	3		41	1
3221	2015-11-05 18:46:35.652268-05	2389	Golden, Benjamin (L5) 535082 - Vault - None	3		41	1
3222	2015-11-05 18:46:35.653248-05	2390	Golden, Benjamin (L5) 535082 - Parallel Bars - None	3		41	1
3223	2015-11-05 18:46:35.654434-05	2391	Golden, Benjamin (L5) 535082 - High Bar - None	3		41	1
3224	2015-11-05 18:46:35.655438-05	1894	Bantug, Milo (L5) 643528 - Floor - None	3		41	1
3225	2015-11-05 18:46:35.656439-05	1895	Bantug, Milo (L5) 643528 - Rings - None	3		41	1
3226	2015-11-05 18:46:35.65738-05	1896	Bantug, Milo (L5) 643528 - Pommel Horse - None	3		41	1
3227	2015-11-05 18:46:35.65831-05	1897	Bantug, Milo (L5) 643528 - Vault - None	3		41	1
3228	2015-11-05 18:46:35.659243-05	1898	Bantug, Milo (L5) 643528 - Parallel Bars - None	3		41	1
3229	2015-11-05 18:46:35.660249-05	1899	Bantug, Milo (L5) 643528 - High Bar - None	3		41	1
3230	2015-11-05 18:46:35.661139-05	3322	Schlueter, Matthew (L5) 643536 - Floor - None	3		41	1
3231	2015-11-05 18:46:35.662027-05	3323	Schlueter, Matthew (L5) 643536 - Rings - None	3		41	1
3232	2015-11-05 18:46:35.662907-05	3324	Schlueter, Matthew (L5) 643536 - Pommel Horse - None	3		41	1
3233	2015-11-05 18:46:35.663824-05	3325	Schlueter, Matthew (L5) 643536 - Vault - None	3		41	1
3234	2015-11-05 18:46:35.664705-05	3326	Schlueter, Matthew (L5) 643536 - Parallel Bars - None	3		41	1
3235	2015-11-05 18:46:35.665657-05	3327	Schlueter, Matthew (L5) 643536 - High Bar - None	3		41	1
3236	2015-11-05 18:46:35.666582-05	2374	Getz, Gabriel (L5) 581849 - Floor - None	3		41	1
3237	2015-11-05 18:46:35.667559-05	2375	Getz, Gabriel (L5) 581849 - Rings - None	3		41	1
3238	2015-11-05 18:46:35.668473-05	2376	Getz, Gabriel (L5) 581849 - Pommel Horse - None	3		41	1
3239	2015-11-05 18:46:35.669435-05	2377	Getz, Gabriel (L5) 581849 - Vault - None	3		41	1
3240	2015-11-05 18:46:35.670372-05	2378	Getz, Gabriel (L5) 581849 - Parallel Bars - None	3		41	1
3241	2015-11-05 18:46:35.671369-05	2379	Getz, Gabriel (L5) 581849 - High Bar - None	3		41	1
3242	2015-11-05 18:46:35.672318-05	2512	FLAGGED! Harnish, Matthew (L4) 958266 - Floor - None	3		41	1
3243	2015-11-05 18:46:35.673231-05	2513	FLAGGED! Harnish, Matthew (L4) 958266 - Rings - None	3		41	1
3244	2015-11-05 18:46:35.674196-05	2514	FLAGGED! Harnish, Matthew (L4) 958266 - Pommel Horse - None	3		41	1
3245	2015-11-05 18:46:35.675199-05	2515	FLAGGED! Harnish, Matthew (L4) 958266 - Vault - None	3		41	1
3246	2015-11-05 18:46:35.676148-05	2516	FLAGGED! Harnish, Matthew (L4) 958266 - Parallel Bars - None	3		41	1
3247	2015-11-05 18:46:35.677135-05	2517	FLAGGED! Harnish, Matthew (L4) 958266 - High Bar - None	3		41	1
3248	2015-11-05 18:46:35.678066-05	2818	Levi, Henry (L4) 658960 - Floor - None	3		41	1
3249	2015-11-05 18:46:35.67901-05	2819	Levi, Henry (L4) 658960 - Rings - None	3		41	1
3250	2015-11-05 18:46:35.679932-05	2820	Levi, Henry (L4) 658960 - Pommel Horse - None	3		41	1
3251	2015-11-05 18:46:35.680911-05	2821	Levi, Henry (L4) 658960 - Vault - None	3		41	1
3252	2015-11-05 18:46:35.681805-05	2822	Levi, Henry (L4) 658960 - Parallel Bars - None	3		41	1
3253	2015-11-05 18:46:35.682808-05	2823	Levi, Henry (L4) 658960 - High Bar - None	3		41	1
3254	2015-11-05 18:46:35.683806-05	2932	Mazur-Chang, Konrad (L4)  - Floor - None	3		41	1
3255	2015-11-05 18:46:35.684754-05	2933	Mazur-Chang, Konrad (L4)  - Rings - None	3		41	1
3256	2015-11-05 18:46:35.685716-05	2934	Mazur-Chang, Konrad (L4)  - Pommel Horse - None	3		41	1
3257	2015-11-05 18:46:35.686685-05	2935	Mazur-Chang, Konrad (L4)  - Vault - None	3		41	1
3258	2015-11-05 18:46:35.687673-05	2936	Mazur-Chang, Konrad (L4)  - Parallel Bars - None	3		41	1
3259	2015-11-05 18:46:35.688592-05	2937	Mazur-Chang, Konrad (L4)  - High Bar - None	3		41	1
3260	2015-11-05 18:46:35.689511-05	2614	Hoover, Caleb (L4)  - Floor - None	3		41	1
3261	2015-11-05 18:46:35.690422-05	2615	Hoover, Caleb (L4)  - Rings - None	3		41	1
3262	2015-11-05 18:46:35.691343-05	2616	Hoover, Caleb (L4)  - Pommel Horse - None	3		41	1
3263	2015-11-05 18:46:35.692257-05	2617	Hoover, Caleb (L4)  - Vault - None	3		41	1
3264	2015-11-05 18:46:35.693192-05	2618	Hoover, Caleb (L4)  - Parallel Bars - None	3		41	1
3265	2015-11-05 18:46:35.694079-05	2619	Hoover, Caleb (L4)  - High Bar - None	3		41	1
3266	2015-11-05 18:46:35.69496-05	2626	Im, Ozzy (L4)  - Floor - None	3		41	1
3267	2015-11-05 18:46:35.695881-05	2627	Im, Ozzy (L4)  - Rings - None	3		41	1
3268	2015-11-05 18:46:35.696796-05	2628	Im, Ozzy (L4)  - Pommel Horse - None	3		41	1
3269	2015-11-05 18:46:35.697711-05	2629	Im, Ozzy (L4)  - Vault - None	3		41	1
3270	2015-11-05 18:46:35.698696-05	2630	Im, Ozzy (L4)  - Parallel Bars - None	3		41	1
3271	2015-11-05 18:46:35.699773-05	2631	Im, Ozzy (L4)  - High Bar - None	3		41	1
3272	2015-11-05 18:46:35.700707-05	1834	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Floor - None	3		41	1
3273	2015-11-05 18:46:35.701682-05	1835	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Rings - None	3		41	1
3274	2015-11-05 18:46:35.702605-05	1836	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Pommel Horse - None	3		41	1
3275	2015-11-05 18:46:35.703568-05	1837	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Vault - None	3		41	1
3276	2015-11-05 18:46:35.704557-05	1838	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - Parallel Bars - None	3		41	1
3277	2015-11-05 18:46:35.705535-05	1839	FLAGGED! Agundes-Wright, Ronan (L4) 956997 - High Bar - None	3		41	1
3278	2015-11-05 18:46:35.706489-05	2668	Jones, William (L4) 1017124 - Floor - None	3		41	1
3279	2015-11-05 18:46:35.707409-05	2669	Jones, William (L4) 1017124 - Rings - None	3		41	1
3280	2015-11-05 18:46:35.708316-05	2670	Jones, William (L4) 1017124 - Pommel Horse - None	3		41	1
3281	2015-11-05 18:46:35.709277-05	2671	Jones, William (L4) 1017124 - Vault - None	3		41	1
3282	2015-11-05 18:46:35.710252-05	2672	Jones, William (L4) 1017124 - Parallel Bars - None	3		41	1
3283	2015-11-05 18:46:35.711205-05	2673	Jones, William (L4) 1017124 - High Bar - None	3		41	1
3284	2015-11-05 18:46:35.712098-05	3310	Sault, Kenneth (L4) 1000972 - Floor - None	3		41	1
3285	2015-11-05 18:46:35.713002-05	3311	Sault, Kenneth (L4) 1000972 - Rings - None	3		41	1
3286	2015-11-05 18:46:35.713892-05	3312	Sault, Kenneth (L4) 1000972 - Pommel Horse - None	3		41	1
3287	2015-11-05 18:46:35.714772-05	3313	Sault, Kenneth (L4) 1000972 - Vault - None	3		41	1
3288	2015-11-05 18:46:35.715678-05	3314	Sault, Kenneth (L4) 1000972 - Parallel Bars - None	3		41	1
3289	2015-11-05 18:46:35.716556-05	3315	Sault, Kenneth (L4) 1000972 - High Bar - None	3		41	1
3290	2015-11-05 18:46:35.717434-05	2554	Heald, Jason (L5) 944315 - Floor - None	3		41	1
3291	2015-11-05 18:46:35.718312-05	2555	Heald, Jason (L5) 944315 - Rings - None	3		41	1
3292	2015-11-05 18:46:35.719188-05	2556	Heald, Jason (L5) 944315 - Pommel Horse - None	3		41	1
3293	2015-11-05 18:46:35.720162-05	2557	Heald, Jason (L5) 944315 - Vault - None	3		41	1
3294	2015-11-05 18:46:35.721047-05	2558	Heald, Jason (L5) 944315 - Parallel Bars - None	3		41	1
3295	2015-11-05 18:46:35.72193-05	2559	Heald, Jason (L5) 944315 - High Bar - None	3		41	1
3296	2015-11-05 18:46:35.722805-05	2998	Montes, Gunnar (L5) 589690 - Floor - None	3		41	1
3297	2015-11-05 18:46:35.723755-05	2999	Montes, Gunnar (L5) 589690 - Rings - None	3		41	1
3298	2015-11-05 18:46:35.724642-05	3000	Montes, Gunnar (L5) 589690 - Pommel Horse - None	3		41	1
3299	2015-11-05 18:46:35.725578-05	3001	Montes, Gunnar (L5) 589690 - Vault - None	3		41	1
3300	2015-11-05 18:46:35.726461-05	3002	Montes, Gunnar (L5) 589690 - Parallel Bars - None	3		41	1
3301	2015-11-05 18:46:35.727341-05	3003	Montes, Gunnar (L5) 589690 - High Bar - None	3		41	1
3302	2015-11-05 18:46:35.728236-05	3220	Robertson, Connor (L5) 639978 - Floor - None	3		41	1
3303	2015-11-05 18:46:35.729138-05	3221	Robertson, Connor (L5) 639978 - Rings - None	3		41	1
3304	2015-11-05 18:46:35.730043-05	3222	Robertson, Connor (L5) 639978 - Pommel Horse - None	3		41	1
3305	2015-11-05 18:46:35.730919-05	3223	Robertson, Connor (L5) 639978 - Vault - None	3		41	1
3306	2015-11-05 18:46:35.731844-05	3224	Robertson, Connor (L5) 639978 - Parallel Bars - None	3		41	1
3307	2015-11-05 18:46:35.732729-05	3225	Robertson, Connor (L5) 639978 - High Bar - None	3		41	1
3308	2015-11-05 18:46:35.73364-05	1900	Barber, Aaron (L6) 539860 - Floor - None	3		41	1
3309	2015-11-05 18:46:35.734518-05	1901	Barber, Aaron (L6) 539860 - Rings - None	3		41	1
3310	2015-11-05 18:46:35.735435-05	1902	Barber, Aaron (L6) 539860 - Pommel Horse - None	3		41	1
3311	2015-11-05 18:46:35.736317-05	1903	Barber, Aaron (L6) 539860 - Vault - None	3		41	1
3312	2015-11-05 18:46:35.737211-05	1904	Barber, Aaron (L6) 539860 - Parallel Bars - None	3		41	1
3313	2015-11-05 18:46:35.738194-05	1905	Barber, Aaron (L6) 539860 - High Bar - None	3		41	1
3314	2015-11-05 18:46:35.739099-05	1954	Bishop, James (L6) 580814 - Floor - None	3		41	1
3315	2015-11-05 18:46:35.740003-05	1955	Bishop, James (L6) 580814 - Rings - None	3		41	1
3316	2015-11-05 18:46:35.740949-05	1956	Bishop, James (L6) 580814 - Pommel Horse - None	3		41	1
3317	2015-11-05 18:46:35.741831-05	1957	Bishop, James (L6) 580814 - Vault - None	3		41	1
3318	2015-11-05 18:46:35.74271-05	1958	Bishop, James (L6) 580814 - Parallel Bars - None	3		41	1
3319	2015-11-05 18:46:35.743663-05	1959	Bishop, James (L6) 580814 - High Bar - None	3		41	1
3320	2015-11-05 18:46:35.744551-05	1972	Boyle, Logan (L6) 550911 - Floor - None	3		41	1
3321	2015-11-05 18:46:35.74546-05	1973	Boyle, Logan (L6) 550911 - Rings - None	3		41	1
3322	2015-11-05 18:46:35.746338-05	1974	Boyle, Logan (L6) 550911 - Pommel Horse - None	3		41	1
3323	2015-11-05 18:46:35.747215-05	1975	Boyle, Logan (L6) 550911 - Vault - None	3		41	1
3324	2015-11-05 18:46:35.74809-05	1976	Boyle, Logan (L6) 550911 - Parallel Bars - None	3		41	1
3325	2015-11-05 18:46:35.748967-05	1977	Boyle, Logan (L6) 550911 - High Bar - None	3		41	1
3326	2015-11-05 18:46:35.749846-05	3382	Shinn, Jacob (L6) 577015 - Floor - None	3		41	1
3327	2015-11-05 18:46:35.750726-05	3383	Shinn, Jacob (L6) 577015 - Rings - None	3		41	1
3328	2015-11-05 18:46:35.751623-05	3384	Shinn, Jacob (L6) 577015 - Pommel Horse - None	3		41	1
3329	2015-11-05 18:46:35.752531-05	3385	Shinn, Jacob (L6) 577015 - Vault - None	3		41	1
3330	2015-11-05 18:46:35.753447-05	3386	Shinn, Jacob (L6) 577015 - Parallel Bars - None	3		41	1
3331	2015-11-05 18:46:35.754327-05	3387	Shinn, Jacob (L6) 577015 - High Bar - None	3		41	1
3332	2015-11-05 18:46:35.755278-05	3460	Sturgeon, Lawrence (L6) 550914 - Floor - None	3		41	1
3333	2015-11-05 18:46:35.756273-05	3461	Sturgeon, Lawrence (L6) 550914 - Rings - None	3		41	1
3334	2015-11-05 18:46:35.757257-05	3462	Sturgeon, Lawrence (L6) 550914 - Pommel Horse - None	3		41	1
3335	2015-11-05 18:46:35.758225-05	3463	Sturgeon, Lawrence (L6) 550914 - Vault - None	3		41	1
3336	2015-11-05 18:46:35.759157-05	3464	Sturgeon, Lawrence (L6) 550914 - Parallel Bars - None	3		41	1
3337	2015-11-05 18:46:35.760071-05	3465	Sturgeon, Lawrence (L6) 550914 - High Bar - None	3		41	1
3338	2015-11-05 18:46:35.760998-05	3466	Sullivan, Cameron (L6) 590646 - Floor - None	3		41	1
3339	2015-11-05 18:46:35.761925-05	3467	Sullivan, Cameron (L6) 590646 - Rings - None	3		41	1
3340	2015-11-05 18:46:35.762941-05	3468	Sullivan, Cameron (L6) 590646 - Pommel Horse - None	3		41	1
3341	2015-11-05 18:46:35.763926-05	3469	Sullivan, Cameron (L6) 590646 - Vault - None	3		41	1
3342	2015-11-05 18:46:35.764982-05	3470	Sullivan, Cameron (L6) 590646 - Parallel Bars - None	3		41	1
3343	2015-11-05 18:46:35.766327-05	3471	Sullivan, Cameron (L6) 590646 - High Bar - None	3		41	1
3344	2015-11-05 18:46:35.767326-05	3580	Warra, Makennen (L6) 550699 - Floor - None	3		41	1
3345	2015-11-05 18:46:35.768398-05	3581	Warra, Makennen (L6) 550699 - Rings - None	3		41	1
3346	2015-11-05 18:46:35.769334-05	3582	Warra, Makennen (L6) 550699 - Pommel Horse - None	3		41	1
3347	2015-11-05 18:46:35.770228-05	3583	Warra, Makennen (L6) 550699 - Vault - None	3		41	1
3348	2015-11-05 18:46:35.771251-05	3584	Warra, Makennen (L6) 550699 - Parallel Bars - None	3		41	1
3349	2015-11-05 18:46:35.77221-05	3585	Warra, Makennen (L6) 550699 - High Bar - None	3		41	1
3350	2015-11-05 18:46:35.773092-05	2176	Defoor, Dylan (L7) 540046 - Floor - None	3		41	1
3351	2015-11-05 18:46:35.774013-05	2177	Defoor, Dylan (L7) 540046 - Rings - None	3		41	1
3352	2015-11-05 18:46:35.774942-05	2178	Defoor, Dylan (L7) 540046 - Pommel Horse - None	3		41	1
3353	2015-11-05 18:46:35.775906-05	2179	Defoor, Dylan (L7) 540046 - Vault - None	3		41	1
3354	2015-11-05 18:46:35.77682-05	2180	Defoor, Dylan (L7) 540046 - Parallel Bars - None	3		41	1
3355	2015-11-05 18:46:35.777719-05	2181	Defoor, Dylan (L7) 540046 - High Bar - None	3		41	1
3356	2015-11-05 18:46:35.778605-05	2170	DeNisco, Nick (L4) 1008616 - Floor - None	3		41	1
3357	2015-11-05 18:46:35.779485-05	2171	DeNisco, Nick (L4) 1008616 - Rings - None	3		41	1
3358	2015-11-05 18:46:35.780394-05	2172	DeNisco, Nick (L4) 1008616 - Pommel Horse - None	3		41	1
3359	2015-11-05 18:46:35.781274-05	2173	DeNisco, Nick (L4) 1008616 - Vault - None	3		41	1
3360	2015-11-05 18:46:35.782159-05	2174	DeNisco, Nick (L4) 1008616 - Parallel Bars - None	3		41	1
3361	2015-11-05 18:46:35.783091-05	2175	DeNisco, Nick (L4) 1008616 - High Bar - None	3		41	1
3362	2015-11-05 18:46:35.783973-05	3592	Wayland, Seth (L4) 1008613 - Floor - None	3		41	1
3363	2015-11-05 18:46:35.784858-05	3593	Wayland, Seth (L4) 1008613 - Rings - None	3		41	1
3364	2015-11-05 18:46:35.78576-05	3594	Wayland, Seth (L4) 1008613 - Pommel Horse - None	3		41	1
3365	2015-11-05 18:46:35.78679-05	3595	Wayland, Seth (L4) 1008613 - Vault - None	3		41	1
3366	2015-11-05 18:46:35.787771-05	3596	Wayland, Seth (L4) 1008613 - Parallel Bars - None	3		41	1
3367	2015-11-05 18:46:35.788736-05	3597	Wayland, Seth (L4) 1008613 - High Bar - None	3		41	1
3368	2015-11-05 18:46:35.789657-05	3046	Murry, Garrett (L4) 1015881 - Floor - None	3		41	1
3369	2015-11-05 18:46:35.790551-05	3047	Murry, Garrett (L4) 1015881 - Rings - None	3		41	1
3370	2015-11-05 18:46:35.791436-05	3048	Murry, Garrett (L4) 1015881 - Pommel Horse - None	3		41	1
3371	2015-11-05 18:46:35.792371-05	3049	Murry, Garrett (L4) 1015881 - Vault - None	3		41	1
3372	2015-11-05 18:46:35.793358-05	3050	Murry, Garrett (L4) 1015881 - Parallel Bars - None	3		41	1
3373	2015-11-05 18:46:35.794336-05	3051	Murry, Garrett (L4) 1015881 - High Bar - None	3		41	1
3374	2015-11-05 18:46:35.795322-05	2446	Griffin, Jacob (L4) 992840 - Floor - None	3		41	1
3375	2015-11-05 18:46:35.796252-05	2447	Griffin, Jacob (L4) 992840 - Rings - None	3		41	1
3376	2015-11-05 18:46:35.797173-05	2448	Griffin, Jacob (L4) 992840 - Pommel Horse - None	3		41	1
3377	2015-11-05 18:46:35.798104-05	2449	Griffin, Jacob (L4) 992840 - Vault - None	3		41	1
3378	2015-11-05 18:46:35.799017-05	2450	Griffin, Jacob (L4) 992840 - Parallel Bars - None	3		41	1
3379	2015-11-05 18:46:35.799942-05	2451	Griffin, Jacob (L4) 992840 - High Bar - None	3		41	1
3380	2015-11-05 18:46:35.800831-05	2758	Kuvshinoff, Aidan (L4) 992854 - Floor - None	3		41	1
3381	2015-11-05 18:46:35.801774-05	2759	Kuvshinoff, Aidan (L4) 992854 - Rings - None	3		41	1
3382	2015-11-05 18:46:35.802703-05	2760	Kuvshinoff, Aidan (L4) 992854 - Pommel Horse - None	3		41	1
3383	2015-11-05 18:46:35.803702-05	2761	Kuvshinoff, Aidan (L4) 992854 - Vault - None	3		41	1
3384	2015-11-05 18:46:35.804618-05	2762	Kuvshinoff, Aidan (L4) 992854 - Parallel Bars - None	3		41	1
3385	2015-11-05 18:46:35.805498-05	2763	Kuvshinoff, Aidan (L4) 992854 - High Bar - None	3		41	1
3386	2015-11-05 18:46:35.80645-05	2782	Lane, Cole (L4) 992856 - Floor - None	3		41	1
3387	2015-11-05 18:46:35.807359-05	2783	Lane, Cole (L4) 992856 - Rings - None	3		41	1
3388	2015-11-05 18:46:35.808282-05	2784	Lane, Cole (L4) 992856 - Pommel Horse - None	3		41	1
3389	2015-11-05 18:46:35.809174-05	2785	Lane, Cole (L4) 992856 - Vault - None	3		41	1
3390	2015-11-05 18:46:35.810061-05	2786	Lane, Cole (L4) 992856 - Parallel Bars - None	3		41	1
3391	2015-11-05 18:46:35.810965-05	2787	Lane, Cole (L4) 992856 - High Bar - None	3		41	1
3392	2015-11-05 18:46:35.811849-05	3130	Pattison, Mathew (L4) 992860 - Floor - None	3		41	1
3393	2015-11-05 18:46:35.812816-05	3131	Pattison, Mathew (L4) 992860 - Rings - None	3		41	1
3394	2015-11-05 18:46:35.81374-05	3132	Pattison, Mathew (L4) 992860 - Pommel Horse - None	3		41	1
3395	2015-11-05 18:46:35.814642-05	3133	Pattison, Mathew (L4) 992860 - Vault - None	3		41	1
3396	2015-11-05 18:46:35.815586-05	3134	Pattison, Mathew (L4) 992860 - Parallel Bars - None	3		41	1
3397	2015-11-05 18:46:35.816495-05	3135	Pattison, Mathew (L4) 992860 - High Bar - None	3		41	1
3398	2015-11-05 18:46:35.817393-05	3352	Serres, Aiden (L4) 992862 - Floor - None	3		41	1
3399	2015-11-05 18:46:35.818313-05	3353	Serres, Aiden (L4) 992862 - Rings - None	3		41	1
3400	2015-11-05 18:46:35.819217-05	3354	Serres, Aiden (L4) 992862 - Pommel Horse - None	3		41	1
3401	2015-11-05 18:46:35.820228-05	3355	Serres, Aiden (L4) 992862 - Vault - None	3		41	1
3402	2015-11-05 18:46:35.821155-05	3356	Serres, Aiden (L4) 992862 - Parallel Bars - None	3		41	1
3403	2015-11-05 18:46:35.822191-05	3357	Serres, Aiden (L4) 992862 - High Bar - None	3		41	1
3404	2015-11-05 18:46:35.823108-05	1828	Agbor-Obal, Jezrael (L4) 994395 - Floor - None	3		41	1
3405	2015-11-05 18:46:35.824012-05	1829	Agbor-Obal, Jezrael (L4) 994395 - Rings - None	3		41	1
3406	2015-11-05 18:46:35.824913-05	1830	Agbor-Obal, Jezrael (L4) 994395 - Pommel Horse - None	3		41	1
3407	2015-11-05 18:46:35.826279-05	1831	Agbor-Obal, Jezrael (L4) 994395 - Vault - None	3		41	1
3408	2015-11-05 18:46:35.827247-05	1832	Agbor-Obal, Jezrael (L4) 994395 - Parallel Bars - None	3		41	1
3409	2015-11-05 18:46:35.828191-05	1833	Agbor-Obal, Jezrael (L4) 994395 - High Bar - None	3		41	1
3410	2015-11-05 18:46:35.829135-05	2302	Fitch, Matthew (L4) 994396 - Floor - None	3		41	1
3411	2015-11-05 18:46:35.830053-05	2303	Fitch, Matthew (L4) 994396 - Rings - None	3		41	1
3412	2015-11-05 18:46:35.830954-05	2304	Fitch, Matthew (L4) 994396 - Pommel Horse - None	3		41	1
3413	2015-11-05 18:46:35.831886-05	2305	Fitch, Matthew (L4) 994396 - Vault - None	3		41	1
3414	2015-11-05 18:46:35.832882-05	2306	Fitch, Matthew (L4) 994396 - Parallel Bars - None	3		41	1
3415	2015-11-05 18:46:35.833879-05	2307	Fitch, Matthew (L4) 994396 - High Bar - None	3		41	1
3416	2015-11-05 18:46:35.834843-05	2608	Hood, Liam (L4) 994397 - Floor - None	3		41	1
3417	2015-11-05 18:46:35.835803-05	2609	Hood, Liam (L4) 994397 - Rings - None	3		41	1
3418	2015-11-05 18:46:35.836771-05	2610	Hood, Liam (L4) 994397 - Pommel Horse - None	3		41	1
3419	2015-11-05 18:46:35.837798-05	2611	Hood, Liam (L4) 994397 - Vault - None	3		41	1
3420	2015-11-05 18:46:35.838768-05	2612	Hood, Liam (L4) 994397 - Parallel Bars - None	3		41	1
3421	2015-11-05 18:46:35.839679-05	2613	Hood, Liam (L4) 994397 - High Bar - None	3		41	1
3422	2015-11-05 18:46:35.840587-05	3286	FLAGGED! Rymut, Michael (L4) 994398 - Floor - None	3		41	1
3423	2015-11-05 18:46:35.841488-05	3287	FLAGGED! Rymut, Michael (L4) 994398 - Rings - None	3		41	1
3424	2015-11-05 18:46:35.842403-05	3288	FLAGGED! Rymut, Michael (L4) 994398 - Pommel Horse - None	3		41	1
3425	2015-11-05 18:46:35.843314-05	3289	FLAGGED! Rymut, Michael (L4) 994398 - Vault - None	3		41	1
3426	2015-11-05 18:46:35.844223-05	3290	FLAGGED! Rymut, Michael (L4) 994398 - Parallel Bars - None	3		41	1
3427	2015-11-05 18:46:35.845162-05	3291	FLAGGED! Rymut, Michael (L4) 994398 - High Bar - None	3		41	1
3428	2015-11-05 18:46:35.846058-05	3520	Trump, Cooper (L4) 994400 - Floor - None	3		41	1
3429	2015-11-05 18:46:35.846937-05	3521	Trump, Cooper (L4) 994400 - Rings - None	3		41	1
3430	2015-11-05 18:46:35.847819-05	3522	Trump, Cooper (L4) 994400 - Pommel Horse - None	3		41	1
3431	2015-11-05 18:46:35.848696-05	3523	Trump, Cooper (L4) 994400 - Vault - None	3		41	1
3432	2015-11-05 18:46:35.849667-05	3524	Trump, Cooper (L4) 994400 - Parallel Bars - None	3		41	1
3433	2015-11-05 18:46:35.850599-05	3525	Trump, Cooper (L4) 994400 - High Bar - None	3		41	1
3434	2015-11-05 18:46:35.851476-05	2284	Ficke, Blake (L4) 1010428 - Floor - None	3		41	1
3435	2015-11-05 18:46:35.852353-05	2285	Ficke, Blake (L4) 1010428 - Rings - None	3		41	1
3436	2015-11-05 18:46:35.853274-05	2286	Ficke, Blake (L4) 1010428 - Pommel Horse - None	3		41	1
3437	2015-11-05 18:46:35.854192-05	2287	Ficke, Blake (L4) 1010428 - Vault - None	3		41	1
3438	2015-11-05 18:46:35.855145-05	2288	Ficke, Blake (L4) 1010428 - Parallel Bars - None	3		41	1
3439	2015-11-05 18:46:35.856131-05	2289	Ficke, Blake (L4) 1010428 - High Bar - None	3		41	1
3440	2015-11-05 18:46:35.857077-05	2290	FLAGGED! Ficke, Brooks (L4) 1010429 - Floor - None	3		41	1
3441	2015-11-05 18:46:35.857991-05	2291	FLAGGED! Ficke, Brooks (L4) 1010429 - Rings - None	3		41	1
3442	2015-11-05 18:46:35.858892-05	2292	FLAGGED! Ficke, Brooks (L4) 1010429 - Pommel Horse - None	3		41	1
3443	2015-11-05 18:46:35.859795-05	2293	FLAGGED! Ficke, Brooks (L4) 1010429 - Vault - None	3		41	1
3444	2015-11-05 18:46:35.860673-05	2294	FLAGGED! Ficke, Brooks (L4) 1010429 - Parallel Bars - None	3		41	1
3445	2015-11-05 18:46:35.861559-05	2295	FLAGGED! Ficke, Brooks (L4) 1010429 - High Bar - None	3		41	1
3446	2015-11-05 18:46:35.862441-05	3628	Wysocki, Braden (L4) 994401 - Floor - None	3		41	1
3447	2015-11-05 18:46:35.863317-05	3629	Wysocki, Braden (L4) 994401 - Rings - None	3		41	1
3448	2015-11-05 18:46:35.864251-05	3630	Wysocki, Braden (L4) 994401 - Pommel Horse - None	3		41	1
3449	2015-11-05 18:46:35.865129-05	3631	Wysocki, Braden (L4) 994401 - Vault - None	3		41	1
3450	2015-11-05 18:46:35.866011-05	3632	Wysocki, Braden (L4) 994401 - Parallel Bars - None	3		41	1
3451	2015-11-05 18:46:35.866888-05	3633	Wysocki, Braden (L4) 994401 - High Bar - None	3		41	1
3452	2015-11-05 18:46:35.867788-05	2008	FLAGGED! Burges, Caden (L5) 648853 - Floor - None	3		41	1
3453	2015-11-05 18:46:35.868665-05	2009	FLAGGED! Burges, Caden (L5) 648853 - Rings - None	3		41	1
3454	2015-11-05 18:46:35.869596-05	2010	FLAGGED! Burges, Caden (L5) 648853 - Pommel Horse - None	3		41	1
3455	2015-11-05 18:46:35.870546-05	2011	FLAGGED! Burges, Caden (L5) 648853 - Vault - None	3		41	1
3456	2015-11-05 18:46:35.871429-05	2012	FLAGGED! Burges, Caden (L5) 648853 - Parallel Bars - None	3		41	1
3457	2015-11-05 18:46:35.872307-05	2013	FLAGGED! Burges, Caden (L5) 648853 - High Bar - None	3		41	1
3458	2015-11-05 18:46:35.873212-05	1996	FLAGGED! Brit, Ficke (L5) 648849 - Floor - None	3		41	1
3459	2015-11-05 18:46:35.874133-05	1997	FLAGGED! Brit, Ficke (L5) 648849 - Rings - None	3		41	1
3460	2015-11-05 18:46:35.875032-05	1998	FLAGGED! Brit, Ficke (L5) 648849 - Pommel Horse - None	3		41	1
3461	2015-11-05 18:46:35.875949-05	1999	FLAGGED! Brit, Ficke (L5) 648849 - Vault - None	3		41	1
3462	2015-11-05 18:46:35.876826-05	2000	FLAGGED! Brit, Ficke (L5) 648849 - Parallel Bars - None	3		41	1
3463	2015-11-05 18:46:35.877734-05	2001	FLAGGED! Brit, Ficke (L5) 648849 - High Bar - None	3		41	1
3464	2015-11-05 18:46:35.878615-05	2812	Letvin, Benjamin (L5) 975083 - Floor - None	3		41	1
3465	2015-11-05 18:46:35.879497-05	2813	Letvin, Benjamin (L5) 975083 - Rings - None	3		41	1
3466	2015-11-05 18:46:35.880377-05	2814	Letvin, Benjamin (L5) 975083 - Pommel Horse - None	3		41	1
3467	2015-11-05 18:46:35.881253-05	2815	Letvin, Benjamin (L5) 975083 - Vault - None	3		41	1
3468	2015-11-05 18:46:35.88213-05	2816	Letvin, Benjamin (L5) 975083 - Parallel Bars - None	3		41	1
3469	2015-11-05 18:46:35.883093-05	2817	Letvin, Benjamin (L5) 975083 - High Bar - None	3		41	1
3470	2015-11-05 18:46:35.884101-05	3088	FLAGGED! Nile, Samuel (L5) 952796 - Floor - None	3		41	1
3471	2015-11-05 18:46:35.885048-05	3089	FLAGGED! Nile, Samuel (L5) 952796 - Rings - None	3		41	1
3472	2015-11-05 18:46:35.88608-05	3090	FLAGGED! Nile, Samuel (L5) 952796 - Pommel Horse - None	3		41	1
3473	2015-11-05 18:46:35.887008-05	3091	FLAGGED! Nile, Samuel (L5) 952796 - Vault - None	3		41	1
3474	2015-11-05 18:46:35.887985-05	3092	FLAGGED! Nile, Samuel (L5) 952796 - Parallel Bars - None	3		41	1
3475	2015-11-05 18:46:35.888945-05	3093	FLAGGED! Nile, Samuel (L5) 952796 - High Bar - None	3		41	1
3476	2015-11-05 18:46:35.889852-05	3472	Suravenkat, Vivek (L5) 994394 - Floor - None	3		41	1
3477	2015-11-05 18:46:35.89075-05	3473	Suravenkat, Vivek (L5) 994394 - Rings - None	3		41	1
3478	2015-11-05 18:46:35.891651-05	3474	Suravenkat, Vivek (L5) 994394 - Pommel Horse - None	3		41	1
3479	2015-11-05 18:46:35.892548-05	3475	Suravenkat, Vivek (L5) 994394 - Vault - None	3		41	1
3480	2015-11-05 18:46:35.893553-05	3476	Suravenkat, Vivek (L5) 994394 - Parallel Bars - None	3		41	1
3481	2015-11-05 18:46:35.89447-05	3477	Suravenkat, Vivek (L5) 994394 - High Bar - None	3		41	1
3482	2015-11-05 18:46:35.895354-05	2578	Hibbert, Andrew (L6) 619405 - Floor - None	3		41	1
3483	2015-11-05 18:46:35.896293-05	2579	Hibbert, Andrew (L6) 619405 - Rings - None	3		41	1
3484	2015-11-05 18:46:35.897195-05	2580	Hibbert, Andrew (L6) 619405 - Pommel Horse - None	3		41	1
3485	2015-11-05 18:46:35.898091-05	2581	Hibbert, Andrew (L6) 619405 - Vault - None	3		41	1
3486	2015-11-05 18:46:35.89897-05	2582	Hibbert, Andrew (L6) 619405 - Parallel Bars - None	3		41	1
3487	2015-11-05 18:46:35.899881-05	2583	Hibbert, Andrew (L6) 619405 - High Bar - None	3		41	1
3488	2015-11-05 18:46:35.90076-05	3334	Schrott, Tyler (L6) 619408 - Floor - None	3		41	1
3489	2015-11-05 18:46:35.901641-05	3335	Schrott, Tyler (L6) 619408 - Rings - None	3		41	1
3490	2015-11-05 18:46:35.902618-05	3336	Schrott, Tyler (L6) 619408 - Pommel Horse - None	3		41	1
3491	2015-11-05 18:46:35.903533-05	3337	Schrott, Tyler (L6) 619408 - Vault - None	3		41	1
3492	2015-11-05 18:46:35.904412-05	3338	Schrott, Tyler (L6) 619408 - Parallel Bars - None	3		41	1
3493	2015-11-05 18:46:35.905287-05	3339	Schrott, Tyler (L6) 619408 - High Bar - None	3		41	1
3494	2015-11-05 18:46:35.906241-05	3328	Schrott, Connor (L6) 619410 - Floor - None	3		41	1
3495	2015-11-05 18:46:35.907146-05	3329	Schrott, Connor (L6) 619410 - Rings - None	3		41	1
3496	2015-11-05 18:46:35.908054-05	3330	Schrott, Connor (L6) 619410 - Pommel Horse - None	3		41	1
3497	2015-11-05 18:46:35.908936-05	3331	Schrott, Connor (L6) 619410 - Vault - None	3		41	1
3498	2015-11-05 18:46:35.909897-05	3332	Schrott, Connor (L6) 619410 - Parallel Bars - None	3		41	1
3499	2015-11-05 18:46:35.910817-05	3333	Schrott, Connor (L6) 619410 - High Bar - None	3		41	1
3500	2015-11-05 18:46:35.911719-05	1858	Arensdorf, Zachary (L7) 506141 - Floor - None	3		41	1
3501	2015-11-05 18:46:35.912618-05	1859	Arensdorf, Zachary (L7) 506141 - Rings - None	3		41	1
3502	2015-11-05 18:46:35.913555-05	1860	Arensdorf, Zachary (L7) 506141 - Pommel Horse - None	3		41	1
3503	2015-11-05 18:46:35.914435-05	1861	Arensdorf, Zachary (L7) 506141 - Vault - None	3		41	1
3504	2015-11-05 18:46:35.915311-05	1862	Arensdorf, Zachary (L7) 506141 - Parallel Bars - None	3		41	1
3505	2015-11-05 18:46:35.916238-05	1863	Arensdorf, Zachary (L7) 506141 - High Bar - None	3		41	1
3506	2015-11-05 18:46:35.917253-05	2014	Burgess, Jackson (L8) 506149 - Floor - None	3		41	1
3507	2015-11-05 18:46:35.91818-05	2015	Burgess, Jackson (L8) 506149 - Rings - None	3		41	1
3508	2015-11-05 18:46:35.919056-05	2016	Burgess, Jackson (L8) 506149 - Pommel Horse - None	3		41	1
3509	2015-11-05 18:46:35.920152-05	2017	Burgess, Jackson (L8) 506149 - Vault - None	3		41	1
3510	2015-11-05 18:46:35.921082-05	2018	Burgess, Jackson (L8) 506149 - Parallel Bars - None	3		41	1
3511	2015-11-05 18:46:35.922136-05	2019	Burgess, Jackson (L8) 506149 - High Bar - None	3		41	1
3512	2015-11-05 18:46:35.92305-05	2128	Currie, Benjamin (L8) 506150 - Floor - None	3		41	1
3513	2015-11-05 18:46:35.924005-05	2129	Currie, Benjamin (L8) 506150 - Rings - None	3		41	1
3514	2015-11-05 18:46:35.924945-05	2130	Currie, Benjamin (L8) 506150 - Pommel Horse - None	3		41	1
3515	2015-11-05 18:46:35.925929-05	2131	Currie, Benjamin (L8) 506150 - Vault - None	3		41	1
3516	2015-11-05 18:46:35.926837-05	2132	Currie, Benjamin (L8) 506150 - Parallel Bars - None	3		41	1
3517	2015-11-05 18:46:35.927838-05	2133	Currie, Benjamin (L8) 506150 - High Bar - None	3		41	1
3518	2015-11-05 18:46:35.928733-05	2158	Davis, Dima (L8) 463970 - Floor - None	3		41	1
3519	2015-11-05 18:46:35.929624-05	2159	Davis, Dima (L8) 463970 - Rings - None	3		41	1
3520	2015-11-05 18:46:35.930516-05	2160	Davis, Dima (L8) 463970 - Pommel Horse - None	3		41	1
3521	2015-11-05 18:46:35.931453-05	2161	Davis, Dima (L8) 463970 - Vault - None	3		41	1
3522	2015-11-05 18:46:35.932344-05	2162	Davis, Dima (L8) 463970 - Parallel Bars - None	3		41	1
3523	2015-11-05 18:46:35.933268-05	2163	Davis, Dima (L8) 463970 - High Bar - None	3		41	1
3524	2015-11-05 18:46:35.934154-05	2992	Mills, Kevin (L8) 554553 - Floor - None	3		41	1
3525	2015-11-05 18:46:35.935039-05	2993	Mills, Kevin (L8) 554553 - Rings - None	3		41	1
3526	2015-11-05 18:46:35.93596-05	2994	Mills, Kevin (L8) 554553 - Pommel Horse - None	3		41	1
3527	2015-11-05 18:46:35.936846-05	2995	Mills, Kevin (L8) 554553 - Vault - None	3		41	1
3528	2015-11-05 18:46:35.937755-05	2996	Mills, Kevin (L8) 554553 - Parallel Bars - None	3		41	1
3529	2015-11-05 18:46:35.938686-05	2997	Mills, Kevin (L8) 554553 - High Bar - None	3		41	1
3530	2015-11-05 18:46:35.939572-05	2020	Callas, Jimmy (L10) 183567 - Floor - None	3		41	1
3531	2015-11-05 18:46:35.940546-05	2021	Callas, Jimmy (L10) 183567 - Rings - None	3		41	1
3532	2015-11-05 18:46:35.94147-05	2022	Callas, Jimmy (L10) 183567 - Pommel Horse - None	3		41	1
3533	2015-11-05 18:46:35.942359-05	2023	Callas, Jimmy (L10) 183567 - Vault - None	3		41	1
3534	2015-11-05 18:46:35.943271-05	2024	Callas, Jimmy (L10) 183567 - Parallel Bars - None	3		41	1
3535	2015-11-05 18:46:35.944158-05	2025	Callas, Jimmy (L10) 183567 - High Bar - None	3		41	1
3536	2015-11-05 18:46:35.945046-05	3148	Penn, Samuel (L10) 230564 - Floor - None	3		41	1
3537	2015-11-05 18:46:35.945972-05	3149	Penn, Samuel (L10) 230564 - Rings - None	3		41	1
3538	2015-11-05 18:46:35.946858-05	3150	Penn, Samuel (L10) 230564 - Pommel Horse - None	3		41	1
3539	2015-11-05 18:46:35.947746-05	3151	Penn, Samuel (L10) 230564 - Vault - None	3		41	1
3540	2015-11-05 18:46:35.948653-05	3152	Penn, Samuel (L10) 230564 - Parallel Bars - None	3		41	1
3541	2015-11-05 18:46:35.94954-05	3153	Penn, Samuel (L10) 230564 - High Bar - None	3		41	1
3542	2015-11-05 18:46:35.950427-05	3538	Valiente, Marcus (L10) 255148 - Floor - None	3		41	1
3543	2015-11-05 18:46:35.95131-05	3539	Valiente, Marcus (L10) 255148 - Rings - None	3		41	1
3544	2015-11-05 18:46:35.952191-05	3540	Valiente, Marcus (L10) 255148 - Pommel Horse - None	3		41	1
3545	2015-11-05 18:46:35.953072-05	3541	Valiente, Marcus (L10) 255148 - Vault - None	3		41	1
3546	2015-11-05 18:46:35.954083-05	3542	Valiente, Marcus (L10) 255148 - Parallel Bars - None	3		41	1
3547	2015-11-05 18:46:35.955099-05	3543	Valiente, Marcus (L10) 255148 - High Bar - None	3		41	1
3548	2015-11-05 18:46:35.956054-05	2314	Frempong, Nathaniel (L5) 951023 - Floor - None	3		41	1
3549	2015-11-05 18:46:35.95707-05	2315	Frempong, Nathaniel (L5) 951023 - Rings - None	3		41	1
3550	2015-11-05 18:46:35.958047-05	2316	Frempong, Nathaniel (L5) 951023 - Pommel Horse - None	3		41	1
3551	2015-11-05 18:46:35.958973-05	2317	Frempong, Nathaniel (L5) 951023 - Vault - None	3		41	1
3552	2015-11-05 18:46:35.959853-05	2318	Frempong, Nathaniel (L5) 951023 - Parallel Bars - None	3		41	1
3553	2015-11-05 18:46:35.960752-05	2319	Frempong, Nathaniel (L5) 951023 - High Bar - None	3		41	1
3554	2015-11-05 18:46:35.961641-05	2926	FLAGGED! Matti, Judah (L5) 951026 - Floor - None	3		41	1
3555	2015-11-05 18:46:35.96253-05	2927	FLAGGED! Matti, Judah (L5) 951026 - Rings - None	3		41	1
3556	2015-11-05 18:46:35.963454-05	2928	FLAGGED! Matti, Judah (L5) 951026 - Pommel Horse - None	3		41	1
3557	2015-11-05 18:46:35.96434-05	2929	FLAGGED! Matti, Judah (L5) 951026 - Vault - None	3		41	1
3558	2015-11-05 18:46:35.965223-05	2930	FLAGGED! Matti, Judah (L5) 951026 - Parallel Bars - None	3		41	1
3559	2015-11-05 18:46:35.966127-05	2931	FLAGGED! Matti, Judah (L5) 951026 - High Bar - None	3		41	1
3560	2015-11-05 18:46:35.967012-05	3418	FLAGGED! Slaton, Robbie (L5) 951022 - Floor - None	3		41	1
3561	2015-11-05 18:46:35.967894-05	3419	FLAGGED! Slaton, Robbie (L5) 951022 - Rings - None	3		41	1
3562	2015-11-05 18:46:35.968774-05	3420	FLAGGED! Slaton, Robbie (L5) 951022 - Pommel Horse - None	3		41	1
3563	2015-11-05 18:46:35.969729-05	3421	FLAGGED! Slaton, Robbie (L5) 951022 - Vault - None	3		41	1
3564	2015-11-05 18:46:35.970706-05	3422	FLAGGED! Slaton, Robbie (L5) 951022 - Parallel Bars - None	3		41	1
3565	2015-11-05 18:46:35.971696-05	3423	FLAGGED! Slaton, Robbie (L5) 951022 - High Bar - None	3		41	1
3566	2015-11-05 18:46:35.972612-05	3532	Valencia, Aaron (L5) 951024 - Floor - None	3		41	1
3567	2015-11-05 18:46:35.973591-05	3533	Valencia, Aaron (L5) 951024 - Rings - None	3		41	1
3568	2015-11-05 18:46:35.9745-05	3534	Valencia, Aaron (L5) 951024 - Pommel Horse - None	3		41	1
3569	2015-11-05 18:46:35.975415-05	3535	Valencia, Aaron (L5) 951024 - Vault - None	3		41	1
3570	2015-11-05 18:46:35.976306-05	3536	Valencia, Aaron (L5) 951024 - Parallel Bars - None	3		41	1
3571	2015-11-05 18:46:35.977188-05	3537	Valencia, Aaron (L5) 951024 - High Bar - None	3		41	1
3572	2015-11-05 18:46:35.978092-05	3016	FLAGGED! Moroney, David (L5) 632105 - Floor - None	3		41	1
3573	2015-11-05 18:46:35.978975-05	3017	FLAGGED! Moroney, David (L5) 632105 - Rings - None	3		41	1
3574	2015-11-05 18:46:35.979853-05	3018	FLAGGED! Moroney, David (L5) 632105 - Pommel Horse - None	3		41	1
3575	2015-11-05 18:46:35.980771-05	3019	FLAGGED! Moroney, David (L5) 632105 - Vault - None	3		41	1
3576	2015-11-05 18:46:35.981651-05	3020	FLAGGED! Moroney, David (L5) 632105 - Parallel Bars - None	3		41	1
3577	2015-11-05 18:46:35.982565-05	3021	FLAGGED! Moroney, David (L5) 632105 - High Bar - None	3		41	1
3578	2015-11-05 18:46:35.983467-05	3358	Shedrick, Xavier (L6) 632109 - Floor - None	3		41	1
3579	2015-11-05 18:46:35.984343-05	3359	Shedrick, Xavier (L6) 632109 - Rings - None	3		41	1
3580	2015-11-05 18:46:35.985234-05	3360	Shedrick, Xavier (L6) 632109 - Pommel Horse - None	3		41	1
3581	2015-11-05 18:46:35.986116-05	3361	Shedrick, Xavier (L6) 632109 - Vault - None	3		41	1
3582	2015-11-05 18:46:35.986992-05	3362	Shedrick, Xavier (L6) 632109 - Parallel Bars - None	3		41	1
3583	2015-11-05 18:46:35.987889-05	3363	Shedrick, Xavier (L6) 632109 - High Bar - None	3		41	1
3584	2015-11-05 18:46:35.988767-05	3502	Thompson, Ellis (L6) 632111 - Floor - None	3		41	1
3585	2015-11-05 18:46:35.989641-05	3503	Thompson, Ellis (L6) 632111 - Rings - None	3		41	1
3586	2015-11-05 18:46:35.990517-05	3504	Thompson, Ellis (L6) 632111 - Pommel Horse - None	3		41	1
3587	2015-11-05 18:46:35.991468-05	3505	Thompson, Ellis (L6) 632111 - Vault - None	3		41	1
3588	2015-11-05 18:46:35.992392-05	3506	Thompson, Ellis (L6) 632111 - Parallel Bars - None	3		41	1
3589	2015-11-05 18:46:35.993359-05	3507	Thompson, Ellis (L6) 632111 - High Bar - None	3		41	1
3590	2015-11-05 18:46:35.994315-05	2746	Kravet, Ethan (L10) 258301 - Floor - None	3		41	1
3591	2015-11-05 18:46:35.99526-05	2747	Kravet, Ethan (L10) 258301 - Rings - None	3		41	1
3592	2015-11-05 18:46:35.996202-05	2748	Kravet, Ethan (L10) 258301 - Pommel Horse - None	3		41	1
3593	2015-11-05 18:46:35.997176-05	2749	Kravet, Ethan (L10) 258301 - Vault - None	3		41	1
3594	2015-11-05 18:46:35.998104-05	2750	Kravet, Ethan (L10) 258301 - Parallel Bars - None	3		41	1
3595	2015-11-05 18:46:35.999076-05	2751	Kravet, Ethan (L10) 258301 - High Bar - None	3		41	1
3596	2015-11-05 18:46:36.00001-05	2830	Lewis, Stephen (L10) 298421 - Floor - None	3		41	1
3597	2015-11-05 18:46:36.001022-05	2831	Lewis, Stephen (L10) 298421 - Rings - None	3		41	1
3598	2015-11-05 18:46:36.001961-05	2832	Lewis, Stephen (L10) 298421 - Pommel Horse - None	3		41	1
3599	2015-11-05 18:46:36.00298-05	2833	Lewis, Stephen (L10) 298421 - Vault - None	3		41	1
3600	2015-11-05 18:46:36.00392-05	2834	Lewis, Stephen (L10) 298421 - Parallel Bars - None	3		41	1
3601	2015-11-05 18:46:36.004852-05	2835	Lewis, Stephen (L10) 298421 - High Bar - None	3		41	1
3602	2015-11-05 18:46:36.005837-05	2914	Massey, Avery (L10) 562189 - Floor - None	3		41	1
3603	2015-11-05 18:46:36.006824-05	2915	Massey, Avery (L10) 562189 - Rings - None	3		41	1
3604	2015-11-05 18:46:36.007741-05	2916	Massey, Avery (L10) 562189 - Pommel Horse - None	3		41	1
3605	2015-11-05 18:46:36.008652-05	2917	Massey, Avery (L10) 562189 - Vault - None	3		41	1
3606	2015-11-05 18:46:36.009569-05	2918	Massey, Avery (L10) 562189 - Parallel Bars - None	3		41	1
3607	2015-11-05 18:46:36.010508-05	2919	Massey, Avery (L10) 562189 - High Bar - None	3		41	1
3608	2015-11-05 18:46:36.011471-05	1912	Barrett, Dylan (L4) 1013307 - Floor - None	3		41	1
3609	2015-11-05 18:46:36.012438-05	1913	Barrett, Dylan (L4) 1013307 - Rings - None	3		41	1
3610	2015-11-05 18:46:36.013525-05	1914	Barrett, Dylan (L4) 1013307 - Pommel Horse - None	3		41	1
3611	2015-11-05 18:46:36.014628-05	1915	Barrett, Dylan (L4) 1013307 - Vault - None	3		41	1
3612	2015-11-05 18:46:36.01594-05	1916	Barrett, Dylan (L4) 1013307 - Parallel Bars - None	3		41	1
3613	2015-11-05 18:46:36.016951-05	1917	Barrett, Dylan (L4) 1013307 - High Bar - None	3		41	1
3614	2015-11-05 18:46:36.017895-05	2326	Gallo, Ashton (L4) 1013311 - Floor - None	3		41	1
3615	2015-11-05 18:46:36.018842-05	2327	Gallo, Ashton (L4) 1013311 - Rings - None	3		41	1
3616	2015-11-05 18:46:36.01982-05	2328	Gallo, Ashton (L4) 1013311 - Pommel Horse - None	3		41	1
3617	2015-11-05 18:46:36.020836-05	2329	Gallo, Ashton (L4) 1013311 - Vault - None	3		41	1
3618	2015-11-05 18:46:36.021797-05	2330	Gallo, Ashton (L4) 1013311 - Parallel Bars - None	3		41	1
3619	2015-11-05 18:46:36.022789-05	2331	Gallo, Ashton (L4) 1013311 - High Bar - None	3		41	1
3620	2015-11-05 18:46:36.023781-05	2434	FLAGGED! Greer, Marshall (L4) 960819 - Floor - None	3		41	1
3621	2015-11-05 18:46:36.024721-05	2435	FLAGGED! Greer, Marshall (L4) 960819 - Rings - None	3		41	1
3622	2015-11-05 18:46:36.025668-05	2436	FLAGGED! Greer, Marshall (L4) 960819 - Pommel Horse - None	3		41	1
3623	2015-11-05 18:46:36.026634-05	2437	FLAGGED! Greer, Marshall (L4) 960819 - Vault - None	3		41	1
3624	2015-11-05 18:46:36.02753-05	2438	FLAGGED! Greer, Marshall (L4) 960819 - Parallel Bars - None	3		41	1
3625	2015-11-05 18:46:36.02855-05	2439	FLAGGED! Greer, Marshall (L4) 960819 - High Bar - None	3		41	1
3626	2015-11-05 18:46:36.029594-05	2524	FLAGGED! Hastings, Connor (L4) 1018591 - Floor - None	3		41	1
3627	2015-11-05 18:46:36.030548-05	2525	FLAGGED! Hastings, Connor (L4) 1018591 - Rings - None	3		41	1
3628	2015-11-05 18:46:36.031497-05	2526	FLAGGED! Hastings, Connor (L4) 1018591 - Pommel Horse - None	3		41	1
3629	2015-11-05 18:46:36.032436-05	2527	FLAGGED! Hastings, Connor (L4) 1018591 - Vault - None	3		41	1
3630	2015-11-05 18:46:36.033358-05	2528	FLAGGED! Hastings, Connor (L4) 1018591 - Parallel Bars - None	3		41	1
3631	2015-11-05 18:46:36.034336-05	2529	FLAGGED! Hastings, Connor (L4) 1018591 - High Bar - None	3		41	1
3632	2015-11-05 18:46:36.035336-05	2620	Horrigan, Sean (L4) 960816 - Floor - None	3		41	1
3633	2015-11-05 18:46:36.036264-05	2621	Horrigan, Sean (L4) 960816 - Rings - None	3		41	1
3634	2015-11-05 18:46:36.03726-05	2622	Horrigan, Sean (L4) 960816 - Pommel Horse - None	3		41	1
3635	2015-11-05 18:46:36.038417-05	2623	Horrigan, Sean (L4) 960816 - Vault - None	3		41	1
3636	2015-11-05 18:46:36.039638-05	2624	Horrigan, Sean (L4) 960816 - Parallel Bars - None	3		41	1
3637	2015-11-05 18:46:36.040702-05	2625	Horrigan, Sean (L4) 960816 - High Bar - None	3		41	1
3638	2015-11-05 18:46:36.041707-05	2902	FLAGGED! Marquez, Jullian (L4) 1013460 - Floor - None	3		41	1
3639	2015-11-05 18:46:36.042667-05	2903	FLAGGED! Marquez, Jullian (L4) 1013460 - Rings - None	3		41	1
3640	2015-11-05 18:46:36.043612-05	2904	FLAGGED! Marquez, Jullian (L4) 1013460 - Pommel Horse - None	3		41	1
3641	2015-11-05 18:46:36.044582-05	2905	FLAGGED! Marquez, Jullian (L4) 1013460 - Vault - None	3		41	1
3642	2015-11-05 18:46:36.045677-05	2906	FLAGGED! Marquez, Jullian (L4) 1013460 - Parallel Bars - None	3		41	1
3643	2015-11-05 18:46:36.04667-05	2907	FLAGGED! Marquez, Jullian (L4) 1013460 - High Bar - None	3		41	1
3644	2015-11-05 18:46:36.047633-05	3556	Vey, James (L4) 1013306 - Floor - None	3		41	1
3645	2015-11-05 18:46:36.048587-05	3557	Vey, James (L4) 1013306 - Rings - None	3		41	1
3646	2015-11-05 18:46:36.049513-05	3558	Vey, James (L4) 1013306 - Pommel Horse - None	3		41	1
3647	2015-11-05 18:46:36.050453-05	3559	Vey, James (L4) 1013306 - Vault - None	3		41	1
3648	2015-11-05 18:46:36.05135-05	3560	Vey, James (L4) 1013306 - Parallel Bars - None	3		41	1
3649	2015-11-05 18:46:36.052243-05	3561	Vey, James (L4) 1013306 - High Bar - None	3		41	1
3650	2015-11-05 18:46:36.053163-05	3616	Wilmot, Gregory (L4) 1013314 - Floor - None	3		41	1
3651	2015-11-05 18:46:36.05408-05	3617	Wilmot, Gregory (L4) 1013314 - Rings - None	3		41	1
3652	2015-11-05 18:46:36.055007-05	3618	Wilmot, Gregory (L4) 1013314 - Pommel Horse - None	3		41	1
3653	2015-11-05 18:46:36.056003-05	3619	Wilmot, Gregory (L4) 1013314 - Vault - None	3		41	1
3654	2015-11-05 18:46:36.056965-05	3620	Wilmot, Gregory (L4) 1013314 - Parallel Bars - None	3		41	1
3655	2015-11-05 18:46:36.057912-05	3621	Wilmot, Gregory (L4) 1013314 - High Bar - None	3		41	1
3656	2015-11-05 18:46:36.058827-05	1924	Becker, Anderson (L5) 635665 - Floor - None	3		41	1
3657	2015-11-05 18:46:36.0598-05	1925	Becker, Anderson (L5) 635665 - Rings - None	3		41	1
3658	2015-11-05 18:46:36.060688-05	1926	Becker, Anderson (L5) 635665 - Pommel Horse - None	3		41	1
3659	2015-11-05 18:46:36.061575-05	1927	Becker, Anderson (L5) 635665 - Vault - None	3		41	1
3660	2015-11-05 18:46:36.062458-05	1928	Becker, Anderson (L5) 635665 - Parallel Bars - None	3		41	1
3661	2015-11-05 18:46:36.06342-05	1929	Becker, Anderson (L5) 635665 - High Bar - None	3		41	1
3662	2015-11-05 18:46:36.064422-05	2836	Liang, Will (L5) 635674 - Floor - None	3		41	1
3663	2015-11-05 18:46:36.065348-05	2837	Liang, Will (L5) 635674 - Rings - None	3		41	1
3664	2015-11-05 18:46:36.066299-05	2838	Liang, Will (L5) 635674 - Pommel Horse - None	3		41	1
3665	2015-11-05 18:46:36.067282-05	2839	Liang, Will (L5) 635674 - Vault - None	3		41	1
3666	2015-11-05 18:46:36.068215-05	2840	Liang, Will (L5) 635674 - Parallel Bars - None	3		41	1
3667	2015-11-05 18:46:36.069146-05	2841	Liang, Will (L5) 635674 - High Bar - None	3		41	1
3668	2015-11-05 18:46:36.070099-05	3052	Napolitano, Enzo (L5) 1013320 - Floor - None	3		41	1
3669	2015-11-05 18:46:36.071033-05	3053	Napolitano, Enzo (L5) 1013320 - Rings - None	3		41	1
3670	2015-11-05 18:46:36.071929-05	3054	Napolitano, Enzo (L5) 1013320 - Pommel Horse - None	3		41	1
3671	2015-11-05 18:46:36.072964-05	3055	Napolitano, Enzo (L5) 1013320 - Vault - None	3		41	1
3672	2015-11-05 18:46:36.074004-05	3056	Napolitano, Enzo (L5) 1013320 - Parallel Bars - None	3		41	1
3673	2015-11-05 18:46:36.075032-05	3057	Napolitano, Enzo (L5) 1013320 - High Bar - None	3		41	1
3674	2015-11-05 18:46:36.076054-05	3058	Nesspor, Ryan (L5) 575912 - Floor - None	3		41	1
3675	2015-11-05 18:46:36.077064-05	3059	Nesspor, Ryan (L5) 575912 - Rings - None	3		41	1
3676	2015-11-05 18:46:36.078079-05	3060	Nesspor, Ryan (L5) 575912 - Pommel Horse - None	3		41	1
3677	2015-11-05 18:46:36.079086-05	3061	Nesspor, Ryan (L5) 575912 - Vault - None	3		41	1
3678	2015-11-05 18:46:36.080067-05	3062	Nesspor, Ryan (L5) 575912 - Parallel Bars - None	3		41	1
3679	2015-11-05 18:46:36.081074-05	3063	Nesspor, Ryan (L5) 575912 - High Bar - None	3		41	1
3680	2015-11-05 18:46:36.082083-05	3388	Silao, Zachary (L5) 960821 - Floor - None	3		41	1
3681	2015-11-05 18:46:36.082985-05	3389	Silao, Zachary (L5) 960821 - Rings - None	3		41	1
3682	2015-11-05 18:46:36.083855-05	3390	Silao, Zachary (L5) 960821 - Pommel Horse - None	3		41	1
3683	2015-11-05 18:46:36.084771-05	3391	Silao, Zachary (L5) 960821 - Vault - None	3		41	1
3684	2015-11-05 18:46:36.085638-05	3392	Silao, Zachary (L5) 960821 - Parallel Bars - None	3		41	1
3685	2015-11-05 18:46:36.086561-05	3393	Silao, Zachary (L5) 960821 - High Bar - None	3		41	1
3686	2015-11-05 18:46:36.087467-05	1960	Black, Oliver (L6) 635671 - Floor - None	3		41	1
3687	2015-11-05 18:46:36.088373-05	1961	Black, Oliver (L6) 635671 - Rings - None	3		41	1
3688	2015-11-05 18:46:36.089257-05	1962	Black, Oliver (L6) 635671 - Pommel Horse - None	3		41	1
3689	2015-11-05 18:46:36.090144-05	1963	Black, Oliver (L6) 635671 - Vault - None	3		41	1
3690	2015-11-05 18:46:36.091026-05	1964	Black, Oliver (L6) 635671 - Parallel Bars - None	3		41	1
3691	2015-11-05 18:46:36.091907-05	1965	Black, Oliver (L6) 635671 - High Bar - None	3		41	1
3692	2015-11-05 18:46:36.092869-05	2644	Jackson, Ryan (L6) 575845 - Floor - None	3		41	1
3693	2015-11-05 18:46:36.093861-05	2645	Jackson, Ryan (L6) 575845 - Rings - None	3		41	1
3694	2015-11-05 18:46:36.09483-05	2646	Jackson, Ryan (L6) 575845 - Pommel Horse - None	3		41	1
3695	2015-11-05 18:46:36.095818-05	2647	Jackson, Ryan (L6) 575845 - Vault - None	3		41	1
3696	2015-11-05 18:46:36.096752-05	2648	Jackson, Ryan (L6) 575845 - Parallel Bars - None	3		41	1
3697	2015-11-05 18:46:36.097682-05	2649	Jackson, Ryan (L6) 575845 - High Bar - None	3		41	1
3698	2015-11-05 18:46:36.098644-05	3238	Rosenberg, Benjamin (L6) 461900 - Floor - None	3		41	1
3699	2015-11-05 18:46:36.099539-05	3239	Rosenberg, Benjamin (L6) 461900 - Rings - None	3		41	1
3700	2015-11-05 18:46:36.100429-05	3240	Rosenberg, Benjamin (L6) 461900 - Pommel Horse - None	3		41	1
3701	2015-11-05 18:46:36.101345-05	3241	Rosenberg, Benjamin (L6) 461900 - Vault - None	3		41	1
3702	2015-11-05 18:46:36.102239-05	3242	Rosenberg, Benjamin (L6) 461900 - Parallel Bars - None	3		41	1
3703	2015-11-05 18:46:36.103203-05	3243	Rosenberg, Benjamin (L6) 461900 - High Bar - None	3		41	1
3704	2015-11-05 18:46:36.104191-05	2716	FLAGGED! Kelly, Boaz (L7) 575925 - Floor - None	3		41	1
3705	2015-11-05 18:46:36.105149-05	2717	FLAGGED! Kelly, Boaz (L7) 575925 - Rings - None	3		41	1
3706	2015-11-05 18:46:36.106282-05	2718	FLAGGED! Kelly, Boaz (L7) 575925 - Pommel Horse - None	3		41	1
3707	2015-11-05 18:46:36.107314-05	2719	FLAGGED! Kelly, Boaz (L7) 575925 - Vault - None	3		41	1
3708	2015-11-05 18:46:36.108297-05	2720	FLAGGED! Kelly, Boaz (L7) 575925 - Parallel Bars - None	3		41	1
3709	2015-11-05 18:46:36.109218-05	2721	FLAGGED! Kelly, Boaz (L7) 575925 - High Bar - None	3		41	1
3710	2015-11-05 18:46:36.110147-05	2044	FLAGGED! Christopher, Gavin (L9) 433826 - Floor - None	3		41	1
3711	2015-11-05 18:46:36.11106-05	2045	FLAGGED! Christopher, Gavin (L9) 433826 - Rings - None	3		41	1
3712	2015-11-05 18:46:36.112012-05	2046	FLAGGED! Christopher, Gavin (L9) 433826 - Pommel Horse - None	3		41	1
3713	2015-11-05 18:46:36.112906-05	2047	FLAGGED! Christopher, Gavin (L9) 433826 - Vault - None	3		41	1
3714	2015-11-05 18:46:36.113854-05	2048	FLAGGED! Christopher, Gavin (L9) 433826 - Parallel Bars - None	3		41	1
3715	2015-11-05 18:46:36.114739-05	2049	FLAGGED! Christopher, Gavin (L9) 433826 - High Bar - None	3		41	1
3716	2015-11-05 18:46:36.115659-05	2794	FLAGGED! Lawler, Owen (L9) 584620 - Floor - None	3		41	1
3717	2015-11-05 18:46:36.116541-05	2795	FLAGGED! Lawler, Owen (L9) 584620 - Rings - None	3		41	1
3718	2015-11-05 18:46:36.117422-05	2796	FLAGGED! Lawler, Owen (L9) 584620 - Pommel Horse - None	3		41	1
3719	2015-11-05 18:46:36.118361-05	2797	FLAGGED! Lawler, Owen (L9) 584620 - Vault - None	3		41	1
3720	2015-11-05 18:46:36.119362-05	2798	FLAGGED! Lawler, Owen (L9) 584620 - Parallel Bars - None	3		41	1
3721	2015-11-05 18:46:36.120248-05	2799	FLAGGED! Lawler, Owen (L9) 584620 - High Bar - None	3		41	1
3722	2015-11-05 18:46:36.121124-05	3244	Rosendahl, Matthew (L9) 385832 - Floor - None	3		41	1
3723	2015-11-05 18:46:36.122158-05	3245	Rosendahl, Matthew (L9) 385832 - Rings - None	3		41	1
3724	2015-11-05 18:46:36.123102-05	3246	Rosendahl, Matthew (L9) 385832 - Pommel Horse - None	3		41	1
3725	2015-11-05 18:46:36.12406-05	3247	Rosendahl, Matthew (L9) 385832 - Vault - None	3		41	1
3726	2015-11-05 18:46:36.124969-05	3248	Rosendahl, Matthew (L9) 385832 - Parallel Bars - None	3		41	1
3727	2015-11-05 18:46:36.125946-05	3249	Rosendahl, Matthew (L9) 385832 - High Bar - None	3		41	1
3728	2015-11-05 18:46:36.126857-05	3268	Rutz, Sebastian (L9) 385810 - Floor - None	3		41	1
3729	2015-11-05 18:46:36.127904-05	3269	Rutz, Sebastian (L9) 385810 - Rings - None	3		41	1
3730	2015-11-05 18:46:36.128887-05	3270	Rutz, Sebastian (L9) 385810 - Pommel Horse - None	3		41	1
3731	2015-11-05 18:46:36.129821-05	3271	Rutz, Sebastian (L9) 385810 - Vault - None	3		41	1
3732	2015-11-05 18:46:36.130849-05	3272	Rutz, Sebastian (L9) 385810 - Parallel Bars - None	3		41	1
3733	2015-11-05 18:46:36.131938-05	3273	Rutz, Sebastian (L9) 385810 - High Bar - None	3		41	1
3734	2015-11-05 18:46:36.133091-05	2320	FLAGGED! Fritz, Brendan (L10) 243962 - Floor - None	3		41	1
3735	2015-11-05 18:46:36.134098-05	2321	FLAGGED! Fritz, Brendan (L10) 243962 - Rings - None	3		41	1
3736	2015-11-05 18:46:36.135-05	2322	FLAGGED! Fritz, Brendan (L10) 243962 - Pommel Horse - None	3		41	1
3737	2015-11-05 18:46:36.13601-05	2323	FLAGGED! Fritz, Brendan (L10) 243962 - Vault - None	3		41	1
3738	2015-11-05 18:46:36.136946-05	2324	FLAGGED! Fritz, Brendan (L10) 243962 - Parallel Bars - None	3		41	1
3739	2015-11-05 18:46:36.138059-05	2325	FLAGGED! Fritz, Brendan (L10) 243962 - High Bar - None	3		41	1
3740	2015-11-05 18:46:36.139044-05	2806	FLAGGED! Leonard, Cameron (L10) 204504 - Floor - None	3		41	1
3741	2015-11-05 18:46:36.139979-05	2807	FLAGGED! Leonard, Cameron (L10) 204504 - Rings - None	3		41	1
3742	2015-11-05 18:46:36.140927-05	2808	FLAGGED! Leonard, Cameron (L10) 204504 - Pommel Horse - None	3		41	1
3743	2015-11-05 18:46:36.141858-05	2809	FLAGGED! Leonard, Cameron (L10) 204504 - Vault - None	3		41	1
3744	2015-11-05 18:46:36.142799-05	2810	FLAGGED! Leonard, Cameron (L10) 204504 - Parallel Bars - None	3		41	1
3745	2015-11-05 18:46:36.1437-05	2811	FLAGGED! Leonard, Cameron (L10) 204504 - High Bar - None	3		41	1
3746	2015-11-05 18:46:36.144591-05	3448	Steele, Isaac (L4)  - Floor - None	3		41	1
3747	2015-11-05 18:46:36.145506-05	3449	Steele, Isaac (L4)  - Rings - None	3		41	1
3748	2015-11-05 18:46:36.14643-05	3450	Steele, Isaac (L4)  - Pommel Horse - None	3		41	1
3749	2015-11-05 18:46:36.147328-05	3451	Steele, Isaac (L4)  - Vault - None	3		41	1
3750	2015-11-05 18:46:36.148265-05	3452	Steele, Isaac (L4)  - Parallel Bars - None	3		41	1
3751	2015-11-05 18:46:36.149218-05	3453	Steele, Isaac (L4)  - High Bar - None	3		41	1
3752	2015-11-05 18:46:36.150125-05	1870	Avatara, Rowan (L4) 1016535 - Floor - None	3		41	1
3753	2015-11-05 18:46:36.151009-05	1871	Avatara, Rowan (L4) 1016535 - Rings - None	3		41	1
3754	2015-11-05 18:46:36.1519-05	1872	Avatara, Rowan (L4) 1016535 - Pommel Horse - None	3		41	1
3755	2015-11-05 18:46:36.152779-05	1873	Avatara, Rowan (L4) 1016535 - Vault - None	3		41	1
3756	2015-11-05 18:46:36.153657-05	1874	Avatara, Rowan (L4) 1016535 - Parallel Bars - None	3		41	1
3757	2015-11-05 18:46:36.154557-05	1875	Avatara, Rowan (L4) 1016535 - High Bar - None	3		41	1
3758	2015-11-05 18:46:36.155473-05	2272	Felix, Gavin (L4) 1000825 - Floor - None	3		41	1
3759	2015-11-05 18:46:36.156611-05	2273	Felix, Gavin (L4) 1000825 - Rings - None	3		41	1
3760	2015-11-05 18:46:36.157701-05	2274	Felix, Gavin (L4) 1000825 - Pommel Horse - None	3		41	1
3761	2015-11-05 18:46:36.158725-05	2275	Felix, Gavin (L4) 1000825 - Vault - None	3		41	1
3762	2015-11-05 18:46:36.159736-05	2276	Felix, Gavin (L4) 1000825 - Parallel Bars - None	3		41	1
3763	2015-11-05 18:46:36.160759-05	2277	Felix, Gavin (L4) 1000825 - High Bar - None	3		41	1
3764	2015-11-05 18:46:36.161696-05	2404	Gonslaves, Aaron (L4) 1007598 - Floor - None	3		41	1
3765	2015-11-05 18:46:36.162637-05	2405	Gonslaves, Aaron (L4) 1007598 - Rings - None	3		41	1
3766	2015-11-05 18:46:36.163637-05	2406	Gonslaves, Aaron (L4) 1007598 - Pommel Horse - None	3		41	1
3767	2015-11-05 18:46:36.164586-05	2407	Gonslaves, Aaron (L4) 1007598 - Vault - None	3		41	1
3768	2015-11-05 18:46:36.165626-05	2408	Gonslaves, Aaron (L4) 1007598 - Parallel Bars - None	3		41	1
3769	2015-11-05 18:46:36.166578-05	2409	Gonslaves, Aaron (L4) 1007598 - High Bar - None	3		41	1
3770	2015-11-05 18:46:36.167575-05	2356	Geibel, Owen (L4) 1000824 - Floor - None	3		41	1
3771	2015-11-05 18:46:36.168489-05	2357	Geibel, Owen (L4) 1000824 - Rings - None	3		41	1
3772	2015-11-05 18:46:36.169465-05	2358	Geibel, Owen (L4) 1000824 - Pommel Horse - None	3		41	1
3773	2015-11-05 18:46:36.170443-05	2359	Geibel, Owen (L4) 1000824 - Vault - None	3		41	1
3774	2015-11-05 18:46:36.17137-05	2360	Geibel, Owen (L4) 1000824 - Parallel Bars - None	3		41	1
3775	2015-11-05 18:46:36.172306-05	2361	Geibel, Owen (L4) 1000824 - High Bar - None	3		41	1
3776	2015-11-05 18:46:36.173251-05	3646	Zolper, Adam (L4) 1000826 - Floor - None	3		41	1
3777	2015-11-05 18:46:36.174178-05	3647	Zolper, Adam (L4) 1000826 - Rings - None	3		41	1
3778	2015-11-05 18:46:36.17513-05	3648	Zolper, Adam (L4) 1000826 - Pommel Horse - None	3		41	1
3779	2015-11-05 18:46:36.176063-05	3649	Zolper, Adam (L4) 1000826 - Vault - None	3		41	1
3780	2015-11-05 18:46:36.177013-05	3650	Zolper, Adam (L4) 1000826 - Parallel Bars - None	3		41	1
3781	2015-11-05 18:46:36.177937-05	3651	Zolper, Adam (L4) 1000826 - High Bar - None	3		41	1
3782	2015-11-05 18:46:36.178821-05	3340	Secord, Joshua (L4) 950067 - Floor - None	3		41	1
3783	2015-11-05 18:46:36.179738-05	3341	Secord, Joshua (L4) 950067 - Rings - None	3		41	1
3784	2015-11-05 18:46:36.180646-05	3342	Secord, Joshua (L4) 950067 - Pommel Horse - None	3		41	1
3785	2015-11-05 18:46:36.181579-05	3343	Secord, Joshua (L4) 950067 - Vault - None	3		41	1
3786	2015-11-05 18:46:36.182487-05	3344	Secord, Joshua (L4) 950067 - Parallel Bars - None	3		41	1
3787	2015-11-05 18:46:36.183403-05	3345	Secord, Joshua (L4) 950067 - High Bar - None	3		41	1
3788	2015-11-05 18:46:36.184304-05	3346	Secord, Zachary (L4) 950068 - Floor - None	3		41	1
3789	2015-11-05 18:46:36.185226-05	3347	Secord, Zachary (L4) 950068 - Rings - None	3		41	1
3790	2015-11-05 18:46:36.186156-05	3348	Secord, Zachary (L4) 950068 - Pommel Horse - None	3		41	1
3791	2015-11-05 18:46:36.187077-05	3349	Secord, Zachary (L4) 950068 - Vault - None	3		41	1
3792	2015-11-05 18:46:36.188019-05	3350	Secord, Zachary (L4) 950068 - Parallel Bars - None	3		41	1
3793	2015-11-05 18:46:36.189069-05	3351	Secord, Zachary (L4) 950068 - High Bar - None	3		41	1
3794	2015-11-05 18:46:36.19-05	1948	Biggs, Spencer (L5) 636882 - Floor - None	3		41	1
3795	2015-11-05 18:46:36.190915-05	1949	Biggs, Spencer (L5) 636882 - Rings - None	3		41	1
3796	2015-11-05 18:46:36.191895-05	1950	Biggs, Spencer (L5) 636882 - Pommel Horse - None	3		41	1
3797	2015-11-05 18:46:36.192854-05	1951	Biggs, Spencer (L5) 636882 - Vault - None	3		41	1
3798	2015-11-05 18:46:36.19377-05	1952	Biggs, Spencer (L5) 636882 - Parallel Bars - None	3		41	1
3799	2015-11-05 18:46:36.194677-05	1953	Biggs, Spencer (L5) 636882 - High Bar - None	3		41	1
3800	2015-11-05 18:46:36.195561-05	2200	DiPillo, AJ (L5) 950066 - Floor - None	3		41	1
3801	2015-11-05 18:46:36.196571-05	2201	DiPillo, AJ (L5) 950066 - Rings - None	3		41	1
3802	2015-11-05 18:46:36.197573-05	2202	DiPillo, AJ (L5) 950066 - Pommel Horse - None	3		41	1
3803	2015-11-05 18:46:36.1985-05	2203	DiPillo, AJ (L5) 950066 - Vault - None	3		41	1
3804	2015-11-05 18:46:36.19945-05	2204	DiPillo, AJ (L5) 950066 - Parallel Bars - None	3		41	1
3805	2015-11-05 18:46:36.200453-05	2205	DiPillo, AJ (L5) 950066 - High Bar - None	3		41	1
3806	2015-11-05 18:46:36.201408-05	2350	Geibel, Austin (L5) 950071 - Floor - None	3		41	1
3807	2015-11-05 18:46:36.20234-05	2351	Geibel, Austin (L5) 950071 - Rings - None	3		41	1
3808	2015-11-05 18:46:36.203573-05	2352	Geibel, Austin (L5) 950071 - Pommel Horse - None	3		41	1
3809	2015-11-05 18:46:36.204602-05	2353	Geibel, Austin (L5) 950071 - Vault - None	3		41	1
3810	2015-11-05 18:46:36.205551-05	2354	Geibel, Austin (L5) 950071 - Parallel Bars - None	3		41	1
3811	2015-11-05 18:46:36.206553-05	2355	Geibel, Austin (L5) 950071 - High Bar - None	3		41	1
3812	2015-11-05 18:46:36.207529-05	2824	Lewis, Spencer (L5) 641686 - Floor - None	3		41	1
3813	2015-11-05 18:46:36.208481-05	2825	Lewis, Spencer (L5) 641686 - Rings - None	3		41	1
3814	2015-11-05 18:46:36.209493-05	2826	Lewis, Spencer (L5) 641686 - Pommel Horse - None	3		41	1
3815	2015-11-05 18:46:36.210491-05	2827	Lewis, Spencer (L5) 641686 - Vault - None	3		41	1
3816	2015-11-05 18:46:36.211494-05	2828	Lewis, Spencer (L5) 641686 - Parallel Bars - None	3		41	1
3817	2015-11-05 18:46:36.212453-05	2829	Lewis, Spencer (L5) 641686 - High Bar - None	3		41	1
3818	2015-11-05 18:46:36.213423-05	2890	March, Oliver (L5) 952156 - Floor - None	3		41	1
3819	2015-11-05 18:46:36.214402-05	2891	March, Oliver (L5) 952156 - Rings - None	3		41	1
3820	2015-11-05 18:46:36.21541-05	2892	March, Oliver (L5) 952156 - Pommel Horse - None	3		41	1
3821	2015-11-05 18:46:36.216351-05	2893	March, Oliver (L5) 952156 - Vault - None	3		41	1
3822	2015-11-05 18:46:36.217278-05	2894	March, Oliver (L5) 952156 - Parallel Bars - None	3		41	1
3823	2015-11-05 18:46:36.218196-05	2895	March, Oliver (L5) 952156 - High Bar - None	3		41	1
3824	2015-11-05 18:46:36.219109-05	3166	Pohorylo, Maksym (L5) 950070 - Floor - None	3		41	1
3825	2015-11-05 18:46:36.22002-05	3167	Pohorylo, Maksym (L5) 950070 - Rings - None	3		41	1
3826	2015-11-05 18:46:36.220945-05	3168	Pohorylo, Maksym (L5) 950070 - Pommel Horse - None	3		41	1
3827	2015-11-05 18:46:36.221834-05	3169	Pohorylo, Maksym (L5) 950070 - Vault - None	3		41	1
3828	2015-11-05 18:46:36.222819-05	3170	Pohorylo, Maksym (L5) 950070 - Parallel Bars - None	3		41	1
3829	2015-11-05 18:46:36.223822-05	3171	Pohorylo, Maksym (L5) 950070 - High Bar - None	3		41	1
3830	2015-11-05 18:46:36.224756-05	3298	Salisbury, Sean (L5) 636887 - Floor - None	3		41	1
3831	2015-11-05 18:46:36.225674-05	3299	Salisbury, Sean (L5) 636887 - Rings - None	3		41	1
3832	2015-11-05 18:46:36.226585-05	3300	Salisbury, Sean (L5) 636887 - Pommel Horse - None	3		41	1
3833	2015-11-05 18:46:36.22758-05	3301	Salisbury, Sean (L5) 636887 - Vault - None	3		41	1
3834	2015-11-05 18:46:36.228492-05	3302	Salisbury, Sean (L5) 636887 - Parallel Bars - None	3		41	1
3835	2015-11-05 18:46:36.229382-05	3303	Salisbury, Sean (L5) 636887 - High Bar - None	3		41	1
3836	2015-11-05 18:46:36.23027-05	3526	Uy, Ryan (L5) 978410 - Floor - None	3		41	1
3837	2015-11-05 18:46:36.231159-05	3527	Uy, Ryan (L5) 978410 - Rings - None	3		41	1
3838	2015-11-05 18:46:36.232045-05	3528	Uy, Ryan (L5) 978410 - Pommel Horse - None	3		41	1
3839	2015-11-05 18:46:36.233187-05	3529	Uy, Ryan (L5) 978410 - Vault - None	3		41	1
3840	2015-11-05 18:46:36.234071-05	3530	Uy, Ryan (L5) 978410 - Parallel Bars - None	3		41	1
3841	2015-11-05 18:46:36.23499-05	3531	Uy, Ryan (L5) 978410 - High Bar - None	3		41	1
3842	2015-11-05 18:46:36.235962-05	3496	FLAGGED! Thomas, Casey (L6) 477309 - Floor - None	3		41	1
3843	2015-11-05 18:46:36.23685-05	3497	FLAGGED! Thomas, Casey (L6) 477309 - Rings - None	3		41	1
3844	2015-11-05 18:46:36.237849-05	3498	FLAGGED! Thomas, Casey (L6) 477309 - Pommel Horse - None	3		41	1
3845	2015-11-05 18:46:36.238748-05	3499	FLAGGED! Thomas, Casey (L6) 477309 - Vault - None	3		41	1
3846	2015-11-05 18:46:36.239739-05	3500	FLAGGED! Thomas, Casey (L6) 477309 - Parallel Bars - None	3		41	1
3847	2015-11-05 18:46:36.240633-05	3501	FLAGGED! Thomas, Casey (L6) 477309 - High Bar - None	3		41	1
3848	2015-11-05 18:46:36.241522-05	2602	Homan, Connor (L6) 578894 - Floor - None	3		41	1
3849	2015-11-05 18:46:36.242406-05	2603	Homan, Connor (L6) 578894 - Rings - None	3		41	1
3850	2015-11-05 18:46:36.243322-05	2604	Homan, Connor (L6) 578894 - Pommel Horse - None	3		41	1
3851	2015-11-05 18:46:36.244221-05	2605	Homan, Connor (L6) 578894 - Vault - None	3		41	1
3852	2015-11-05 18:46:36.245179-05	2606	Homan, Connor (L6) 578894 - Parallel Bars - None	3		41	1
3853	2015-11-05 18:46:36.24611-05	2607	Homan, Connor (L6) 578894 - High Bar - None	3		41	1
3854	2015-11-05 18:46:36.247041-05	2788	Langdon, TJ (L7) 424073 - Floor - None	3		41	1
3855	2015-11-05 18:46:36.248039-05	2789	Langdon, TJ (L7) 424073 - Rings - None	3		41	1
3856	2015-11-05 18:46:36.248993-05	2790	Langdon, TJ (L7) 424073 - Pommel Horse - None	3		41	1
3857	2015-11-05 18:46:36.249897-05	2791	Langdon, TJ (L7) 424073 - Vault - None	3		41	1
3858	2015-11-05 18:46:36.250786-05	2792	Langdon, TJ (L7) 424073 - Parallel Bars - None	3		41	1
3859	2015-11-05 18:46:36.251671-05	2793	Langdon, TJ (L7) 424073 - High Bar - None	3		41	1
3860	2015-11-05 18:46:36.252553-05	2428	Graves, Edris (L7) 532060 - Floor - None	3		41	1
3861	2015-11-05 18:46:36.253529-05	2429	Graves, Edris (L7) 532060 - Rings - None	3		41	1
3862	2015-11-05 18:46:36.254557-05	2430	Graves, Edris (L7) 532060 - Pommel Horse - None	3		41	1
3863	2015-11-05 18:46:36.25559-05	2431	Graves, Edris (L7) 532060 - Vault - None	3		41	1
3864	2015-11-05 18:46:36.25672-05	2432	Graves, Edris (L7) 532060 - Parallel Bars - None	3		41	1
3865	2015-11-05 18:46:36.257745-05	2433	Graves, Edris (L7) 532060 - High Bar - None	3		41	1
3866	2015-11-05 18:46:36.2587-05	3568	Walchuk, Kyle (L8) 505115 - Floor - None	3		41	1
3867	2015-11-05 18:46:36.259612-05	3569	Walchuk, Kyle (L8) 505115 - Rings - None	3		41	1
3868	2015-11-05 18:46:36.260525-05	3570	Walchuk, Kyle (L8) 505115 - Pommel Horse - None	3		41	1
3869	2015-11-05 18:46:36.261414-05	3571	Walchuk, Kyle (L8) 505115 - Vault - None	3		41	1
3870	2015-11-05 18:46:36.262301-05	3572	Walchuk, Kyle (L8) 505115 - Parallel Bars - None	3		41	1
3871	2015-11-05 18:46:36.263212-05	3573	Walchuk, Kyle (L8) 505115 - High Bar - None	3		41	1
3872	2015-11-05 18:46:36.264093-05	1882	Bachman, Liam (L9) 377434 - Floor - None	3		41	1
3873	2015-11-05 18:46:36.264975-05	1883	Bachman, Liam (L9) 377434 - Rings - None	3		41	1
3874	2015-11-05 18:46:36.265955-05	1884	Bachman, Liam (L9) 377434 - Pommel Horse - None	3		41	1
3875	2015-11-05 18:46:36.266839-05	1885	Bachman, Liam (L9) 377434 - Vault - None	3		41	1
3876	2015-11-05 18:46:36.267723-05	1886	Bachman, Liam (L9) 377434 - Parallel Bars - None	3		41	1
3877	2015-11-05 18:46:36.268687-05	1887	Bachman, Liam (L9) 377434 - High Bar - None	3		41	1
3878	2015-11-05 18:46:36.269658-05	3316	Scheck, Jackson (L9) 374903 - Floor - None	3		41	1
3879	2015-11-05 18:46:36.270594-05	3317	Scheck, Jackson (L9) 374903 - Rings - None	3		41	1
3880	2015-11-05 18:46:36.27155-05	3318	Scheck, Jackson (L9) 374903 - Pommel Horse - None	3		41	1
3881	2015-11-05 18:46:36.272533-05	3319	Scheck, Jackson (L9) 374903 - Vault - None	3		41	1
3882	2015-11-05 18:46:36.273528-05	3320	Scheck, Jackson (L9) 374903 - Parallel Bars - None	3		41	1
3883	2015-11-05 18:46:36.274474-05	3321	Scheck, Jackson (L9) 374903 - High Bar - None	3		41	1
3884	2015-11-05 18:46:36.275417-05	2074	Clark, Kieran (L9) 488032 - Floor - None	3		41	1
3885	2015-11-05 18:46:36.27637-05	2075	Clark, Kieran (L9) 488032 - Rings - None	3		41	1
3886	2015-11-05 18:46:36.277281-05	2076	Clark, Kieran (L9) 488032 - Pommel Horse - None	3		41	1
3887	2015-11-05 18:46:36.278181-05	2077	Clark, Kieran (L9) 488032 - Vault - None	3		41	1
3888	2015-11-05 18:46:36.279081-05	2078	Clark, Kieran (L9) 488032 - Parallel Bars - None	3		41	1
3889	2015-11-05 18:46:36.27998-05	2079	Clark, Kieran (L9) 488032 - High Bar - None	3		41	1
3890	2015-11-05 18:46:36.280875-05	3112	Overman, Andrew (L9) 505112 - Floor - None	3		41	1
3891	2015-11-05 18:46:36.281751-05	3113	Overman, Andrew (L9) 505112 - Rings - None	3		41	1
3892	2015-11-05 18:46:36.28265-05	3114	Overman, Andrew (L9) 505112 - Pommel Horse - None	3		41	1
3893	2015-11-05 18:46:36.283537-05	3115	Overman, Andrew (L9) 505112 - Vault - None	3		41	1
3894	2015-11-05 18:46:36.284415-05	3116	Overman, Andrew (L9) 505112 - Parallel Bars - None	3		41	1
3895	2015-11-05 18:46:36.285403-05	3117	Overman, Andrew (L9) 505112 - High Bar - None	3		41	1
3896	2015-11-05 18:46:36.286355-05	2122	Cunane, Collin (L9) 423834 - Floor - None	3		41	1
3897	2015-11-05 18:46:36.28726-05	2123	Cunane, Collin (L9) 423834 - Rings - None	3		41	1
3898	2015-11-05 18:46:36.288158-05	2124	Cunane, Collin (L9) 423834 - Pommel Horse - None	3		41	1
3899	2015-11-05 18:46:36.289053-05	2125	Cunane, Collin (L9) 423834 - Vault - None	3		41	1
3900	2015-11-05 18:46:36.289947-05	2126	Cunane, Collin (L9) 423834 - Parallel Bars - None	3		41	1
3901	2015-11-05 18:46:36.29084-05	2127	Cunane, Collin (L9) 423834 - High Bar - None	3		41	1
3902	2015-11-05 18:46:36.291715-05	2110	Cramer, Joe (L10) 258877 - Floor - None	3		41	1
3903	2015-11-05 18:46:36.292592-05	2111	Cramer, Joe (L10) 258877 - Rings - None	3		41	1
3904	2015-11-05 18:46:36.293508-05	2112	Cramer, Joe (L10) 258877 - Pommel Horse - None	3		41	1
3905	2015-11-05 18:46:36.294435-05	2113	Cramer, Joe (L10) 258877 - Vault - None	3		41	1
3906	2015-11-05 18:46:36.295358-05	2114	Cramer, Joe (L10) 258877 - Parallel Bars - None	3		41	1
3907	2015-11-05 18:46:36.296276-05	2115	Cramer, Joe (L10) 258877 - High Bar - None	3		41	1
3908	2015-11-05 18:46:36.297263-05	1918	Bauer, Adam (L10) 256327 - Floor - None	3		41	1
3909	2015-11-05 18:46:36.298244-05	1919	Bauer, Adam (L10) 256327 - Rings - None	3		41	1
3910	2015-11-05 18:46:36.29927-05	1920	Bauer, Adam (L10) 256327 - Pommel Horse - None	3		41	1
3911	2015-11-05 18:46:36.300326-05	1921	Bauer, Adam (L10) 256327 - Vault - None	3		41	1
3912	2015-11-05 18:46:36.301282-05	1922	Bauer, Adam (L10) 256327 - Parallel Bars - None	3		41	1
3913	2015-11-05 18:46:36.302214-05	1923	Bauer, Adam (L10) 256327 - High Bar - None	3		41	1
3914	2015-11-05 18:46:36.303164-05	3274	Ryan, Carson (L10) 446268 - Floor - None	3		41	1
3915	2015-11-05 18:46:36.304062-05	3275	Ryan, Carson (L10) 446268 - Rings - None	3		41	1
3916	2015-11-05 18:46:36.305012-05	3276	Ryan, Carson (L10) 446268 - Pommel Horse - None	3		41	1
3917	2015-11-05 18:46:36.30604-05	3277	Ryan, Carson (L10) 446268 - Vault - None	3		41	1
3918	2015-11-05 18:46:36.306989-05	3278	Ryan, Carson (L10) 446268 - Parallel Bars - None	3		41	1
3919	2015-11-05 18:46:36.307912-05	3279	Ryan, Carson (L10) 446268 - High Bar - None	3		41	1
3920	2015-11-05 18:46:36.30882-05	3262	Rutherford, Grady (L8) 436001 - Floor - None	3		41	1
3921	2015-11-05 18:46:36.30973-05	3263	Rutherford, Grady (L8) 436001 - Rings - None	3		41	1
3922	2015-11-05 18:46:36.310637-05	3264	Rutherford, Grady (L8) 436001 - Pommel Horse - None	3		41	1
3923	2015-11-05 18:46:36.311517-05	3265	Rutherford, Grady (L8) 436001 - Vault - None	3		41	1
3924	2015-11-05 18:46:36.312399-05	3266	Rutherford, Grady (L8) 436001 - Parallel Bars - None	3		41	1
3925	2015-11-05 18:46:36.313307-05	3267	Rutherford, Grady (L8) 436001 - High Bar - None	3		41	1
3926	2015-11-05 18:46:36.314222-05	2254	Faglioni, Mitchell (L6) 522955 - Floor - None	3		41	1
3927	2015-11-05 18:46:36.315105-05	2255	Faglioni, Mitchell (L6) 522955 - Rings - None	3		41	1
3928	2015-11-05 18:46:36.316061-05	2256	Faglioni, Mitchell (L6) 522955 - Pommel Horse - None	3		41	1
3929	2015-11-05 18:46:36.316942-05	2257	Faglioni, Mitchell (L6) 522955 - Vault - None	3		41	1
3930	2015-11-05 18:46:36.317903-05	2258	Faglioni, Mitchell (L6) 522955 - Parallel Bars - None	3		41	1
3931	2015-11-05 18:46:36.318788-05	2259	Faglioni, Mitchell (L6) 522955 - High Bar - None	3		41	1
3932	2015-11-05 18:46:36.319675-05	2584	Hicks, Hayden (L6) 636527 - Floor - None	3		41	1
3933	2015-11-05 18:46:36.320552-05	2585	Hicks, Hayden (L6) 636527 - Rings - None	3		41	1
3934	2015-11-05 18:46:36.321438-05	2586	Hicks, Hayden (L6) 636527 - Pommel Horse - None	3		41	1
3935	2015-11-05 18:46:36.322331-05	2587	Hicks, Hayden (L6) 636527 - Vault - None	3		41	1
3936	2015-11-05 18:46:36.323225-05	2588	Hicks, Hayden (L6) 636527 - Parallel Bars - None	3		41	1
3937	2015-11-05 18:46:36.32411-05	2589	Hicks, Hayden (L6) 636527 - High Bar - None	3		41	1
3938	2015-11-05 18:46:36.324985-05	2002	Burchard, Grayson (L6) 657526 - Floor - None	3		41	1
3939	2015-11-05 18:46:36.325897-05	2003	Burchard, Grayson (L6) 657526 - Rings - None	3		41	1
3940	2015-11-05 18:46:36.326778-05	2004	Burchard, Grayson (L6) 657526 - Pommel Horse - None	3		41	1
3941	2015-11-05 18:46:36.327721-05	2005	Burchard, Grayson (L6) 657526 - Vault - None	3		41	1
3942	2015-11-05 18:46:36.328679-05	2006	Burchard, Grayson (L6) 657526 - Parallel Bars - None	3		41	1
3943	2015-11-05 18:46:36.329624-05	2007	Burchard, Grayson (L6) 657526 - High Bar - None	3		41	1
3944	2015-11-05 18:46:36.330507-05	1930	FLAGGED! Becker, Kunda (L4) 938283 - Floor - None	3		41	1
3945	2015-11-05 18:46:36.331389-05	1931	FLAGGED! Becker, Kunda (L4) 938283 - Rings - None	3		41	1
3946	2015-11-05 18:46:36.332267-05	1932	FLAGGED! Becker, Kunda (L4) 938283 - Pommel Horse - None	3		41	1
3947	2015-11-05 18:46:36.333321-05	1933	FLAGGED! Becker, Kunda (L4) 938283 - Vault - None	3		41	1
3948	2015-11-05 18:46:36.334229-05	1934	FLAGGED! Becker, Kunda (L4) 938283 - Parallel Bars - None	3		41	1
3949	2015-11-05 18:46:36.33513-05	1935	FLAGGED! Becker, Kunda (L4) 938283 - High Bar - None	3		41	1
3950	2015-11-05 18:46:36.33603-05	2944	Mazzuca, Zack (L4) 1008952 - Floor - None	3		41	1
3951	2015-11-05 18:46:36.336923-05	2945	Mazzuca, Zack (L4) 1008952 - Rings - None	3		41	1
3952	2015-11-05 18:46:36.3378-05	2946	Mazzuca, Zack (L4) 1008952 - Pommel Horse - None	3		41	1
3953	2015-11-05 18:46:36.338784-05	2947	Mazzuca, Zack (L4) 1008952 - Vault - None	3		41	1
3954	2015-11-05 18:46:36.339808-05	2948	Mazzuca, Zack (L4) 1008952 - Parallel Bars - None	3		41	1
3955	2015-11-05 18:46:36.340781-05	2949	Mazzuca, Zack (L4) 1008952 - High Bar - None	3		41	1
3956	2015-11-05 18:46:36.341764-05	2938	Mazzuca, Luke (L5) 621923 - Floor - None	3		41	1
3957	2015-11-05 18:46:36.3427-05	2939	Mazzuca, Luke (L5) 621923 - Rings - None	3		41	1
3958	2015-11-05 18:46:36.343626-05	2940	Mazzuca, Luke (L5) 621923 - Pommel Horse - None	3		41	1
3959	2015-11-05 18:46:36.34455-05	2941	Mazzuca, Luke (L5) 621923 - Vault - None	3		41	1
3960	2015-11-05 18:46:36.34547-05	2942	Mazzuca, Luke (L5) 621923 - Parallel Bars - None	3		41	1
3961	2015-11-05 18:46:36.346355-05	2943	Mazzuca, Luke (L5) 621923 - High Bar - None	3		41	1
3962	2015-11-05 18:46:36.347243-05	2980	Miller, Alex (L5) 938125 - Floor - None	3		41	1
3963	2015-11-05 18:46:36.348123-05	2981	Miller, Alex (L5) 938125 - Rings - None	3		41	1
3964	2015-11-05 18:46:36.349031-05	2982	Miller, Alex (L5) 938125 - Pommel Horse - None	3		41	1
3965	2015-11-05 18:46:36.349908-05	2983	Miller, Alex (L5) 938125 - Vault - None	3		41	1
3966	2015-11-05 18:46:36.350829-05	2984	Miller, Alex (L5) 938125 - Parallel Bars - None	3		41	1
3967	2015-11-05 18:46:36.351712-05	2985	Miller, Alex (L5) 938125 - High Bar - None	3		41	1
3968	2015-11-05 18:46:36.352667-05	3028	FLAGGED! Morrison, Colin (L5) 621924 - Floor - None	3		41	1
3969	2015-11-05 18:46:36.353556-05	3029	FLAGGED! Morrison, Colin (L5) 621924 - Rings - None	3		41	1
3970	2015-11-05 18:46:36.354433-05	3030	FLAGGED! Morrison, Colin (L5) 621924 - Pommel Horse - None	3		41	1
3971	2015-11-05 18:46:36.355371-05	3031	FLAGGED! Morrison, Colin (L5) 621924 - Vault - None	3		41	1
3972	2015-11-05 18:46:36.356363-05	3032	FLAGGED! Morrison, Colin (L5) 621924 - Parallel Bars - None	3		41	1
3973	2015-11-05 18:46:36.357253-05	3033	FLAGGED! Morrison, Colin (L5) 621924 - High Bar - None	3		41	1
3974	2015-11-05 18:46:36.358234-05	3034	FLAGGED! Morrison, Tyler (L5) 587041 - Floor - None	3		41	1
3975	2015-11-05 18:46:36.359136-05	3035	FLAGGED! Morrison, Tyler (L5) 587041 - Rings - None	3		41	1
3976	2015-11-05 18:46:36.360031-05	3036	FLAGGED! Morrison, Tyler (L5) 587041 - Pommel Horse - None	3		41	1
3977	2015-11-05 18:46:36.361009-05	3037	FLAGGED! Morrison, Tyler (L5) 587041 - Vault - None	3		41	1
3978	2015-11-05 18:46:36.361925-05	3038	FLAGGED! Morrison, Tyler (L5) 587041 - Parallel Bars - None	3		41	1
3979	2015-11-05 18:46:36.362879-05	3039	FLAGGED! Morrison, Tyler (L5) 587041 - High Bar - None	3		41	1
3980	2015-11-05 18:46:36.363766-05	3106	Ostrowski, Tyler (L5) 938128 - Floor - None	3		41	1
3981	2015-11-05 18:46:36.364651-05	3107	Ostrowski, Tyler (L5) 938128 - Rings - None	3		41	1
3982	2015-11-05 18:46:36.365584-05	3108	Ostrowski, Tyler (L5) 938128 - Pommel Horse - None	3		41	1
3983	2015-11-05 18:46:36.366486-05	3109	Ostrowski, Tyler (L5) 938128 - Vault - None	3		41	1
3984	2015-11-05 18:46:36.367376-05	3110	Ostrowski, Tyler (L5) 938128 - Parallel Bars - None	3		41	1
3985	2015-11-05 18:46:36.368257-05	3111	Ostrowski, Tyler (L5) 938128 - High Bar - None	3		41	1
3986	2015-11-05 18:46:36.369168-05	3208	Richards, Adam (L5) 661838 - Floor - None	3		41	1
3987	2015-11-05 18:46:36.370071-05	3209	Richards, Adam (L5) 661838 - Rings - None	3		41	1
3988	2015-11-05 18:46:36.371001-05	3210	Richards, Adam (L5) 661838 - Pommel Horse - None	3		41	1
3989	2015-11-05 18:46:36.371972-05	3211	Richards, Adam (L5) 661838 - Vault - None	3		41	1
3990	2015-11-05 18:46:36.372902-05	3212	Richards, Adam (L5) 661838 - Parallel Bars - None	3		41	1
3991	2015-11-05 18:46:36.373895-05	3213	Richards, Adam (L5) 661838 - High Bar - None	3		41	1
3992	2015-11-05 18:46:36.374834-05	3394	Simpson, Sergei (L5) 621927 - Floor - None	3		41	1
3993	2015-11-05 18:46:36.375788-05	3395	Simpson, Sergei (L5) 621927 - Rings - None	3		41	1
3994	2015-11-05 18:46:36.376717-05	3396	Simpson, Sergei (L5) 621927 - Pommel Horse - None	3		41	1
3995	2015-11-05 18:46:36.377628-05	3397	Simpson, Sergei (L5) 621927 - Vault - None	3		41	1
3996	2015-11-05 18:46:36.378539-05	3398	Simpson, Sergei (L5) 621927 - Parallel Bars - None	3		41	1
3997	2015-11-05 18:46:36.379422-05	3399	Simpson, Sergei (L5) 621927 - High Bar - None	3		41	1
3998	2015-11-05 18:46:36.380366-05	2026	FLAGGED! Campbell, Orion (L5) 639727 - Floor - None	3		41	1
3999	2015-11-05 18:46:36.381255-05	2027	FLAGGED! Campbell, Orion (L5) 639727 - Rings - None	3		41	1
4000	2015-11-05 18:46:36.382177-05	2028	FLAGGED! Campbell, Orion (L5) 639727 - Pommel Horse - None	3		41	1
4001	2015-11-05 18:46:36.383138-05	2029	FLAGGED! Campbell, Orion (L5) 639727 - Vault - None	3		41	1
4002	2015-11-05 18:46:36.384062-05	2030	FLAGGED! Campbell, Orion (L5) 639727 - Parallel Bars - None	3		41	1
4003	2015-11-05 18:46:36.384949-05	2031	FLAGGED! Campbell, Orion (L5) 639727 - High Bar - None	3		41	1
4004	2015-11-05 18:46:36.385881-05	2722	FLAGGED! Kestler, Spencer (L5) 573985 - Floor - None	3		41	1
4005	2015-11-05 18:46:36.386766-05	2723	FLAGGED! Kestler, Spencer (L5) 573985 - Rings - None	3		41	1
4006	2015-11-05 18:46:36.387649-05	2724	FLAGGED! Kestler, Spencer (L5) 573985 - Pommel Horse - None	3		41	1
4007	2015-11-05 18:46:36.388825-05	2725	FLAGGED! Kestler, Spencer (L5) 573985 - Vault - None	3		41	1
4008	2015-11-05 18:46:36.389949-05	2726	FLAGGED! Kestler, Spencer (L5) 573985 - Parallel Bars - None	3		41	1
4009	2015-11-05 18:46:36.390934-05	2727	FLAGGED! Kestler, Spencer (L5) 573985 - High Bar - None	3		41	1
4010	2015-11-05 18:46:36.391896-05	2734	Kofie, Malakai (L5) 583018 - Floor - None	3		41	1
4011	2015-11-05 18:46:36.392826-05	2735	Kofie, Malakai (L5) 583018 - Rings - None	3		41	1
4012	2015-11-05 18:46:36.393748-05	2736	Kofie, Malakai (L5) 583018 - Pommel Horse - None	3		41	1
4013	2015-11-05 18:46:36.394651-05	2737	Kofie, Malakai (L5) 583018 - Vault - None	3		41	1
4014	2015-11-05 18:46:36.395565-05	2738	Kofie, Malakai (L5) 583018 - Parallel Bars - None	3		41	1
4015	2015-11-05 18:46:36.396458-05	2739	Kofie, Malakai (L5) 583018 - High Bar - None	3		41	1
4016	2015-11-05 18:46:36.397415-05	2038	Chiang, Thomas (L5) 1008955 - Floor - None	3		41	1
4017	2015-11-05 18:46:36.398341-05	2039	Chiang, Thomas (L5) 1008955 - Rings - None	3		41	1
4018	2015-11-05 18:46:36.399259-05	2040	Chiang, Thomas (L5) 1008955 - Pommel Horse - None	3		41	1
4019	2015-11-05 18:46:36.40017-05	2041	Chiang, Thomas (L5) 1008955 - Vault - None	3		41	1
4020	2015-11-05 18:46:36.401058-05	2042	Chiang, Thomas (L5) 1008955 - Parallel Bars - None	3		41	1
4021	2015-11-05 18:46:36.401945-05	2043	Chiang, Thomas (L5) 1008955 - High Bar - None	3		41	1
4022	2015-11-05 18:46:36.402828-05	3040	Muhammad, Dawud (L5) 650435 - Floor - None	3		41	1
4023	2015-11-05 18:46:36.403745-05	3041	Muhammad, Dawud (L5) 650435 - Rings - None	3		41	1
4024	2015-11-05 18:46:36.404624-05	3042	Muhammad, Dawud (L5) 650435 - Pommel Horse - None	3		41	1
4025	2015-11-05 18:46:36.405502-05	3043	Muhammad, Dawud (L5) 650435 - Vault - None	3		41	1
4026	2015-11-05 18:46:36.406499-05	3044	Muhammad, Dawud (L5) 650435 - Parallel Bars - None	3		41	1
4027	2015-11-05 18:46:36.407446-05	3045	Muhammad, Dawud (L5) 650435 - High Bar - None	3		41	1
4028	2015-11-05 18:46:36.4084-05	3364	Sheppard, Keon (L6) 571647 - Floor - None	3		41	1
4029	2015-11-05 18:46:36.409353-05	3365	Sheppard, Keon (L6) 571647 - Rings - None	3		41	1
4030	2015-11-05 18:46:36.410234-05	3366	Sheppard, Keon (L6) 571647 - Pommel Horse - None	3		41	1
4031	2015-11-05 18:46:36.411198-05	3367	Sheppard, Keon (L6) 571647 - Vault - None	3		41	1
4032	2015-11-05 18:46:36.412105-05	3368	Sheppard, Keon (L6) 571647 - Parallel Bars - None	3		41	1
4033	2015-11-05 18:46:36.413004-05	3369	Sheppard, Keon (L6) 571647 - High Bar - None	3		41	1
4034	2015-11-05 18:46:36.413942-05	2530	Haycock, Wesley (L6) 486369 - Floor - None	3		41	1
4035	2015-11-05 18:46:36.41485-05	2531	Haycock, Wesley (L6) 486369 - Rings - None	3		41	1
4036	2015-11-05 18:46:36.415733-05	2532	Haycock, Wesley (L6) 486369 - Pommel Horse - None	3		41	1
4037	2015-11-05 18:46:36.417036-05	2533	Haycock, Wesley (L6) 486369 - Vault - None	3		41	1
4038	2015-11-05 18:46:36.417979-05	2534	Haycock, Wesley (L6) 486369 - Parallel Bars - None	3		41	1
4039	2015-11-05 18:46:36.418891-05	2535	Haycock, Wesley (L6) 486369 - High Bar - None	3		41	1
4040	2015-11-05 18:46:36.419811-05	2506	Harman, Connor (L6) 554559 - Floor - None	3		41	1
4041	2015-11-05 18:46:36.421019-05	2507	Harman, Connor (L6) 554559 - Rings - None	3		41	1
4042	2015-11-05 18:46:36.42203-05	2508	Harman, Connor (L6) 554559 - Pommel Horse - None	3		41	1
4043	2015-11-05 18:46:36.422989-05	2509	Harman, Connor (L6) 554559 - Vault - None	3		41	1
4044	2015-11-05 18:46:36.423955-05	2510	Harman, Connor (L6) 554559 - Parallel Bars - None	3		41	1
4045	2015-11-05 18:46:36.424898-05	2511	Harman, Connor (L6) 554559 - High Bar - None	3		41	1
4046	2015-11-05 18:46:36.425876-05	2752	FLAGGED! Kunda, Bode (L6) 592599 - Floor - None	3		41	1
4047	2015-11-05 18:46:36.426806-05	2753	FLAGGED! Kunda, Bode (L6) 592599 - Rings - None	3		41	1
4048	2015-11-05 18:46:36.4277-05	2754	FLAGGED! Kunda, Bode (L6) 592599 - Pommel Horse - None	3		41	1
4049	2015-11-05 18:46:36.428589-05	2755	FLAGGED! Kunda, Bode (L6) 592599 - Vault - None	3		41	1
4050	2015-11-05 18:46:36.429509-05	2756	FLAGGED! Kunda, Bode (L6) 592599 - Parallel Bars - None	3		41	1
4051	2015-11-05 18:46:36.4304-05	2757	FLAGGED! Kunda, Bode (L6) 592599 - High Bar - None	3		41	1
4052	2015-11-05 18:46:36.431313-05	1942	Berman, Joshua (L8) 463969 - Floor - None	3		41	1
4053	2015-11-05 18:46:36.432207-05	1943	Berman, Joshua (L8) 463969 - Rings - None	3		41	1
4054	2015-11-05 18:46:36.433141-05	1944	Berman, Joshua (L8) 463969 - Pommel Horse - None	3		41	1
4055	2015-11-05 18:46:36.434048-05	1945	Berman, Joshua (L8) 463969 - Vault - None	3		41	1
4056	2015-11-05 18:46:36.434934-05	1946	Berman, Joshua (L8) 463969 - Parallel Bars - None	3		41	1
4057	2015-11-05 18:46:36.436296-05	1947	Berman, Joshua (L8) 463969 - High Bar - None	3		41	1
4058	2015-11-05 18:46:36.437314-05	2212	Donnely, Xavier (L8)  - Floor - None	3		41	1
4059	2015-11-05 18:46:36.438273-05	2213	Donnely, Xavier (L8)  - Rings - None	3		41	1
4060	2015-11-05 18:46:36.439218-05	2214	Donnely, Xavier (L8)  - Pommel Horse - None	3		41	1
4061	2015-11-05 18:46:36.440198-05	2215	Donnely, Xavier (L8)  - Vault - None	3		41	1
4062	2015-11-05 18:46:36.441139-05	2216	Donnely, Xavier (L8)  - Parallel Bars - None	3		41	1
4063	2015-11-05 18:46:36.442066-05	2217	Donnely, Xavier (L8)  - High Bar - None	3		41	1
4064	2015-11-05 18:46:36.443001-05	2182	FLAGGED! Dev, Sahil (L7) 429974 - Floor - None	3		41	1
4065	2015-11-05 18:46:36.443942-05	2183	FLAGGED! Dev, Sahil (L7) 429974 - Rings - None	3		41	1
4066	2015-11-05 18:46:36.44496-05	2184	FLAGGED! Dev, Sahil (L7) 429974 - Pommel Horse - None	3		41	1
4067	2015-11-05 18:46:36.445894-05	2185	FLAGGED! Dev, Sahil (L7) 429974 - Vault - None	3		41	1
4068	2015-11-05 18:46:36.446794-05	2186	FLAGGED! Dev, Sahil (L7) 429974 - Parallel Bars - None	3		41	1
4069	2015-11-05 18:46:36.447709-05	2187	FLAGGED! Dev, Sahil (L7) 429974 - High Bar - None	3		41	1
4070	2015-11-05 18:46:36.448658-05	2362	Gernhar..., James (L7) 506486 - Floor - None	3		41	1
4071	2015-11-05 18:46:36.449571-05	2363	Gernhar..., James (L7) 506486 - Rings - None	3		41	1
4072	2015-11-05 18:46:36.450585-05	2364	Gernhar..., James (L7) 506486 - Pommel Horse - None	3		41	1
4073	2015-11-05 18:46:36.451476-05	2365	Gernhar..., James (L7) 506486 - Vault - None	3		41	1
4074	2015-11-05 18:46:36.452398-05	2366	Gernhar..., James (L7) 506486 - Parallel Bars - None	3		41	1
4075	2015-11-05 18:46:36.453319-05	2367	Gernhar..., James (L7) 506486 - High Bar - None	3		41	1
4076	2015-11-05 18:46:36.454211-05	2368	Gernhart, Andrew (L7) 506477 - Floor - None	3		41	1
4077	2015-11-05 18:46:36.45513-05	2369	Gernhart, Andrew (L7) 506477 - Rings - None	3		41	1
4078	2015-11-05 18:46:36.456128-05	2370	Gernhart, Andrew (L7) 506477 - Pommel Horse - None	3		41	1
4079	2015-11-05 18:46:36.457069-05	2371	Gernhart, Andrew (L7) 506477 - Vault - None	3		41	1
4080	2015-11-05 18:46:36.458018-05	2372	Gernhart, Andrew (L7) 506477 - Parallel Bars - None	3		41	1
4081	2015-11-05 18:46:36.458942-05	2373	Gernhart, Andrew (L7) 506477 - High Bar - None	3		41	1
4082	2015-11-05 18:46:36.459853-05	2572	Hewitt, Griffin (L7) 511224 - Floor - None	3		41	1
4083	2015-11-05 18:46:36.460878-05	2573	Hewitt, Griffin (L7) 511224 - Rings - None	3		41	1
4084	2015-11-05 18:46:36.461899-05	2574	Hewitt, Griffin (L7) 511224 - Pommel Horse - None	3		41	1
4085	2015-11-05 18:46:36.462849-05	2575	Hewitt, Griffin (L7) 511224 - Vault - None	3		41	1
4086	2015-11-05 18:46:36.463829-05	2576	Hewitt, Griffin (L7) 511224 - Parallel Bars - None	3		41	1
4087	2015-11-05 18:46:36.464789-05	2577	Hewitt, Griffin (L7) 511224 - High Bar - None	3		41	1
4088	2015-11-05 18:46:36.465823-05	2974	Mignardi, Gabe (L7) 396527 - Floor - None	3		41	1
4089	2015-11-05 18:46:36.46677-05	2975	Mignardi, Gabe (L7) 396527 - Rings - None	3		41	1
4090	2015-11-05 18:46:36.467713-05	2976	Mignardi, Gabe (L7) 396527 - Pommel Horse - None	3		41	1
4091	2015-11-05 18:46:36.468642-05	2977	Mignardi, Gabe (L7) 396527 - Vault - None	3		41	1
4092	2015-11-05 18:46:36.469566-05	2978	Mignardi, Gabe (L7) 396527 - Parallel Bars - None	3		41	1
4093	2015-11-05 18:46:36.47048-05	2979	Mignardi, Gabe (L7) 396527 - High Bar - None	3		41	1
4094	2015-11-05 18:46:36.471369-05	2296	FLAGGED! Fisher, Elijah (L7) 482708 - Floor - None	3		41	1
4095	2015-11-05 18:46:36.472278-05	2297	FLAGGED! Fisher, Elijah (L7) 482708 - Rings - None	3		41	1
4096	2015-11-05 18:46:36.473184-05	2298	FLAGGED! Fisher, Elijah (L7) 482708 - Pommel Horse - None	3		41	1
4097	2015-11-05 18:46:36.474125-05	2299	FLAGGED! Fisher, Elijah (L7) 482708 - Vault - None	3		41	1
4098	2015-11-05 18:46:36.47505-05	2300	FLAGGED! Fisher, Elijah (L7) 482708 - Parallel Bars - None	3		41	1
4099	2015-11-05 18:46:36.476004-05	2301	FLAGGED! Fisher, Elijah (L7) 482708 - High Bar - None	3		41	1
4100	2015-11-05 18:46:36.476922-05	2860	Luethy, Hollis (L7) 521581 - Floor - None	3		41	1
4101	2015-11-05 18:46:36.47781-05	2861	Luethy, Hollis (L7) 521581 - Rings - None	3		41	1
4102	2015-11-05 18:46:36.478741-05	2862	Luethy, Hollis (L7) 521581 - Pommel Horse - None	3		41	1
4103	2015-11-05 18:46:36.479629-05	2863	Luethy, Hollis (L7) 521581 - Vault - None	3		41	1
4104	2015-11-05 18:46:36.480512-05	2864	Luethy, Hollis (L7) 521581 - Parallel Bars - None	3		41	1
4105	2015-11-05 18:46:36.481392-05	2865	Luethy, Hollis (L7) 521581 - High Bar - None	3		41	1
4106	2015-11-05 18:46:36.482307-05	3370	FLAGGED! Shiffrin, Henry (L7) 519898 - Floor - None	3		41	1
4107	2015-11-05 18:46:36.483298-05	3371	FLAGGED! Shiffrin, Henry (L7) 519898 - Rings - None	3		41	1
4108	2015-11-05 18:46:36.4842-05	3372	FLAGGED! Shiffrin, Henry (L7) 519898 - Pommel Horse - None	3		41	1
4109	2015-11-05 18:46:36.485105-05	3373	FLAGGED! Shiffrin, Henry (L7) 519898 - Vault - None	3		41	1
4110	2015-11-05 18:46:36.486032-05	3374	FLAGGED! Shiffrin, Henry (L7) 519898 - Parallel Bars - None	3		41	1
4111	2015-11-05 18:46:36.486935-05	3375	FLAGGED! Shiffrin, Henry (L7) 519898 - High Bar - None	3		41	1
4112	2015-11-05 18:46:36.487814-05	3256	Rudie, Paul (L9) 433836 - Floor - None	3		41	1
4113	2015-11-05 18:46:36.488692-05	3257	Rudie, Paul (L9) 433836 - Rings - None	3		41	1
4114	2015-11-05 18:46:36.489675-05	3258	Rudie, Paul (L9) 433836 - Pommel Horse - None	3		41	1
4115	2015-11-05 18:46:36.490647-05	3259	Rudie, Paul (L9) 433836 - Vault - None	3		41	1
4116	2015-11-05 18:46:36.491634-05	3260	Rudie, Paul (L9) 433836 - Parallel Bars - None	3		41	1
4117	2015-11-05 18:46:36.492588-05	3261	Rudie, Paul (L9) 433836 - High Bar - None	3		41	1
4118	2015-11-05 18:46:36.49358-05	2764	Kuzmenchuk, Aleksandr (L9) 372142 - Floor - None	3		41	1
4119	2015-11-05 18:46:36.494584-05	2765	Kuzmenchuk, Aleksandr (L9) 372142 - Rings - None	3		41	1
4120	2015-11-05 18:46:36.495507-05	2766	Kuzmenchuk, Aleksandr (L9) 372142 - Pommel Horse - None	3		41	1
4121	2015-11-05 18:46:36.496472-05	2767	Kuzmenchuk, Aleksandr (L9) 372142 - Vault - None	3		41	1
4122	2015-11-05 18:46:36.497432-05	2768	Kuzmenchuk, Aleksandr (L9) 372142 - Parallel Bars - None	3		41	1
4123	2015-11-05 18:46:36.498373-05	2769	Kuzmenchuk, Aleksandr (L9) 372142 - High Bar - None	3		41	1
4124	2015-11-05 18:46:36.499321-05	3184	Powers, Zyler (L9) 433836 - Floor - None	3		41	1
4125	2015-11-05 18:46:36.500241-05	3185	Powers, Zyler (L9) 433836 - Rings - None	3		41	1
4126	2015-11-05 18:46:36.501136-05	3186	Powers, Zyler (L9) 433836 - Pommel Horse - None	3		41	1
4127	2015-11-05 18:46:36.502026-05	3187	Powers, Zyler (L9) 433836 - Vault - None	3		41	1
4128	2015-11-05 18:46:36.502985-05	3188	Powers, Zyler (L9) 433836 - Parallel Bars - None	3		41	1
4129	2015-11-05 18:46:36.503912-05	3189	Powers, Zyler (L9) 433836 - High Bar - None	3		41	1
4130	2015-11-05 18:46:36.504827-05	2440	Gregory, Johnny (L9) 458583 - Floor - None	3		41	1
4131	2015-11-05 18:46:36.505731-05	2441	Gregory, Johnny (L9) 458583 - Rings - None	3		41	1
4132	2015-11-05 18:46:36.506617-05	2442	Gregory, Johnny (L9) 458583 - Pommel Horse - None	3		41	1
4133	2015-11-05 18:46:36.5075-05	2443	Gregory, Johnny (L9) 458583 - Vault - None	3		41	1
4134	2015-11-05 18:46:36.508499-05	2444	Gregory, Johnny (L9) 458583 - Parallel Bars - None	3		41	1
4135	2015-11-05 18:46:36.509391-05	2445	Gregory, Johnny (L9) 458583 - High Bar - None	3		41	1
4136	2015-11-05 18:46:36.510303-05	2920	FLAGGED! Mateer, Christopher (L9) 431013 - Floor - None	3		41	1
4137	2015-11-05 18:46:36.511201-05	2921	FLAGGED! Mateer, Christopher (L9) 431013 - Rings - None	3		41	1
4138	2015-11-05 18:46:36.512093-05	2922	FLAGGED! Mateer, Christopher (L9) 431013 - Pommel Horse - None	3		41	1
4139	2015-11-05 18:46:36.512975-05	2923	FLAGGED! Mateer, Christopher (L9) 431013 - Vault - None	3		41	1
4140	2015-11-05 18:46:36.513964-05	2924	FLAGGED! Mateer, Christopher (L9) 431013 - Parallel Bars - None	3		41	1
4141	2015-11-05 18:46:36.514855-05	2925	FLAGGED! Mateer, Christopher (L9) 431013 - High Bar - None	3		41	1
4142	2015-11-05 18:46:36.515831-05	2206	Dinmore, Ian (L9) 425358 - Floor - None	3		41	1
4143	2015-11-05 18:46:36.516775-05	2207	Dinmore, Ian (L9) 425358 - Rings - None	3		41	1
4144	2015-11-05 18:46:36.517966-05	2208	Dinmore, Ian (L9) 425358 - Pommel Horse - None	3		41	1
4145	2015-11-05 18:46:36.519182-05	2209	Dinmore, Ian (L9) 425358 - Vault - None	3		41	1
4146	2015-11-05 18:46:36.520152-05	2210	Dinmore, Ian (L9) 425358 - Parallel Bars - None	3		41	1
4147	2015-11-05 18:46:36.521089-05	2211	Dinmore, Ian (L9) 425358 - High Bar - None	3		41	1
4148	2015-11-05 18:46:36.52202-05	2866	Lutchman, Dhiren (L9) 245810 - Floor - None	3		41	1
4149	2015-11-05 18:46:36.523035-05	2867	Lutchman, Dhiren (L9) 245810 - Rings - None	3		41	1
4150	2015-11-05 18:46:36.523997-05	2868	Lutchman, Dhiren (L9) 245810 - Pommel Horse - None	3		41	1
4151	2015-11-05 18:46:36.525055-05	2869	Lutchman, Dhiren (L9) 245810 - Vault - None	3		41	1
4152	2015-11-05 18:46:36.526069-05	2870	Lutchman, Dhiren (L9) 245810 - Parallel Bars - None	3		41	1
4153	2015-11-05 18:46:36.527085-05	2871	Lutchman, Dhiren (L9) 245810 - High Bar - None	3		41	1
4154	2015-11-05 18:46:36.528102-05	1906	Barnhouse, Mark (L9) 621943 - Floor - None	3		41	1
4155	2015-11-05 18:46:36.529115-05	1907	Barnhouse, Mark (L9) 621943 - Rings - None	3		41	1
4156	2015-11-05 18:46:36.530102-05	1908	Barnhouse, Mark (L9) 621943 - Pommel Horse - None	3		41	1
4157	2015-11-05 18:46:36.531105-05	1909	Barnhouse, Mark (L9) 621943 - Vault - None	3		41	1
4158	2015-11-05 18:46:36.532142-05	1910	Barnhouse, Mark (L9) 621943 - Parallel Bars - None	3		41	1
4159	2015-11-05 18:46:36.533102-05	1911	Barnhouse, Mark (L9) 621943 - High Bar - None	3		41	1
4160	2015-11-05 18:46:36.534046-05	1966	FLAGGED! Bowling, Brett (L9) 380451 - Floor - None	3		41	1
4161	2015-11-05 18:46:36.534956-05	1967	FLAGGED! Bowling, Brett (L9) 380451 - Rings - None	3		41	1
4162	2015-11-05 18:46:36.535924-05	1968	FLAGGED! Bowling, Brett (L9) 380451 - Pommel Horse - None	3		41	1
4163	2015-11-05 18:46:36.536836-05	1969	FLAGGED! Bowling, Brett (L9) 380451 - Vault - None	3		41	1
4164	2015-11-05 18:46:36.537758-05	1970	FLAGGED! Bowling, Brett (L9) 380451 - Parallel Bars - None	3		41	1
4165	2015-11-05 18:46:36.538643-05	1971	FLAGGED! Bowling, Brett (L9) 380451 - High Bar - None	3		41	1
4166	2015-11-05 19:06:09.517604-05	107	438 Chu, Patrick (Fairland Sports & Aquatics Complex)	2	Changed score for athlete event "438 Chu, Patrick (Fairland Sports & Aquatics Complex) - Floor - None".	39	1
4167	2015-11-05 19:06:18.353168-05	103	436 Bailey, Deven (Fairland Sports & Aquatics Complex)	2	Changed score for athlete event "436 Bailey, Deven (Fairland Sports & Aquatics Complex) - Floor - None".	39	1
4168	2015-11-12 18:51:26.882641-05	1	Level 4	1		30	1
4169	2015-11-12 19:01:14.027117-05	2	Session 2	1		29	1
4170	2015-11-12 19:09:50.130667-05	3	Session 3	1		29	1
4171	2015-11-12 19:10:02.214937-05	4	Session 4	1		29	1
4172	2015-11-18 22:47:14.382282-05	86	412 Durante, Tyler (APEX Gymnastics)	2	Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - Floor - None". Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - Rings - None". Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - Pommel Horse - None". Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - Vault - None". Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - Parallel Bars - None". Changed score for athlete event "412 Durante, Tyler (APEX Gymnastics) - High Bar - None".	39	1
4173	2015-11-18 23:16:44.422811-05	6	6	2	Changed name.	31	1
4174	2015-11-18 23:18:13.211046-05	3	Pommel Horse	2	Changed order.	24	1
4175	2015-11-18 23:18:24.834587-05	2	Rings	2	Changed order.	24	1
4176	2015-11-18 23:18:56.521757-05	6	Floor Sign	2	Changed name.	31	1
4177	2015-11-18 23:19:02.337619-05	5	Pommel Sign	2	Changed name.	31	1
4178	2015-11-18 23:19:08.490335-05	4	Rings Sign	2	Changed name.	31	1
4179	2015-11-18 23:19:16.769793-05	3	Vault Sign	2	Changed name.	31	1
4180	2015-11-18 23:19:24.761635-05	2	Parallel Bars Sign	2	Changed name.	31	1
4181	2015-11-18 23:19:29.189726-05	1	High Bar Sign	2	Changed name.	31	1
4182	2015-11-18 23:20:23.153335-05	1	Welcome	1		43	1
4183	2015-11-18 23:23:20.190798-05	2	Welcome	1		43	1
4184	2015-11-18 23:23:26.421732-05	2	Welcome	3		43	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4184, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	gymnastics	ledsign
8	gymnastics	event
9	gymnastics	team
10	gymnastics	group
11	gymnastics	athlete
12	gymnastics	athleteevent
14	gymnastics	session
15	gymnastics	teamaward
16	gymnastics	message
17	gymnastics	teamawardrank
19	registration	team
20	registration	coach
21	registration	gymnast
22	registration	level
23	meet	meet
24	competition	event
26	competition	teamawardrank
27	competition	division
29	competition	session
30	competition	teamaward
31	competition	ledsign
35	registration	levelpricing
36	registration	gymnastpricing
37	registration	shirtsize
39	competition	athlete
40	competition	team
41	competition	athleteevent
42	competition	ledshowmessage
43	competition	ledshow
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('django_content_type_id_seq', 43, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2014-12-10 21:43:46.143639-05
2	auth	0001_initial	2014-12-10 21:43:46.268218-05
3	admin	0001_initial	2014-12-10 21:43:46.328009-05
4	gymnastics	0001_initial	2014-12-10 21:43:46.511493-05
5	gymnastics	0002_auto_20141207_0328	2014-12-10 21:43:46.610214-05
6	gymnastics	0003_auto_20141207_0332	2014-12-10 21:43:46.69905-05
7	gymnastics	0004_auto_20141207_1631	2014-12-10 21:43:46.828479-05
8	gymnastics	0005_auto_20141208_0357	2014-12-10 21:43:47.197277-05
9	gymnastics	0006_auto_20141208_0400	2014-12-10 21:43:47.283672-05
10	gymnastics	0007_auto_20141208_0404	2014-12-10 21:43:47.383256-05
11	gymnastics	0008_auto_20141208_0413	2014-12-10 21:43:47.466946-05
12	gymnastics	0009_auto_20141210_1411	2014-12-10 21:43:47.62622-05
13	gymnastics	0010_auto_20141210_1424	2014-12-10 21:43:47.728032-05
14	gymnastics	0011_auto_20141211_0226	2014-12-10 21:43:47.951484-05
15	gymnastics	0012_auto_20141211_0234	2014-12-10 21:43:48.130306-05
16	gymnastics	0013_auto_20141211_0236	2014-12-10 21:43:48.287098-05
17	gymnastics	0014_remove_group_show_difficulty	2014-12-10 21:43:48.398186-05
18	sessions	0001_initial	2014-12-10 21:43:48.41292-05
19	gymnastics	0015_auto_20141211_1651	2014-12-11 11:51:09.877545-05
20	gymnastics	0015_auto_20141211_1804	2014-12-11 13:04:20.693255-05
21	gymnastics	0015_message	2014-12-11 17:17:04.637885-05
22	gymnastics	0016_auto_20141211_1832	2014-12-11 17:17:04.896787-05
23	gymnastics	0017_session	2014-12-11 17:17:05.078574-05
24	gymnastics	0018_auto_20141211_2144	2014-12-11 17:17:05.329166-05
25	gymnastics	0019_remove_sessionevent_position	2014-12-11 17:17:05.483005-05
26	gymnastics	0020_auto_20141211_2208	2014-12-11 17:17:05.813988-05
27	gymnastics	0021_auto_20141211_2219	2014-12-11 17:19:25.422313-05
28	gymnastics	0021_auto_20141212_0014	2014-12-12 11:45:57.906587-05
29	gymnastics	0022_merge	2014-12-12 11:45:58.197977-05
30	gymnastics	0023_auto_20141212_0410	2014-12-12 11:45:58.45501-05
31	gymnastics	0024_auto_20141212_1604	2014-12-12 11:45:58.733128-05
32	gymnastics	0025_auto_20141213_0121	2014-12-12 20:21:36.18816-05
33	gymnastics	0025_auto_20141213_0201	2014-12-30 18:06:14.982789-05
34	gymnastics	0026_merge	2014-12-30 18:06:15.365021-05
35	gymnastics	0027_auto_20141213_1150	2014-12-30 18:06:15.654689-05
36	gymnastics	0028_teamawardrank	2014-12-30 18:06:15.906143-05
37	gymnastics	0029_teamawardrank_score	2014-12-30 18:06:16.154546-05
38	gymnastics	0030_auto_20141213_1228	2014-12-30 18:06:16.418446-05
39	gymnastics	0031_group_order	2014-12-30 18:06:16.683766-05
40	gymnastics	0032_auto_20141214_1351	2014-12-30 18:06:17.011474-05
41	gymnastics	0033_athlete_scratched	2014-12-30 18:28:24.996478-05
42	gymnastics	0034_auto_20150104_2102	2015-01-04 21:56:30.428376-05
43	gymnastics	0035_auto_20150314_0205	2015-03-13 22:20:28.476621-04
44	gymnastics	0036_auto_20150603_0316	2015-06-28 23:00:07.330204-04
45	gymnastics	0037_auto_20150603_0328	2015-06-28 23:00:07.678157-04
46	registration	0001_initial	2015-07-01 01:28:08.316144-04
47	registration	0002_auto_20150726_1519	2015-07-26 11:20:06.663475-04
48	registration	0003_auto_20150726_1715	2015-07-26 13:16:02.738609-04
49	registration	0004_team_phone	2015-07-26 13:23:34.157586-04
50	registration	0005_auto_20150829_2159	2015-08-29 17:59:53.78545-04
51	registration	0006_auto_20150829_2217	2015-08-29 18:17:48.92683-04
52	registration	0007_auto_20150830_0206	2015-08-29 22:06:11.076903-04
53	registration	0008_gymnast_is_scratched	2015-09-21 23:01:46.741262-04
54	registration	0009_auto_20150930_1824	2015-09-30 14:24:41.803287-04
55	registration	0010_auto_20150930_1828	2015-09-30 14:29:01.907859-04
56	registration	0011_auto_20150930_1855	2015-09-30 14:55:31.452175-04
57	registration	0012_auto_20151004_0144	2015-10-03 21:44:35.308731-04
58	contenttypes	0002_remove_content_type_name	2015-10-05 19:23:05.469169-04
59	auth	0002_alter_permission_name_max_length	2015-10-05 19:23:05.484855-04
60	auth	0003_alter_user_email_max_length	2015-10-05 19:23:05.495353-04
61	auth	0004_alter_user_username_opts	2015-10-05 19:23:05.50452-04
62	auth	0005_alter_user_last_login_null	2015-10-05 19:23:05.515873-04
63	auth	0006_require_contenttypes_0002	2015-10-05 19:23:05.517729-04
64	registration	0013_gymnast_is_flagged	2015-10-08 00:52:39.029309-04
65	registration	0014_auto_20151008_0456	2015-10-08 00:56:27.91549-04
66	registration	0015_auto_20151008_2132	2015-10-08 17:32:10.327577-04
67	registration	0016_auto_20151008_2221	2015-10-08 18:21:41.676942-04
68	meet	0001_initial	2015-10-10 14:53:35.066336-04
69	meet	0002_auto_20151010_1930	2015-10-10 15:30:35.136245-04
70	registration	0017_auto_20151010_1930	2015-10-10 15:30:35.148797-04
71	meet	0002_auto_20151011_1859	2015-10-11 15:01:53.629516-04
72	registration	0002_auto_20151011_1859	2015-10-11 15:01:53.86072-04
73	competition	0001_initial	2015-10-11 15:01:54.108524-04
74	registration	0003_auto_20151011_1916	2015-10-11 15:16:04.503877-04
75	registration	0004_auto_20151011_2013	2015-10-11 16:13:15.310677-04
76	registration	0005_auto_20151011_2013	2015-10-11 16:14:34.344156-04
77	registration	0006_auto_20151011_2016	2015-10-11 16:16:34.196606-04
78	registration	0007_auto_20151011_2025	2015-10-11 16:26:01.994287-04
79	registration	0008_auto_20151011_2123	2015-10-11 17:24:00.684754-04
80	registration	0009_auto_20151011_2127	2015-10-11 17:28:04.242438-04
81	registration	0010_auto_20151011_2252	2015-10-11 18:52:31.03588-04
82	competition	0002_auto_20151011_2251	2015-10-11 18:59:20.439086-04
83	competition	0003_athlete	2015-10-26 20:19:24.937504-04
84	competition	0004_auto_20151013_0313	2015-10-26 20:19:25.296899-04
85	competition	0005_team	2015-10-26 20:19:25.305066-04
86	competition	0006_auto_20151015_2212	2015-10-26 20:19:25.412915-04
87	competition	0007_auto_20151015_2216	2015-10-26 20:19:25.487054-04
88	competition	0008_auto_20151015_2248	2015-10-26 20:19:25.631404-04
89	registration	0011_team_level_awards	2015-10-26 20:19:25.681247-04
90	registration	0012_auto_20151015_2251	2015-10-26 20:19:25.772462-04
91	registration	0013_auto_20151016_0322	2015-10-26 20:19:25.915111-04
92	competition	0009_teamaward_levels	2015-10-26 20:19:25.96188-04
93	meet	0003_auto_20151012_2322	2015-10-26 20:19:26.076208-04
94	registration	0014_remove_team_levels	2015-10-26 20:19:26.122588-04
95	competition	0010_auto_20151105_2324	2015-11-05 18:24:23.674662-05
96	competition	0011_auto_20151112_0153	2015-11-12 17:54:30.924747-05
97	registration	0015_auto_20151112_0153	2015-11-12 17:54:30.982247-05
98	competition	0012_auto_20151119_0412	2015-11-18 23:12:09.191867-05
99	competition	0013_auto_20151119_0416	2015-11-18 23:16:35.8891-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('django_migrations_id_seq', 99, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
t15y3vds57a73tdrakq5bhf3fvbok1qe	N2JiMjlkYjQxMWJmMTBmZmFhYzQxOWNmZTIxZjE1ZTNmNTc3ODE2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiN2Q2NjhmMzAxYzU1MWQ3NjYzNWM3NzY4YTIxOGFlMTU4MWRmMDlkYyJ9	2014-12-24 21:46:00.870717-05
uoyhhmkc6fpib058toaveid8muaelz4b	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-25 17:17:26.698352-05
2zipwzutvxwhg3dwv7ixwc8659ayha2t	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-25 17:17:26.699013-05
sin7vvdj3q4mae8a8df1odm94z4nc1ig	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-25 17:17:37.117652-05
frnw3lg91sish9u271lv217pwt70p4ow	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-25 17:17:37.122238-05
hjnko7hfpj374g4ok17ykw8n7xsxsluv	MmFmNmIzOTg3OWMwNWI3Nzk5NjRlMTNmYTk5M2VlMDkyZGMwMjE2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkNjY4ZjMwMWM1NTFkNzY2MzVjNzc2OGEyMThhZTE1ODFkZjA5ZGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2014-12-25 17:19:40.298833-05
fg3hbkdourjf7ag23zwkss6da15d0xv9	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-26 20:22:01.861419-05
zzo37tlm7r92fe18w9o8aa6zkyvylmmm	YzBiYzZmMWNjOWEzYjZmMGIxMmE3YmVjMjhkMzcxOGNmYTJjMzgwZjp7fQ==	2014-12-26 20:22:03.342156-05
6zsvy56078gm6fprudqfle3q0zx3ztlk	MDQxZDMzODQxMWUwMzcwMTEzMzg4ZWQzYjJjM2Q0NWFlYzkxMjhmNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjdkNjY4ZjMwMWM1NTFkNzY2MzVjNzc2OGEyMThhZTE1ODFkZjA5ZGMiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2014-12-26 20:22:21.668309-05
eks73thphvup9xkpzvbqd6uiqzigd9lv	NDQwMWQ2YTMzZjQwMmM2ZjI3OGI4YjIwYjVmZjIwZGY3M2M0M2I0ODp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjdkNjY4ZjMwMWM1NTFkNzY2MzVjNzc2OGEyMThhZTE1ODFkZjA5ZGMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-01-13 18:06:42.599868-05
j87e79zsw35ovc848vsc1nt8wcqflp1w	NTBlYjIyZGQzZGEwMzcyYTUwOTk5MGY3NTVjNzhlODhhMmFlNGJlMjp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2Q2NjhmMzAxYzU1MWQ3NjYzNWM3NzY4YTIxOGFlMTU4MWRmMDlkYyJ9	2015-01-18 22:06:10.675906-05
wjua6q50mku6o32i04tumhkev2oeq3mg	N2JiMjlkYjQxMWJmMTBmZmFhYzQxOWNmZTIxZjE1ZTNmNTc3ODE2Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiN2Q2NjhmMzAxYzU1MWQ3NjYzNWM3NzY4YTIxOGFlMTU4MWRmMDlkYyJ9	2015-03-27 21:47:56.255507-04
lxu4axi98ydvgqpjbadqhykai85boe27	NWRjMzAyZGNhNzNjNTMwZDBiMjQ5N2EwODgyZWNhZmQ0M2Q4NjQxMzp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-07-12 23:08:36.456871-04
5p5jn6upv5ybe0a0qzr4vlvp13js9hug	ZTdiNzJhZTAxNTdkZjM0YjZkN2Q3NDY2MDM2OTA5NTYzN2VkMDFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-07-15 01:28:24.509018-04
ker9h64p4c5b7m6m9n6vtjlvhqr36j4l	ZTdiNzJhZTAxNTdkZjM0YjZkN2Q3NDY2MDM2OTA5NTYzN2VkMDFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-08-09 10:26:14.407113-04
pvkgwbvji6uxvi7ow5eiidveva0i7s3n	M2E5YTZiM2FiNDU5MDBkZDYwNjVmMjYwOTY5ODk3YWNkZDRkMzhmMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-08-10 16:26:23.707422-04
vkswz5ksbzd0qpszzj6692m43t73px6f	OTQxMTIwNGNjZmU3MzI5ZmM5NjYxOWVjOTBhMGY4ZDZiMzE0NjRjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiOGE4ZjZjMjE3ZjFkZTQ1MDhkNzVlMGUzMjgxOGNiNjU3MjVjOTg1OSJ9	2015-09-12 17:25:48.779051-04
1yhp20c9090x6u4q5y2xbu177xiap1pt	ZTdiNzJhZTAxNTdkZjM0YjZkN2Q3NDY2MDM2OTA5NTYzN2VkMDFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-09-22 12:02:17.455048-04
cxbquzissjril415vkgdr8j36njeuab6	NWRjMzAyZGNhNzNjNTMwZDBiMjQ5N2EwODgyZWNhZmQ0M2Q4NjQxMzp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-09-24 12:13:59.627589-04
pq6opmppe5wzci8jg1qfq6z2p31qcqdn	NWRjMzAyZGNhNzNjNTMwZDBiMjQ5N2EwODgyZWNhZmQ0M2Q4NjQxMzp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9	2015-10-05 19:38:02.952029-04
vxopgkn56q6txngn6if1vurrinw1kh4g	MGIzOGI5MzIwYjNhZmMyYTBjMWRlOTY0ZTQzMTE2Y2IxYjQ5MThlMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGE4ZjZjMjE3ZjFkZTQ1MDhkNzVlMGUzMjgxOGNiNjU3MjVjOTg1OSIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-08 17:55:44.620528-04
4irs0r8h7h113ozulip7ugfw8ek48wzo	ZTdiNzJhZTAxNTdkZjM0YjZkN2Q3NDY2MDM2OTA5NTYzN2VkMDFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-13 13:06:09.938454-04
t9s1ndzgd5aaerde55o30je8ng6jc2wb	OTQxMTIwNGNjZmU3MzI5ZmM5NjYxOWVjOTBhMGY4ZDZiMzE0NjRjMTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiOGE4ZjZjMjE3ZjFkZTQ1MDhkNzVlMGUzMjgxOGNiNjU3MjVjOTg1OSJ9	2015-10-14 14:38:11.689886-04
0d1lm70xod4vbrdxx0m3oq35lcrlynb6	ZTdiNzJhZTAxNTdkZjM0YjZkN2Q3NDY2MDM2OTA5NTYzN2VkMDFlODp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhOGY2YzIxN2YxZGU0NTA4ZDc1ZTBlMzI4MThjYjY1NzI1Yzk4NTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-15 13:37:01.880288-04
t08mjhbv6wqax8kg8sfuo16v240uatji	ZThjYjYwYWU0OWM0MzExNWFmYTNhNWQxNzQ1ZjQ4ODZmMTQ0MWQwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-10-21 18:44:54.265107-04
on7zslf0sldppbaoc0mqxdii7bgacfap	ZThjYjYwYWU0OWM0MzExNWFmYTNhNWQxNzQ1ZjQ4ODZmMTQ0MWQwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-10-22 17:32:25.861175-04
4ryvocba7z1626y1n2qj30anq3rsx88x	ZThjYjYwYWU0OWM0MzExNWFmYTNhNWQxNzQ1ZjQ4ODZmMTQ0MWQwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-10-23 23:32:54.195225-04
wx6ycid5c93k9w0ritggpe409xtsmzow	N2FhNThjZWRiMjcyYjdiNjA1YTFmMjY0ZjNmMWYwNjI5MjdmYTgwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-10-25 19:03:20.058285-04
qmy7nxz3o27at4z5vyjlejsht96okwrb	MWQ1NzE0NGRiOTY5ZTI4NmRmNTNmN2Q5M2Q2ZjIwMjM4OWEwZTEyZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5NjZmZDRmNjFmMDA5NDEzOTY2Y2Y3MWY5MTc3ZDVjN2NkZDg4MDMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-11-09 19:21:07.54388-05
ddy9wqrs24oryzhy8mok7615ntdjjmg4	YmZhYThkN2Q1MDU2ZDQ5N2EzYTYwOWY1YTVjMDQyZTQxMTA1YjNhMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkOTY2ZmQ0ZjYxZjAwOTQxMzk2NmNmNzFmOTE3N2Q1YzdjZGQ4ODAzIn0=	2015-11-15 10:17:23.163584-05
4mj2k1nkqo3aaqmxph7ys34s00crwkyu	N2FhNThjZWRiMjcyYjdiNjA1YTFmMjY0ZjNmMWYwNjI5MjdmYTgwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-11-19 18:25:38.175977-05
cb222l1xgglxni77gpdysevxz2csl82c	MWQ1NzE0NGRiOTY5ZTI4NmRmNTNmN2Q5M2Q2ZjIwMjM4OWEwZTEyZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5NjZmZDRmNjFmMDA5NDEzOTY2Y2Y3MWY5MTc3ZDVjN2NkZDg4MDMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-11-26 17:55:03.959305-05
3j0nomfbctvxzxctuaxh1ules6xr9422	YmZhYThkN2Q1MDU2ZDQ5N2EzYTYwOWY1YTVjMDQyZTQxMTA1YjNhMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkOTY2ZmQ0ZjYxZjAwOTQxMzk2NmNmNzFmOTE3N2Q1YzdjZGQ4ODAzIn0=	2015-11-30 19:27:31.882238-05
1srj31jq10vztj8gdanolwqf1ia4yrl2	ZThjYjYwYWU0OWM0MzExNWFmYTNhNWQxNzQ1ZjQ4ODZmMTQ0MWQwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDk2NmZkNGY2MWYwMDk0MTM5NjZjZjcxZjkxNzdkNWM3Y2RkODgwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2015-12-01 21:08:05.757446-05
\.


--
-- Data for Name: gymnastics_athlete; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_athlete (id, athlete_id, last_name, first_name, team_id, "position", group_id, starting_event_id, overall_score, rank, scratched, birth_date, usag_id) FROM stdin;
3272	604	Eisentraut	Will	256	3	277	\N	\N	\N	f	\N	\N
3219	807	Kuzmenchuk	Aleksandr	258	19	269	\N	\N	0	f	\N	\N
3247	912	Kressman	Sam	259	8	273	\N	\N	0	f	\N	\N
3287	619	Singleton	Jason	257	30	277	\N	\N	\N	f	\N	\N
3224	812	Egorov	Nicholai	259	4	269	\N	\N	0	f	\N	\N
3291	623	Gernhart	Andrew	258	8	277	\N	\N	\N	f	\N	\N
3248	913	Marsh	Christian	259	10	273	\N	\N	0	f	\N	\N
3294	626	Mignardi	Gabriel	258	24	276	\N	\N	\N	f	\N	\N
3227	815	Shustikoff	Alexei	259	19	269	\N	\N	0	f	\N	\N
3240	905	Trinh	Brian	257	37	273	\N	\N	0	f	\N	\N
3296	628	Dodd	Ethan	259	2	277	\N	\N	\N	f	\N	\N
3233	821	Sewell	Amari	261	22	271	\N	\N	0	f	\N	\N
3250	915	Manning	Christian	261	13	273	\N	\N	0	f	\N	\N
3220	808	Mateer	Christopher	258	22	269	\N	\N	0	f	\N	\N
3298	630	Vance	Jason	259	22	276	\N	\N	\N	f	\N	\N
3258	1004	Pelikan	Nicholas	256	12	275	\N	\N	0	f	\N	\N
3216	804	Singleton	Brandon	257	29	269	\N	\N	0	f	\N	\N
3218	806	Dinmore	Ian	258	6	269	\N	\N	0	f	\N	\N
3301	633	Currie	Landon	261	2	277	\N	\N	\N	f	\N	\N
3303	635	Ham	Jacob	261	9	276	\N	\N	\N	f	\N	\N
3306	638	Waterman	Anthony	261	23	278	\N	\N	\N	f	\N	\N
3307	639	Arensdorf	Zachary	262	1	277	\N	\N	\N	f	\N	\N
3309	641	Mills	Kevin	262	11	276	\N	\N	\N	f	\N	\N
3275	607	Eid	Marcel	263	5	277	\N	\N	\N	f	\N	\N
3276	608	Herz	Luke	263	7	277	\N	\N	\N	f	\N	\N
3284	616	Kanthan	Kush	257	20	277	\N	\N	\N	f	\N	\N
3223	811	Brown	Abram	259	1	271	\N	\N	0	f	\N	\N
3289	621	Graves	Edris	267	3	277	\N	\N	\N	f	\N	\N
3237	902	Fong	James	263	6	273	\N	\N	0	f	\N	\N
3290	622	Dev	Sahil	258	4	276	\N	\N	\N	f	\N	\N
3293	625	Hewitt	Griffin	258	13	276	\N	\N	\N	f	\N	\N
3229	817	Rosendahl	Mathew	260	17	269	\N	\N	0	f	\N	\N
3222	810	Rudie	Paul	258	33	269	\N	\N	0	f	\N	\N
3295	627	Brenner	Jacob	259	0	277	\N	\N	\N	f	\N	\N
3239	904	Rice	Cameron	257	26	273	\N	\N	0	f	\N	\N
3297	629	Sharpe	Joshua	259	18	276	\N	\N	\N	f	\N	\N
3264	1010	Leonard	Cameron	260	11	275	\N	\N	0	f	\N	\N
3305	637	Nichols	Randy	261	15	277	\N	\N	\N	f	\N	\N
3308	640	Burgess	Jackson	262	4	276	\N	\N	\N	f	\N	\N
3252	917	Valiente	Marcus	262	17	273	\N	\N	0	f	\N	\N
3310	642	Solito	Gavin	264	5	278	\N	\N	\N	f	\N	\N
3267	1013	Penn	Samuel	262	12	275	\N	\N	0	f	\N	\N
3263	1009	Fritz	Brendan	260	5	275	\N	\N	0	f	\N	\N
3214	802	Henry-Price	Joshua	257	17	269	\N	\N	0	f	\N	\N
3262	1008	Skerritt	Justin	257	31	275	\N	\N	0	f	\N	\N
3274	606	Auchincloss	Alexander	263	1	277	\N	\N	\N	f	\N	\N
3279	611	O'Toole	Liam	263	17	277	\N	\N	\N	f	\N	\N
3259	1005	Miller-Dickson	Miles	263	16	274	\N	\N	0	f	\N	\N
3225	813	Killian	Tyler	259	7	269	\N	\N	0	f	\N	\N
3288	620	Spurlock	Ibraheem	257	34	277	\N	\N	\N	f	\N	\N
3299	631	Jackson	Ryan	260	8	277	\N	\N	\N	f	\N	\N
3230	818	Rutz	Sebastian	260	18	269	\N	\N	0	f	\N	\N
3228	816	Lawler	Owen	260	10	271	\N	\N	0	f	\N	\N
3213	801	Donovan	Caleb	256	2	269	\N	\N	0	f	\N	\N
3255	920	Massey	Avery	265	4	272	\N	\N	0	f	\N	\N
3266	1012	Callas	James	262	5	275	\N	\N	0	f	\N	\N
3270	602	Luethy	Hollis	266	2	276	\N	\N	\N	f	\N	\N
3271	603	Shifrin	Henry	266	3	276	\N	\N	\N	f	\N	\N
3261	1007	Eke	Uche	257	9	274	\N	\N	0	f	\N	\N
3273	605	Fitzgerald	Nicholas	256	5	276	\N	\N	\N	f	\N	\N
3313	701	Gai	Daniel	256	7	279	\N	\N	\N	f	\N	\N
3238	903	Jarrell	Christian	257	19	273	\N	\N	0	f	\N	\N
3277	609	Joyner	Adam	263	10	277	\N	\N	\N	f	\N	\N
3278	610	Martin	Tyler	263	14	276	\N	\N	\N	f	\N	\N
3235	823	Davis	Dimitry	262	7	269	\N	\N	0	f	\N	\N
3280	612	Taub	Brandon	263	19	277	\N	\N	\N	f	\N	\N
3281	613	Tolman	Alexander	263	20	277	\N	\N	\N	f	\N	\N
3282	614	Ayodele	Aaron	257	0	277	\N	\N	\N	f	\N	\N
3283	615	Chu	Damien	257	1	276	\N	\N	\N	f	\N	\N
3257	1003	Hollingsworth	Jacob	256	8	274	\N	\N	0	f	\N	\N
3285	617	Ngo	Quinlan	257	22	277	\N	\N	\N	f	\N	\N
3286	618	Ra-Akbar	Jadon	257	25	277	\N	\N	\N	f	\N	\N
3253	918	Solito	Cade	264	4	273	\N	\N	0	f	\N	\N
3260	1006	Clay	Tucker	257	5	274	\N	\N	0	f	\N	\N
3236	901	Doyle	Brendan	263	4	272	\N	\N	0	f	\N	\N
3242	907	Bowling	Brett	258	2	273	\N	\N	0	f	\N	\N
3251	916	Beyers	Noah	262	2	273	\N	\N	0	f	\N	\N
3292	624	Gernhart III	James	258	9	276	\N	\N	\N	f	\N	\N
3254	919	Kravet	Ethan	265	1	273	\N	\N	0	f	\N	\N
3221	809	Powers	Zyler	258	31	269	\N	\N	0	f	\N	\N
3246	911	Schiavone	Zachary	258	34	273	\N	\N	0	f	\N	\N
3226	814	Killian	Cole	259	6	271	\N	\N	0	f	\N	\N
3215	803	Hewitt	Donovan	257	18	269	\N	\N	0	f	\N	\N
3234	822	Young	Khoi	261	24	269	\N	\N	0	f	\N	\N
3243	908	Gregory	Johnny	258	10	273	\N	\N	0	f	\N	\N
3300	632	Kelly	Boaz	260	9	277	\N	\N	\N	f	\N	\N
3217	805	Dev	Vijay	258	5	270	\N	\N	0	f	\N	\N
3302	634	Davis	John	261	4	276	\N	\N	\N	f	\N	\N
3268	1014	Lewis	Stephen	265	2	275	\N	\N	0	f	\N	\N
3304	636	Hum	Mitchell	261	10	276	\N	\N	\N	f	\N	\N
3245	910	Mohabir	Matthew	258	26	273	\N	\N	0	f	\N	\N
3241	906	Barnhouse	Mark	258	0	273	\N	\N	0	f	\N	\N
3232	820	Gore	Tony	261	8	271	\N	\N	0	f	\N	\N
3249	914	Christopher	Gavin	260	3	273	\N	\N	0	f	\N	\N
3265	1011	Gerald	Kaymon	261	7	275	\N	\N	0	f	\N	\N
3256	1002	Choi	Matthew	256	1	274	\N	\N	0	f	\N	\N
3311	643	Stearn	Gavin	264	8	277	\N	\N	\N	f	\N	\N
3312	644	Workman	Christian	264	9	277	\N	\N	\N	f	\N	\N
3244	909	Lutchman	Dhiren	258	21	273	\N	\N	0	f	\N	\N
3231	819	Baskin	Brandon	261	1	269	\N	\N	0	f	\N	\N
3331	503	Martin	Sylvan	256	10	283	\N	\N	\N	f	\N	\N
3333	505	Damm	Stephen	263	3	282	\N	\N	\N	f	\N	\N
3390	406	McReady	Brandon	263	15	286	\N	\N	\N	f	\N	\N
3336	508	Dorsey	Joseph	268	0	284	\N	\N	\N	f	\N	\N
3319	707	Galvez	Julian	257	10	281	\N	\N	\N	f	\N	\N
3320	708	Graninger	Kenneth	257	11	281	\N	\N	\N	f	\N	\N
3342	514	Hall	Donovan	257	12	284	\N	\N	\N	f	\N	\N
3396	412	Mejia-Gabriel	Geovanny	257	21	287	\N	\N	\N	f	\N	\N
3323	711	Tran	Eric	257	36	279	\N	\N	\N	f	\N	\N
3324	712	Trinh	Daniel	257	38	279	\N	\N	\N	f	\N	\N
3325	713	Venit	Michael	257	39	281	\N	\N	\N	f	\N	\N
3399	415	Altvater	Antony	267	0	288	\N	\N	\N	f	\N	\N
3348	520	Campbell	Orion	258	3	284	\N	\N	\N	f	\N	\N
3373	545	Ficke	Brit	262	8	282	\N	\N	\N	f	\N	\N
3379	551	Litvak	Eddy	265	3	282	\N	\N	\N	f	\N	\N
3385	401	Elashry	Mouad	256	4	285	\N	\N	\N	f	\N	\N
3314	702	Liberto	Alexander	256	9	279	\N	\N	\N	f	\N	\N
3386	402	Michel	McKinley	256	11	285	\N	\N	\N	f	\N	\N
3315	703	Auchincloss	Pierre	263	2	279	\N	\N	\N	f	\N	\N
3388	404	Ingrao	Wesley	263	8	285	\N	\N	\N	f	\N	\N
3389	405	Keefer	Gavin	263	11	286	\N	\N	\N	f	\N	\N
3316	704	Martin	Timothy	263	13	280	\N	\N	\N	f	\N	\N
3337	509	Hillman	Jeremiah	268	1	283	\N	\N	\N	f	\N	\N
3338	510	Lebron-Garcia	Angel	268	2	284	\N	\N	\N	f	\N	\N
3391	407	Chu	Patrick	257	2	287	\N	\N	\N	f	\N	\N
3392	408	Clark	Henry	257	4	287	\N	\N	\N	f	\N	\N
3341	513	Dao	Jonathan	257	7	282	\N	\N	\N	f	\N	\N
3318	706	Devroye	Samuel	257	8	281	\N	\N	\N	f	\N	\N
3393	409	Hall	Finn	257	13	286	\N	\N	\N	f	\N	\N
3344	516	Nguyen	Thanh-Trieu	257	24	284	\N	\N	\N	f	\N	\N
3345	517	Rollins	Zachary	257	27	282	\N	\N	\N	f	\N	\N
3346	518	Saine	Dawda	257	28	282	\N	\N	\N	f	\N	\N
3398	414	Smith	Connor	257	32	287	\N	\N	\N	f	\N	\N
3402	418	Robell	Peter	267	5	288	\N	\N	\N	f	\N	\N
3349	521	Diveley	Andrew	258	7	282	\N	\N	\N	f	\N	\N
3350	522	Harman	Connor	258	11	282	\N	\N	\N	f	\N	\N
3351	523	Haycock	Wesley	258	12	283	\N	\N	\N	f	\N	\N
3352	524	Kestler	Spencer	258	14	282	\N	\N	\N	f	\N	\N
3353	525	Kofie	Malakai	258	15	284	\N	\N	\N	f	\N	\N
3403	419	Kunda	Becker	258	16	287	\N	\N	\N	f	\N	\N
3404	420	Mazzuca	Luke	258	23	287	\N	\N	\N	f	\N	\N
3408	424	Ostrowski	Tyler	258	30	287	\N	\N	\N	f	\N	\N
3357	529	Simpson	Sergei	258	36	283	\N	\N	\N	f	\N	\N
3410	426	Eastley	Cole	259	3	287	\N	\N	\N	f	\N	\N
3359	531	Oberoi	Arjun	259	13	282	\N	\N	\N	f	\N	\N
3414	430	Prashar	Vaughn	259	14	287	\N	\N	\N	f	\N	\N
3361	533	Shapiro	Zachary	259	17	282	\N	\N	\N	f	\N	\N
3362	534	Wylie	Jordan	259	23	283	\N	\N	\N	f	\N	\N
3363	535	Black	Oliver	260	2	284	\N	\N	\N	f	\N	\N
3364	536	Cox	Jason	260	4	282	\N	\N	\N	f	\N	\N
3365	537	Ludwig	Ethan	260	13	283	\N	\N	\N	f	\N	\N
3366	538	Nesspor	Ryan	260	15	282	\N	\N	\N	f	\N	\N
3367	539	Rosenberg	Benjamin	260	16	282	\N	\N	\N	f	\N	\N
3368	540	Durso	Reese	261	5	283	\N	\N	\N	f	\N	\N
3369	541	Gaskill	Matthew	261	6	282	\N	\N	\N	f	\N	\N
3370	542	Pretto Simmons	Jeremie	261	16	284	\N	\N	\N	f	\N	\N
3371	543	Raymond	Andrew	261	17	283	\N	\N	\N	f	\N	\N
3372	544	Roach	Justin	261	21	282	\N	\N	\N	f	\N	\N
3327	715	Currie	Benjamin	262	6	279	\N	\N	\N	f	\N	\N
3374	546	Hibbert	Andrew	262	9	284	\N	\N	\N	f	\N	\N
3375	547	Schrott	Connor	262	14	282	\N	\N	\N	f	\N	\N
3376	548	Schrott	Tyler	262	15	282	\N	\N	\N	f	\N	\N
3377	549	Simons	Dylan	264	2	284	\N	\N	\N	f	\N	\N
3378	550	Simons	Hunter	264	3	284	\N	\N	\N	f	\N	\N
3328	716	Stearn	Finley	264	6	281	\N	\N	\N	f	\N	\N
3380	552	Moroney	David	265	6	284	\N	\N	\N	f	\N	\N
3381	553	Shedrick	Xavier	265	7	282	\N	\N	\N	f	\N	\N
3382	554	Stanford	Simon	265	9	282	\N	\N	\N	f	\N	\N
3383	555	Thompson	Ellis	265	10	284	\N	\N	\N	f	\N	\N
3384	556	Yarber	Christopher	265	12	284	\N	\N	\N	f	\N	\N
3330	502	Foster	Kyle	256	6	283	\N	\N	\N	f	\N	\N
3387	403	Snyder	Owen	256	13	285	\N	\N	\N	f	\N	\N
3332	504	Allen	Evan	263	0	284	\N	\N	\N	f	\N	\N
3334	506	Irons	Isaiah	263	9	284	\N	\N	\N	f	\N	\N
3335	507	Kirvan	Michael	263	12	282	\N	\N	\N	f	\N	\N
3317	705	Shin	Brandon	263	18	279	\N	\N	\N	f	\N	\N
3339	511	Chung	Riley	257	3	282	\N	\N	\N	f	\N	\N
3340	512	Cowan	Drew	257	6	282	\N	\N	\N	f	\N	\N
3394	410	Hall	Kai	257	14	287	\N	\N	\N	f	\N	\N
3395	411	Hayter	Miles	257	15	287	\N	\N	\N	f	\N	\N
3321	709	Henry	Maliel	257	16	279	\N	\N	\N	f	\N	\N
3343	515	Nguyen	Damon	257	23	282	\N	\N	\N	f	\N	\N
3322	710	Syed	Aaban	257	35	281	\N	\N	\N	f	\N	\N
3397	413	Smith	Liam	257	33	286	\N	\N	\N	f	\N	\N
3400	416	Carson	Michael	267	1	285	\N	\N	\N	f	\N	\N
3401	417	Fabian	Owen	267	2	285	\N	\N	\N	f	\N	\N
3347	519	Homan	Connor	267	4	282	\N	\N	\N	f	\N	\N
3326	714	Berman	Joshua	258	1	281	\N	\N	\N	f	\N	\N
3354	526	Kunda	Bode	258	17	284	\N	\N	\N	f	\N	\N
3405	421	Miller	Alex	258	25	285	\N	\N	\N	f	\N	\N
3407	423	Morrison	Colin	258	27	287	\N	\N	\N	f	\N	\N
3355	527	Muhammad	Dawud	258	29	284	\N	\N	\N	f	\N	\N
3406	422	Morrison	Tyler	258	28	287	\N	\N	\N	f	\N	\N
3409	425	Richards	Adam	258	32	285	\N	\N	\N	f	\N	\N
3356	528	Sheppard	Keon	258	35	284	\N	\N	\N	f	\N	\N
3411	427	Harris	Malachi	259	5	286	\N	\N	\N	f	\N	\N
3412	428	Levonenko	Victor	259	9	287	\N	\N	\N	f	\N	\N
3413	429	Medina	Evan	259	11	287	\N	\N	\N	f	\N	\N
3358	530	Morris	Joshua	259	12	282	\N	\N	\N	f	\N	\N
3360	532	Rusk	Evan	259	15	282	\N	\N	\N	f	\N	\N
3438	454	Iacono	Luke	264	0	285	\N	\N	\N	f	\N	\N
3439	455	Joseph	Jarek	264	1	285	\N	\N	\N	f	\N	\N
3448	104	Stearn	Finley	264	7	289	\N	\N	\N	f	\N	\N
3440	456	Frempong	Nathaniel	265	0	287	\N	\N	\N	f	\N	\N
3441	457	Matti	Judah	265	5	287	\N	\N	\N	f	\N	\N
3442	458	Slayton	Robbie	265	8	285	\N	\N	\N	f	\N	\N
3443	459	Valencia	Aaron	265	11	287	\N	\N	\N	f	\N	\N
3444	1001	Belden	Lucas	256	0	274	\N	\N	0	f	\N	\N
3329	501	Borland	Sebastian	266	0	282	\N	\N	\N	f	\N	\N
3269	601	Fisher	Elijah	266	1	276	\N	\N	\N	f	\N	\N
3445	101	Kuzmenchuk	Aleksandr	258	18	289	\N	\N	\N	f	\N	\N
3446	102	Lutchman	Dhiren	258	20	289	\N	\N	\N	f	\N	\N
3415	431	Scholz	Nolan	259	16	287	\N	\N	\N	f	\N	\N
3416	432	Tarapunov	Andrey	259	20	287	\N	\N	\N	f	\N	\N
3417	433	Thomson	Gavin	259	21	286	\N	\N	\N	f	\N	\N
3418	434	Anderton	Braeden	260	0	286	\N	\N	\N	f	\N	\N
3419	435	Becker	Anderson	260	1	287	\N	\N	\N	f	\N	\N
3420	436	Greer	Marshall	260	6	287	\N	\N	\N	f	\N	\N
3421	437	Horrigan	Sean	260	7	287	\N	\N	\N	f	\N	\N
3422	438	Liang	Will	260	12	287	\N	\N	\N	f	\N	\N
3423	439	Nesspor	Logan	260	14	286	\N	\N	\N	f	\N	\N
3424	440	Silao	Zachary	260	19	287	\N	\N	\N	f	\N	\N
3425	441	Ashton	Xavier	261	0	287	\N	\N	\N	f	\N	\N
3426	442	Cyr	Theodore	261	3	286	\N	\N	\N	f	\N	\N
3427	443	Keffer	David	261	11	288	\N	\N	\N	f	\N	\N
3428	444	Levy	Darnell	261	12	285	\N	\N	\N	f	\N	\N
3429	445	Nelson	Kenneth	261	14	287	\N	\N	\N	f	\N	\N
3430	446	Reed	Benjamin	261	18	287	\N	\N	\N	f	\N	\N
3431	447	Reed	Caleb	261	19	287	\N	\N	\N	f	\N	\N
3432	448	Roach	Jeremiah	261	20	287	\N	\N	\N	f	\N	\N
3447	103	Young	Khoi	261	25	289	\N	\N	\N	f	\N	\N
3433	449	Alfaro	Santiago	262	0	287	\N	\N	\N	f	\N	\N
3434	450	Burgess	Caden	262	3	287	\N	\N	\N	f	\N	\N
3435	451	Letvin	Benjamin	262	10	285	\N	\N	\N	f	\N	\N
3436	452	Samuel	Nile	262	13	287	\N	\N	\N	f	\N	\N
3437	453	Seleznev	Gregory	262	16	285	\N	\N	\N	f	\N	\N
\.


--
-- Name: gymnastics_athlete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_athlete_id_seq', 3448, true);


--
-- Data for Name: gymnastics_athleteevent; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_athleteevent (id, score, athlete_id, event_id, rank) FROM stdin;
19339	\N	3224	1	1
19357	\N	3227	1	1
19327	\N	3222	1	1
19273	\N	3213	1	1
19285	\N	3215	1	1
19309	\N	3219	1	1
19345	\N	3225	1	1
19316	\N	3220	2	1
19381	\N	3231	1	1
19291	\N	3216	1	1
19279	\N	3214	1	1
19375	\N	3230	1	1
19399	\N	3234	1	1
19321	\N	3221	1	1
19303	\N	3218	1	1
19376	\N	3230	2	1
19382	\N	3231	2	1
19340	\N	3224	2	1
19311	\N	3219	3	1
19274	\N	3213	2	1
19358	\N	3227	2	1
19322	\N	3221	2	1
19406	\N	3235	2	1
19310	\N	3219	2	1
19328	\N	3222	2	1
19280	\N	3214	2	1
19292	\N	3216	2	1
19304	\N	3218	2	1
19400	\N	3234	2	1
19346	\N	3225	2	1
19305	\N	3218	3	1
19293	\N	3216	3	1
19281	\N	3214	3	1
19383	\N	3231	3	1
19275	\N	3213	3	1
19317	\N	3220	3	1
19347	\N	3225	3	1
19323	\N	3221	3	1
19288	\N	3215	4	1
19371	\N	3229	3	1
19359	\N	3227	3	1
19287	\N	3215	3	1
19341	\N	3224	3	1
19377	\N	3230	3	1
19407	\N	3235	3	1
19329	\N	3222	3	1
19402	\N	3234	4	1
19324	\N	3221	4	1
19372	\N	3229	4	1
19408	\N	3235	4	1
19325	\N	3221	5	1
19318	\N	3220	4	1
19276	\N	3213	4	1
19306	\N	3218	4	1
19360	\N	3227	4	1
19384	\N	3231	4	1
19294	\N	3216	4	1
19312	\N	3219	4	1
19342	\N	3224	4	1
19330	\N	3222	4	1
19282	\N	3214	4	1
19385	\N	3231	5	1
19343	\N	3224	5	1
19295	\N	3216	5	1
19319	\N	3220	5	1
19409	\N	3235	5	1
19277	\N	3213	5	1
19290	\N	3215	6	1
19349	\N	3225	5	1
19331	\N	3222	5	1
19379	\N	3230	5	1
19313	\N	3219	5	1
19289	\N	3215	5	1
19373	\N	3229	5	1
19361	\N	3227	5	1
19403	\N	3234	5	1
19283	\N	3214	5	1
19278	\N	3213	6	1
19320	\N	3220	6	1
19404	\N	3234	6	1
19284	\N	3214	6	1
19363	\N	3228	1	1
19308	\N	3218	6	1
19410	\N	3235	6	1
19314	\N	3219	6	1
19380	\N	3230	6	1
19326	\N	3221	6	1
19296	\N	3216	6	1
19332	\N	3222	6	1
19350	\N	3225	6	1
19374	\N	3229	6	1
19362	\N	3227	6	1
19387	\N	3232	1	1
19333	\N	3223	1	1
19351	\N	3226	1	1
19393	\N	3233	1	1
19388	\N	3232	2	1
19394	\N	3233	2	1
19352	\N	3226	2	1
19364	\N	3228	2	1
19353	\N	3226	3	1
19335	\N	3223	3	1
19365	\N	3228	3	1
19395	\N	3233	3	1
19389	\N	3232	3	1
19609	\N	3269	1	\N
19610	\N	3269	2	\N
19611	\N	3269	3	\N
19612	\N	3269	4	\N
19613	\N	3269	5	\N
19614	\N	3269	6	\N
19615	\N	3270	1	\N
19616	\N	3270	2	\N
19617	\N	3270	3	\N
19618	\N	3270	4	\N
19619	\N	3270	5	\N
19620	\N	3270	6	\N
19621	\N	3271	1	\N
19622	\N	3271	2	\N
19623	\N	3271	3	\N
19624	\N	3271	4	\N
19625	\N	3271	5	\N
19626	\N	3271	6	\N
19627	\N	3272	1	\N
19628	\N	3272	2	\N
19629	\N	3272	3	\N
19630	\N	3272	4	\N
19631	\N	3272	5	\N
19632	\N	3272	6	\N
19633	\N	3273	1	\N
19634	\N	3273	2	\N
19635	\N	3273	3	\N
19636	\N	3273	4	\N
19637	\N	3273	5	\N
19638	\N	3273	6	\N
19639	\N	3274	1	\N
19640	\N	3274	2	\N
19641	\N	3274	3	\N
19642	\N	3274	4	\N
19543	\N	3258	1	1
19597	\N	3267	1	1
19567	\N	3262	1	1
19591	\N	3266	1	1
19603	\N	3268	1	1
19573	\N	3263	1	1
19586	\N	3265	2	1
19598	\N	3267	2	1
19568	\N	3262	2	1
19574	\N	3263	2	1
19604	\N	3268	2	1
19544	\N	3258	2	1
19592	\N	3266	2	1
19581	\N	3264	3	1
19605	\N	3268	3	1
19569	\N	3262	3	1
19545	\N	3258	3	1
19575	\N	3263	3	1
19587	\N	3265	3	1
19594	\N	3266	4	1
19593	\N	3266	3	1
19570	\N	3262	4	1
19576	\N	3263	4	1
19606	\N	3268	4	1
19588	\N	3265	4	1
19546	\N	3258	4	1
19600	\N	3267	4	1
19583	\N	3264	5	1
19607	\N	3268	5	1
19547	\N	3258	5	1
19595	\N	3266	5	1
19589	\N	3265	5	1
19577	\N	3263	5	1
19571	\N	3262	5	1
19601	\N	3267	5	1
19608	\N	3268	6	1
19578	\N	3263	6	1
19548	\N	3258	6	1
19572	\N	3262	6	1
19590	\N	3265	6	1
19602	\N	3267	6	1
19531	\N	3256	1	1
19596	\N	3266	6	1
19561	\N	3261	1	1
19537	\N	3257	1	1
19549	\N	3259	1	1
19538	\N	3257	2	1
19550	\N	3259	2	1
19556	\N	3260	2	1
19532	\N	3256	2	1
19539	\N	3257	3	1
19562	\N	3261	2	1
19563	\N	3261	3	1
19557	\N	3260	3	1
19533	\N	3256	3	1
19551	\N	3259	3	1
19552	\N	3259	4	1
19534	\N	3256	4	1
19564	\N	3261	4	1
19565	\N	3261	5	1
19558	\N	3260	4	1
19553	\N	3259	5	1
19541	\N	3257	5	1
19535	\N	3256	5	1
19559	\N	3260	5	1
19542	\N	3257	6	1
19554	\N	3259	6	1
19560	\N	3260	6	1
19566	\N	3261	6	1
19465	\N	3245	1	1
19519	\N	3254	1	1
19495	\N	3250	1	1
19483	\N	3248	1	1
19471	\N	3246	1	1
19507	\N	3252	1	1
19508	\N	3252	2	1
19513	\N	3253	1	1
19459	\N	3244	1	1
19477	\N	3247	1	1
19501	\N	3251	1	1
19466	\N	3245	2	1
19502	\N	3251	2	1
19514	\N	3253	2	1
19460	\N	3244	2	1
19472	\N	3246	2	1
19520	\N	3254	2	1
19491	\N	3249	3	1
19484	\N	3248	2	1
19490	\N	3249	2	1
19496	\N	3250	2	1
19521	\N	3254	3	1
19510	\N	3252	4	1
19485	\N	3248	3	1
19509	\N	3252	3	1
19461	\N	3244	3	1
19503	\N	3251	3	1
19467	\N	3245	3	1
19479	\N	3247	3	1
19473	\N	3246	3	1
19515	\N	3253	3	1
19474	\N	3246	4	1
19468	\N	3245	4	1
19492	\N	3249	4	1
19498	\N	3250	4	1
19486	\N	3248	4	1
19643	\N	3274	5	\N
19644	\N	3274	6	\N
19645	\N	3275	1	\N
19646	\N	3275	2	\N
19647	\N	3275	3	\N
19648	\N	3275	4	\N
19649	\N	3275	5	\N
19650	\N	3275	6	\N
19651	\N	3276	1	\N
19652	\N	3276	2	\N
19653	\N	3276	3	\N
19654	\N	3276	4	\N
19655	\N	3276	5	\N
19656	\N	3276	6	\N
19657	\N	3277	1	\N
19658	\N	3277	2	\N
19659	\N	3277	3	\N
19660	\N	3277	4	\N
19661	\N	3277	5	\N
19662	\N	3277	6	\N
19663	\N	3278	1	\N
19664	\N	3278	2	\N
19665	\N	3278	3	\N
19666	\N	3278	4	\N
19667	\N	3278	5	\N
19668	\N	3278	6	\N
19669	\N	3279	1	\N
19670	\N	3279	2	\N
19671	\N	3279	3	\N
19672	\N	3279	4	\N
19673	\N	3279	5	\N
19674	\N	3279	6	\N
19675	\N	3280	1	\N
19676	\N	3280	2	\N
19677	\N	3280	3	\N
19678	\N	3280	4	\N
19679	\N	3280	5	\N
19680	\N	3280	6	\N
19681	\N	3281	1	\N
19682	\N	3281	2	\N
19683	\N	3281	3	\N
19684	\N	3281	4	\N
19685	\N	3281	5	\N
19686	\N	3281	6	\N
19687	\N	3282	1	\N
19688	\N	3282	2	\N
19689	\N	3282	3	\N
19690	\N	3282	4	\N
19691	\N	3282	5	\N
19692	\N	3282	6	\N
19693	\N	3283	1	\N
19694	\N	3283	2	\N
19695	\N	3283	3	\N
19696	\N	3283	4	\N
19697	\N	3283	5	\N
19698	\N	3283	6	\N
19699	\N	3284	1	\N
19700	\N	3284	2	\N
19701	\N	3284	3	\N
19702	\N	3284	4	\N
19703	\N	3284	5	\N
19704	\N	3284	6	\N
19705	\N	3285	1	\N
19706	\N	3285	2	\N
19707	\N	3285	3	\N
19708	\N	3285	4	\N
19709	\N	3285	5	\N
19710	\N	3285	6	\N
19711	\N	3286	1	\N
19712	\N	3286	2	\N
19713	\N	3286	3	\N
19714	\N	3286	4	\N
19715	\N	3286	5	\N
19716	\N	3286	6	\N
19717	\N	3287	1	\N
19718	\N	3287	2	\N
19719	\N	3287	3	\N
19720	\N	3287	4	\N
19721	\N	3287	5	\N
19722	\N	3287	6	\N
19723	\N	3288	1	\N
19724	\N	3288	2	\N
19725	\N	3288	3	\N
19726	\N	3288	4	\N
19727	\N	3288	5	\N
19728	\N	3288	6	\N
19729	\N	3289	1	\N
19730	\N	3289	2	\N
19731	\N	3289	3	\N
19732	\N	3289	4	\N
19733	\N	3289	5	\N
19734	\N	3289	6	\N
19735	\N	3290	1	\N
19736	\N	3290	2	\N
19737	\N	3290	3	\N
19738	\N	3290	4	\N
19739	\N	3290	5	\N
19740	\N	3290	6	\N
19741	\N	3291	1	\N
19742	\N	3291	2	\N
19743	\N	3291	3	\N
19744	\N	3291	4	\N
19745	\N	3291	5	\N
19746	\N	3291	6	\N
19747	\N	3292	1	\N
19748	\N	3292	2	\N
19749	\N	3292	3	\N
19750	\N	3292	4	\N
19751	\N	3292	5	\N
19752	\N	3292	6	\N
19753	\N	3293	1	\N
19754	\N	3293	2	\N
19755	\N	3293	3	\N
19756	\N	3293	4	\N
19757	\N	3293	5	\N
19758	\N	3293	6	\N
19759	\N	3294	1	\N
19760	\N	3294	2	\N
19761	\N	3294	3	\N
19762	\N	3294	4	\N
19763	\N	3294	5	\N
19764	\N	3294	6	\N
19765	\N	3295	1	\N
19766	\N	3295	2	\N
19767	\N	3295	3	\N
19768	\N	3295	4	\N
19769	\N	3295	5	\N
19770	\N	3295	6	\N
19771	\N	3296	1	\N
19772	\N	3296	2	\N
19773	\N	3296	3	\N
19774	\N	3296	4	\N
19775	\N	3296	5	\N
19776	\N	3296	6	\N
19777	\N	3297	1	\N
19778	\N	3297	2	\N
19779	\N	3297	3	\N
19780	\N	3297	4	\N
19781	\N	3297	5	\N
19782	\N	3297	6	\N
19783	\N	3298	1	\N
19784	\N	3298	2	\N
19785	\N	3298	3	\N
19786	\N	3298	4	\N
19787	\N	3298	5	\N
19788	\N	3298	6	\N
19789	\N	3299	1	\N
19790	\N	3299	2	\N
19791	\N	3299	3	\N
19792	\N	3299	4	\N
19793	\N	3299	5	\N
19794	\N	3299	6	\N
19795	\N	3300	1	\N
19796	\N	3300	2	\N
19797	\N	3300	3	\N
19798	\N	3300	4	\N
19799	\N	3300	5	\N
19800	\N	3300	6	\N
19801	\N	3301	1	\N
19802	\N	3301	2	\N
19803	\N	3301	3	\N
19804	\N	3301	4	\N
19805	\N	3301	5	\N
19806	\N	3301	6	\N
19807	\N	3302	1	\N
19808	\N	3302	2	\N
19809	\N	3302	3	\N
19810	\N	3302	4	\N
19811	\N	3302	5	\N
19812	\N	3302	6	\N
19813	\N	3303	1	\N
19814	\N	3303	2	\N
19815	\N	3303	3	\N
19816	\N	3303	4	\N
19817	\N	3303	5	\N
19818	\N	3303	6	\N
19819	\N	3304	1	\N
19820	\N	3304	2	\N
19821	\N	3304	3	\N
19822	\N	3304	4	\N
19823	\N	3304	5	\N
19824	\N	3304	6	\N
19825	\N	3305	1	\N
19826	\N	3305	2	\N
19827	\N	3305	3	\N
19828	\N	3305	4	\N
19829	\N	3305	5	\N
19830	\N	3305	6	\N
19831	\N	3306	1	\N
19832	\N	3306	2	\N
19833	\N	3306	3	\N
19834	\N	3306	4	\N
19835	\N	3306	5	\N
19836	\N	3306	6	\N
19837	\N	3307	1	\N
19838	\N	3307	2	\N
19839	\N	3307	3	\N
19840	\N	3307	4	\N
19841	\N	3307	5	\N
19842	\N	3307	6	\N
19843	\N	3308	1	\N
19844	\N	3308	2	\N
19845	\N	3308	3	\N
19846	\N	3308	4	\N
19847	\N	3308	5	\N
19848	\N	3308	6	\N
19849	\N	3309	1	\N
19850	\N	3309	2	\N
19851	\N	3309	3	\N
19852	\N	3309	4	\N
19853	\N	3309	5	\N
19854	\N	3309	6	\N
19855	\N	3310	1	\N
19856	\N	3310	2	\N
19857	\N	3310	3	\N
19858	\N	3310	4	\N
19859	\N	3310	5	\N
19860	\N	3310	6	\N
19861	\N	3311	1	\N
19862	\N	3311	2	\N
19863	\N	3311	3	\N
19864	\N	3311	4	\N
19865	\N	3311	5	\N
19866	\N	3311	6	\N
19867	\N	3312	1	\N
19868	\N	3312	2	\N
19869	\N	3312	3	\N
19870	\N	3312	4	\N
19871	\N	3312	5	\N
19872	\N	3312	6	\N
19873	\N	3313	1	\N
19874	\N	3313	2	\N
19875	\N	3313	3	\N
19876	\N	3313	4	\N
19877	\N	3313	5	\N
19878	\N	3313	6	\N
19879	\N	3314	1	\N
19880	\N	3314	2	\N
19881	\N	3314	3	\N
19882	\N	3314	4	\N
19883	\N	3314	5	\N
19884	\N	3314	6	\N
19885	\N	3315	1	\N
19886	\N	3315	2	\N
19887	\N	3315	3	\N
19888	\N	3315	4	\N
19889	\N	3315	5	\N
19890	\N	3315	6	\N
19891	\N	3316	1	\N
19892	\N	3316	2	\N
19893	\N	3316	3	\N
19894	\N	3316	4	\N
19895	\N	3316	5	\N
19896	\N	3316	6	\N
19897	\N	3317	1	\N
19898	\N	3317	2	\N
19899	\N	3317	3	\N
19900	\N	3317	4	\N
19901	\N	3317	5	\N
19902	\N	3317	6	\N
19903	\N	3318	1	\N
19904	\N	3318	2	\N
19905	\N	3318	3	\N
19906	\N	3318	4	\N
19907	\N	3318	5	\N
19908	\N	3318	6	\N
19909	\N	3319	1	\N
19910	\N	3319	2	\N
19911	\N	3319	3	\N
19912	\N	3319	4	\N
19913	\N	3319	5	\N
19914	\N	3319	6	\N
19915	\N	3320	1	\N
19916	\N	3320	2	\N
19917	\N	3320	3	\N
19918	\N	3320	4	\N
19919	\N	3320	5	\N
19920	\N	3320	6	\N
19921	\N	3321	1	\N
19922	\N	3321	2	\N
19923	\N	3321	3	\N
19924	\N	3321	4	\N
19925	\N	3321	5	\N
19926	\N	3321	6	\N
19927	\N	3322	1	\N
19928	\N	3322	2	\N
19929	\N	3322	3	\N
19930	\N	3322	4	\N
19931	\N	3322	5	\N
19932	\N	3322	6	\N
19933	\N	3323	1	\N
19934	\N	3323	2	\N
19935	\N	3323	3	\N
19936	\N	3323	4	\N
19937	\N	3323	5	\N
19938	\N	3323	6	\N
19939	\N	3324	1	\N
19940	\N	3324	2	\N
19941	\N	3324	3	\N
19942	\N	3324	4	\N
19943	\N	3324	5	\N
19944	\N	3324	6	\N
19945	\N	3325	1	\N
19946	\N	3325	2	\N
19947	\N	3325	3	\N
19948	\N	3325	4	\N
19949	\N	3325	5	\N
19950	\N	3325	6	\N
19951	\N	3326	1	\N
19952	\N	3326	2	\N
19953	\N	3326	3	\N
19954	\N	3326	4	\N
19955	\N	3326	5	\N
19956	\N	3326	6	\N
19957	\N	3327	1	\N
19958	\N	3327	2	\N
19959	\N	3327	3	\N
19960	\N	3327	4	\N
19961	\N	3327	5	\N
19962	\N	3327	6	\N
19963	\N	3328	1	\N
19964	\N	3328	2	\N
19965	\N	3328	3	\N
19966	\N	3328	4	\N
19967	\N	3328	5	\N
19968	\N	3328	6	\N
19969	\N	3329	1	\N
19970	\N	3329	2	\N
19971	\N	3329	3	\N
19972	\N	3329	4	\N
19973	\N	3329	5	\N
19974	\N	3329	6	\N
19975	\N	3330	1	\N
19976	\N	3330	2	\N
19977	\N	3330	3	\N
19978	\N	3330	4	\N
19979	\N	3330	5	\N
19980	\N	3330	6	\N
19981	\N	3331	1	\N
19982	\N	3331	2	\N
19983	\N	3331	3	\N
19984	\N	3331	4	\N
19985	\N	3331	5	\N
19986	\N	3331	6	\N
19987	\N	3332	1	\N
19988	\N	3332	2	\N
19989	\N	3332	3	\N
19990	\N	3332	4	\N
19991	\N	3332	5	\N
19992	\N	3332	6	\N
19993	\N	3333	1	\N
19994	\N	3333	2	\N
19995	\N	3333	3	\N
19996	\N	3333	4	\N
19997	\N	3333	5	\N
19998	\N	3333	6	\N
19999	\N	3334	1	\N
20000	\N	3334	2	\N
20001	\N	3334	3	\N
20002	\N	3334	4	\N
20003	\N	3334	5	\N
20004	\N	3334	6	\N
20005	\N	3335	1	\N
20006	\N	3335	2	\N
20007	\N	3335	3	\N
20008	\N	3335	4	\N
20009	\N	3335	5	\N
20010	\N	3335	6	\N
20011	\N	3336	1	\N
20012	\N	3336	2	\N
20013	\N	3336	3	\N
20014	\N	3336	4	\N
20015	\N	3336	5	\N
20016	\N	3336	6	\N
20017	\N	3337	1	\N
20018	\N	3337	2	\N
20019	\N	3337	3	\N
20020	\N	3337	4	\N
20021	\N	3337	5	\N
20022	\N	3337	6	\N
20023	\N	3338	1	\N
20024	\N	3338	2	\N
20025	\N	3338	3	\N
20026	\N	3338	4	\N
20027	\N	3338	5	\N
20028	\N	3338	6	\N
20029	\N	3339	1	\N
20030	\N	3339	2	\N
20031	\N	3339	3	\N
20032	\N	3339	4	\N
20033	\N	3339	5	\N
20034	\N	3339	6	\N
20035	\N	3340	1	\N
20036	\N	3340	2	\N
20037	\N	3340	3	\N
20038	\N	3340	4	\N
20039	\N	3340	5	\N
20040	\N	3340	6	\N
20041	\N	3341	1	\N
20042	\N	3341	2	\N
20043	\N	3341	3	\N
20044	\N	3341	4	\N
20045	\N	3341	5	\N
20046	\N	3341	6	\N
20047	\N	3342	1	\N
20048	\N	3342	2	\N
20049	\N	3342	3	\N
20050	\N	3342	4	\N
20051	\N	3342	5	\N
20052	\N	3342	6	\N
20053	\N	3343	1	\N
20054	\N	3343	2	\N
20055	\N	3343	3	\N
20056	\N	3343	4	\N
20057	\N	3343	5	\N
20058	\N	3343	6	\N
20059	\N	3344	1	\N
20060	\N	3344	2	\N
20061	\N	3344	3	\N
20062	\N	3344	4	\N
20063	\N	3344	5	\N
20064	\N	3344	6	\N
20065	\N	3345	1	\N
20066	\N	3345	2	\N
20067	\N	3345	3	\N
20068	\N	3345	4	\N
20069	\N	3345	5	\N
20070	\N	3345	6	\N
20071	\N	3346	1	\N
20072	\N	3346	2	\N
20073	\N	3346	3	\N
20074	\N	3346	4	\N
20075	\N	3346	5	\N
20076	\N	3346	6	\N
20077	\N	3347	1	\N
20078	\N	3347	2	\N
20079	\N	3347	3	\N
20080	\N	3347	4	\N
20081	\N	3347	5	\N
20082	\N	3347	6	\N
20083	\N	3348	1	\N
20084	\N	3348	2	\N
20085	\N	3348	3	\N
20086	\N	3348	4	\N
20087	\N	3348	5	\N
20088	\N	3348	6	\N
20089	\N	3349	1	\N
20090	\N	3349	2	\N
20091	\N	3349	3	\N
20092	\N	3349	4	\N
20093	\N	3349	5	\N
20094	\N	3349	6	\N
20095	\N	3350	1	\N
20096	\N	3350	2	\N
20097	\N	3350	3	\N
20098	\N	3350	4	\N
20099	\N	3350	5	\N
20100	\N	3350	6	\N
20101	\N	3351	1	\N
20102	\N	3351	2	\N
20103	\N	3351	3	\N
20104	\N	3351	4	\N
20105	\N	3351	5	\N
20106	\N	3351	6	\N
20107	\N	3352	1	\N
20108	\N	3352	2	\N
20109	\N	3352	3	\N
20110	\N	3352	4	\N
20111	\N	3352	5	\N
20112	\N	3352	6	\N
20113	\N	3353	1	\N
20114	\N	3353	2	\N
20115	\N	3353	3	\N
20116	\N	3353	4	\N
20117	\N	3353	5	\N
20118	\N	3353	6	\N
20119	\N	3354	1	\N
20120	\N	3354	2	\N
20121	\N	3354	3	\N
20122	\N	3354	4	\N
20123	\N	3354	5	\N
20124	\N	3354	6	\N
20125	\N	3355	1	\N
20126	\N	3355	2	\N
20127	\N	3355	3	\N
20128	\N	3355	4	\N
20129	\N	3355	5	\N
20130	\N	3355	6	\N
20131	\N	3356	1	\N
20132	\N	3356	2	\N
20133	\N	3356	3	\N
20134	\N	3356	4	\N
20135	\N	3356	5	\N
20136	\N	3356	6	\N
20137	\N	3357	1	\N
20138	\N	3357	2	\N
20139	\N	3357	3	\N
20140	\N	3357	4	\N
20141	\N	3357	5	\N
20142	\N	3357	6	\N
20143	\N	3358	1	\N
20144	\N	3358	2	\N
20145	\N	3358	3	\N
20146	\N	3358	4	\N
20147	\N	3358	5	\N
20148	\N	3358	6	\N
20149	\N	3359	1	\N
20150	\N	3359	2	\N
20151	\N	3359	3	\N
20152	\N	3359	4	\N
20153	\N	3359	5	\N
20154	\N	3359	6	\N
20155	\N	3360	1	\N
20156	\N	3360	2	\N
20157	\N	3360	3	\N
20158	\N	3360	4	\N
20159	\N	3360	5	\N
20160	\N	3360	6	\N
20161	\N	3361	1	\N
20162	\N	3361	2	\N
20163	\N	3361	3	\N
20164	\N	3361	4	\N
20165	\N	3361	5	\N
20166	\N	3361	6	\N
20167	\N	3362	1	\N
20168	\N	3362	2	\N
20169	\N	3362	3	\N
20170	\N	3362	4	\N
20171	\N	3362	5	\N
20172	\N	3362	6	\N
20173	\N	3363	1	\N
20174	\N	3363	2	\N
20175	\N	3363	3	\N
20176	\N	3363	4	\N
20177	\N	3363	5	\N
20178	\N	3363	6	\N
20179	\N	3364	1	\N
20180	\N	3364	2	\N
20181	\N	3364	3	\N
20182	\N	3364	4	\N
20183	\N	3364	5	\N
20184	\N	3364	6	\N
20185	\N	3365	1	\N
20186	\N	3365	2	\N
20187	\N	3365	3	\N
20188	\N	3365	4	\N
20189	\N	3365	5	\N
20190	\N	3365	6	\N
20191	\N	3366	1	\N
20192	\N	3366	2	\N
20193	\N	3366	3	\N
20194	\N	3366	4	\N
20195	\N	3366	5	\N
20196	\N	3366	6	\N
20197	\N	3367	1	\N
20198	\N	3367	2	\N
20199	\N	3367	3	\N
20200	\N	3367	4	\N
20201	\N	3367	5	\N
20202	\N	3367	6	\N
20203	\N	3368	1	\N
20204	\N	3368	2	\N
20205	\N	3368	3	\N
20206	\N	3368	4	\N
20207	\N	3368	5	\N
20208	\N	3368	6	\N
20209	\N	3369	1	\N
20210	\N	3369	2	\N
20211	\N	3369	3	\N
20212	\N	3369	4	\N
20213	\N	3369	5	\N
20214	\N	3369	6	\N
20215	\N	3370	1	\N
20216	\N	3370	2	\N
20217	\N	3370	3	\N
20218	\N	3370	4	\N
20219	\N	3370	5	\N
20220	\N	3370	6	\N
20221	\N	3371	1	\N
20222	\N	3371	2	\N
20223	\N	3371	3	\N
20224	\N	3371	4	\N
20225	\N	3371	5	\N
20226	\N	3371	6	\N
20227	\N	3372	1	\N
20228	\N	3372	2	\N
20229	\N	3372	3	\N
20230	\N	3372	4	\N
20231	\N	3372	5	\N
20232	\N	3372	6	\N
20233	\N	3373	1	\N
20234	\N	3373	2	\N
20235	\N	3373	3	\N
20236	\N	3373	4	\N
20237	\N	3373	5	\N
20238	\N	3373	6	\N
20239	\N	3374	1	\N
20240	\N	3374	2	\N
20241	\N	3374	3	\N
20242	\N	3374	4	\N
20243	\N	3374	5	\N
20244	\N	3374	6	\N
20245	\N	3375	1	\N
20246	\N	3375	2	\N
20247	\N	3375	3	\N
20248	\N	3375	4	\N
20249	\N	3375	5	\N
20250	\N	3375	6	\N
20251	\N	3376	1	\N
20252	\N	3376	2	\N
20253	\N	3376	3	\N
20254	\N	3376	4	\N
20255	\N	3376	5	\N
20256	\N	3376	6	\N
20257	\N	3377	1	\N
20258	\N	3377	2	\N
20259	\N	3377	3	\N
20260	\N	3377	4	\N
20261	\N	3377	5	\N
20262	\N	3377	6	\N
20263	\N	3378	1	\N
20264	\N	3378	2	\N
20265	\N	3378	3	\N
20266	\N	3378	4	\N
20267	\N	3378	5	\N
20268	\N	3378	6	\N
20269	\N	3379	1	\N
20270	\N	3379	2	\N
20271	\N	3379	3	\N
20272	\N	3379	4	\N
20273	\N	3379	5	\N
20274	\N	3379	6	\N
20275	\N	3380	1	\N
20276	\N	3380	2	\N
20277	\N	3380	3	\N
20278	\N	3380	4	\N
20279	\N	3380	5	\N
20280	\N	3380	6	\N
20281	\N	3381	1	\N
20282	\N	3381	2	\N
20283	\N	3381	3	\N
20284	\N	3381	4	\N
20285	\N	3381	5	\N
20286	\N	3381	6	\N
20287	\N	3382	1	\N
20288	\N	3382	2	\N
20289	\N	3382	3	\N
20290	\N	3382	4	\N
20291	\N	3382	5	\N
20292	\N	3382	6	\N
20293	\N	3383	1	\N
20294	\N	3383	2	\N
20295	\N	3383	3	\N
20296	\N	3383	4	\N
20297	\N	3383	5	\N
20298	\N	3383	6	\N
20299	\N	3384	1	\N
20300	\N	3384	2	\N
20301	\N	3384	3	\N
20302	\N	3384	4	\N
20303	\N	3384	5	\N
20304	\N	3384	6	\N
20305	\N	3385	1	\N
20306	\N	3385	2	\N
20307	\N	3385	3	\N
20308	\N	3385	4	\N
20309	\N	3385	5	\N
20310	\N	3385	6	\N
20311	\N	3386	1	\N
20312	\N	3386	2	\N
20313	\N	3386	3	\N
20314	\N	3386	4	\N
20315	\N	3386	5	\N
20316	\N	3386	6	\N
20317	\N	3387	1	\N
20318	\N	3387	2	\N
20319	\N	3387	3	\N
20320	\N	3387	4	\N
20321	\N	3387	5	\N
20322	\N	3387	6	\N
20323	\N	3388	1	\N
20324	\N	3388	2	\N
20325	\N	3388	3	\N
20326	\N	3388	4	\N
20327	\N	3388	5	\N
20328	\N	3388	6	\N
20329	\N	3389	1	\N
20330	\N	3389	2	\N
20331	\N	3389	3	\N
20332	\N	3389	4	\N
20333	\N	3389	5	\N
20334	\N	3389	6	\N
20335	\N	3390	1	\N
20336	\N	3390	2	\N
20337	\N	3390	3	\N
20338	\N	3390	4	\N
20339	\N	3390	5	\N
20340	\N	3390	6	\N
20341	\N	3391	1	\N
20342	\N	3391	2	\N
20343	\N	3391	3	\N
20344	\N	3391	4	\N
20345	\N	3391	5	\N
20346	\N	3391	6	\N
20347	\N	3392	1	\N
20348	\N	3392	2	\N
20349	\N	3392	3	\N
20350	\N	3392	4	\N
20351	\N	3392	5	\N
20352	\N	3392	6	\N
20353	\N	3393	1	\N
20354	\N	3393	2	\N
20355	\N	3393	3	\N
20356	\N	3393	4	\N
20357	\N	3393	5	\N
20358	\N	3393	6	\N
20359	\N	3394	1	\N
20360	\N	3394	2	\N
20361	\N	3394	3	\N
20362	\N	3394	4	\N
20363	\N	3394	5	\N
20364	\N	3394	6	\N
20365	\N	3395	1	\N
20366	\N	3395	2	\N
20367	\N	3395	3	\N
20368	\N	3395	4	\N
20369	\N	3395	5	\N
20370	\N	3395	6	\N
20371	\N	3396	1	\N
20372	\N	3396	2	\N
20373	\N	3396	3	\N
20374	\N	3396	4	\N
20375	\N	3396	5	\N
20376	\N	3396	6	\N
20377	\N	3397	1	\N
20378	\N	3397	2	\N
20379	\N	3397	3	\N
20380	\N	3397	4	\N
20381	\N	3397	5	\N
20382	\N	3397	6	\N
20383	\N	3398	1	\N
20384	\N	3398	2	\N
20385	\N	3398	3	\N
20386	\N	3398	4	\N
20387	\N	3398	5	\N
20388	\N	3398	6	\N
20389	\N	3399	1	\N
20390	\N	3399	2	\N
20391	\N	3399	3	\N
20392	\N	3399	4	\N
20393	\N	3399	5	\N
20394	\N	3399	6	\N
20395	\N	3400	1	\N
20396	\N	3400	2	\N
20397	\N	3400	3	\N
20398	\N	3400	4	\N
20399	\N	3400	5	\N
20400	\N	3400	6	\N
20401	\N	3401	1	\N
20402	\N	3401	2	\N
20403	\N	3401	3	\N
20404	\N	3401	4	\N
20405	\N	3401	5	\N
20406	\N	3401	6	\N
20407	\N	3402	1	\N
20408	\N	3402	2	\N
20409	\N	3402	3	\N
20410	\N	3402	4	\N
20411	\N	3402	5	\N
20412	\N	3402	6	\N
20413	\N	3403	1	\N
20414	\N	3403	2	\N
20415	\N	3403	3	\N
20416	\N	3403	4	\N
20417	\N	3403	5	\N
20418	\N	3403	6	\N
20419	\N	3404	1	\N
20420	\N	3404	2	\N
20421	\N	3404	3	\N
20422	\N	3404	4	\N
20423	\N	3404	5	\N
20424	\N	3404	6	\N
20425	\N	3405	1	\N
20426	\N	3405	2	\N
20427	\N	3405	3	\N
20428	\N	3405	4	\N
20429	\N	3405	5	\N
20430	\N	3405	6	\N
20431	\N	3406	1	\N
20432	\N	3406	2	\N
20433	\N	3406	3	\N
20434	\N	3406	4	\N
20435	\N	3406	5	\N
20436	\N	3406	6	\N
20437	\N	3407	1	\N
20438	\N	3407	2	\N
20439	\N	3407	3	\N
20440	\N	3407	4	\N
20441	\N	3407	5	\N
20442	\N	3407	6	\N
20443	\N	3408	1	\N
20444	\N	3408	2	\N
20445	\N	3408	3	\N
20446	\N	3408	4	\N
20447	\N	3408	5	\N
20448	\N	3408	6	\N
20449	\N	3409	1	\N
20450	\N	3409	2	\N
20451	\N	3409	3	\N
20452	\N	3409	4	\N
20453	\N	3409	5	\N
20454	\N	3409	6	\N
20455	\N	3410	1	\N
20456	\N	3410	2	\N
20457	\N	3410	3	\N
20458	\N	3410	4	\N
20459	\N	3410	5	\N
20460	\N	3410	6	\N
20461	\N	3411	1	\N
20462	\N	3411	2	\N
20463	\N	3411	3	\N
20464	\N	3411	4	\N
20465	\N	3411	5	\N
20466	\N	3411	6	\N
20467	\N	3412	1	\N
20468	\N	3412	2	\N
20469	\N	3412	3	\N
20470	\N	3412	4	\N
20471	\N	3412	5	\N
20472	\N	3412	6	\N
20473	\N	3413	1	\N
20474	\N	3413	2	\N
20475	\N	3413	3	\N
20476	\N	3413	4	\N
20477	\N	3413	5	\N
20478	\N	3413	6	\N
20479	\N	3414	1	\N
20480	\N	3414	2	\N
20481	\N	3414	3	\N
20482	\N	3414	4	\N
20483	\N	3414	5	\N
20484	\N	3414	6	\N
20485	\N	3415	1	\N
20486	\N	3415	2	\N
20487	\N	3415	3	\N
20488	\N	3415	4	\N
20489	\N	3415	5	\N
20490	\N	3415	6	\N
20491	\N	3416	1	\N
20492	\N	3416	2	\N
20493	\N	3416	3	\N
20494	\N	3416	4	\N
20495	\N	3416	5	\N
20496	\N	3416	6	\N
20497	\N	3417	1	\N
20498	\N	3417	2	\N
20499	\N	3417	3	\N
20500	\N	3417	4	\N
20501	\N	3417	5	\N
20502	\N	3417	6	\N
20503	\N	3418	1	\N
20504	\N	3418	2	\N
20505	\N	3418	3	\N
20506	\N	3418	4	\N
20507	\N	3418	5	\N
20508	\N	3418	6	\N
20509	\N	3419	1	\N
20510	\N	3419	2	\N
20511	\N	3419	3	\N
20512	\N	3419	4	\N
20513	\N	3419	5	\N
20514	\N	3419	6	\N
20515	\N	3420	1	\N
20516	\N	3420	2	\N
20517	\N	3420	3	\N
20518	\N	3420	4	\N
20519	\N	3420	5	\N
20520	\N	3420	6	\N
20521	\N	3421	1	\N
20522	\N	3421	2	\N
20523	\N	3421	3	\N
20524	\N	3421	4	\N
20525	\N	3421	5	\N
20526	\N	3421	6	\N
20527	\N	3422	1	\N
20528	\N	3422	2	\N
20529	\N	3422	3	\N
20530	\N	3422	4	\N
20531	\N	3422	5	\N
20532	\N	3422	6	\N
20533	\N	3423	1	\N
20534	\N	3423	2	\N
20535	\N	3423	3	\N
20536	\N	3423	4	\N
20537	\N	3423	5	\N
20538	\N	3423	6	\N
20539	\N	3424	1	\N
20540	\N	3424	2	\N
20541	\N	3424	3	\N
20542	\N	3424	4	\N
20543	\N	3424	5	\N
20544	\N	3424	6	\N
20545	\N	3425	1	\N
20546	\N	3425	2	\N
20547	\N	3425	3	\N
20548	\N	3425	4	\N
20549	\N	3425	5	\N
20550	\N	3425	6	\N
20551	\N	3426	1	\N
20552	\N	3426	2	\N
20553	\N	3426	3	\N
20554	\N	3426	4	\N
20555	\N	3426	5	\N
20556	\N	3426	6	\N
20557	\N	3427	1	\N
20558	\N	3427	2	\N
20559	\N	3427	3	\N
20560	\N	3427	4	\N
20561	\N	3427	5	\N
20562	\N	3427	6	\N
20563	\N	3428	1	\N
20564	\N	3428	2	\N
20565	\N	3428	3	\N
20566	\N	3428	4	\N
20567	\N	3428	5	\N
20568	\N	3428	6	\N
20569	\N	3429	1	\N
20570	\N	3429	2	\N
20571	\N	3429	3	\N
20572	\N	3429	4	\N
20573	\N	3429	5	\N
20574	\N	3429	6	\N
20575	\N	3430	1	\N
20576	\N	3430	2	\N
20577	\N	3430	3	\N
20578	\N	3430	4	\N
20579	\N	3430	5	\N
20580	\N	3430	6	\N
20581	\N	3431	1	\N
20582	\N	3431	2	\N
20583	\N	3431	3	\N
20584	\N	3431	4	\N
20585	\N	3431	5	\N
20586	\N	3431	6	\N
20587	\N	3432	1	\N
20588	\N	3432	2	\N
20589	\N	3432	3	\N
20590	\N	3432	4	\N
20591	\N	3432	5	\N
20592	\N	3432	6	\N
20593	\N	3433	1	\N
20594	\N	3433	2	\N
20595	\N	3433	3	\N
20596	\N	3433	4	\N
20597	\N	3433	5	\N
20598	\N	3433	6	\N
20599	\N	3434	1	\N
20600	\N	3434	2	\N
20601	\N	3434	3	\N
20602	\N	3434	4	\N
20603	\N	3434	5	\N
20604	\N	3434	6	\N
20605	\N	3435	1	\N
20606	\N	3435	2	\N
20607	\N	3435	3	\N
20608	\N	3435	4	\N
20609	\N	3435	5	\N
20610	\N	3435	6	\N
20611	\N	3436	1	\N
20612	\N	3436	2	\N
20613	\N	3436	3	\N
20614	\N	3436	4	\N
20615	\N	3436	5	\N
20616	\N	3436	6	\N
20617	\N	3437	1	\N
20618	\N	3437	2	\N
20619	\N	3437	3	\N
20620	\N	3437	4	\N
20621	\N	3437	5	\N
20622	\N	3437	6	\N
20623	\N	3438	1	\N
20624	\N	3438	2	\N
20625	\N	3438	3	\N
20626	\N	3438	4	\N
20627	\N	3438	5	\N
20628	\N	3438	6	\N
20629	\N	3439	1	\N
20630	\N	3439	2	\N
20631	\N	3439	3	\N
20632	\N	3439	4	\N
20633	\N	3439	5	\N
20634	\N	3439	6	\N
20635	\N	3440	1	\N
20636	\N	3440	2	\N
20637	\N	3440	3	\N
20638	\N	3440	4	\N
20639	\N	3440	5	\N
20640	\N	3440	6	\N
20641	\N	3441	1	\N
20642	\N	3441	2	\N
20643	\N	3441	3	\N
20644	\N	3441	4	\N
20645	\N	3441	5	\N
20646	\N	3441	6	\N
20647	\N	3442	1	\N
20648	\N	3442	2	\N
20649	\N	3442	3	\N
20650	\N	3442	4	\N
20651	\N	3442	5	\N
20652	\N	3442	6	\N
20653	\N	3443	1	\N
20654	\N	3443	2	\N
20655	\N	3443	3	\N
20656	\N	3443	4	\N
20657	\N	3443	5	\N
20658	\N	3443	6	\N
20665	\N	3445	1	\N
20666	\N	3445	2	\N
20667	\N	3445	3	\N
20668	\N	3445	4	\N
20669	\N	3445	5	\N
20670	\N	3445	6	\N
20671	\N	3446	1	\N
20672	\N	3446	2	\N
20673	\N	3446	3	\N
20674	\N	3446	4	\N
20675	\N	3446	5	\N
20676	\N	3446	6	\N
20677	\N	3447	1	\N
20678	\N	3447	2	\N
20679	\N	3447	3	\N
20680	\N	3447	4	\N
20681	\N	3447	5	\N
20682	\N	3447	6	\N
20683	\N	3448	1	\N
20684	\N	3448	2	\N
20685	\N	3448	3	\N
20686	\N	3448	4	\N
20687	\N	3448	5	\N
20688	\N	3448	6	\N
19555	\N	3260	1	1
20661	\N	3444	3	1
19540	\N	3257	4	1
20663	\N	3444	5	1
19536	\N	3256	6	1
19405	\N	3235	1	1
19580	\N	3264	2	1
19582	\N	3264	4	1
19584	\N	3264	6	1
20659	\N	3444	1	1
20660	\N	3444	2	1
20662	\N	3444	4	1
20664	\N	3444	6	1
19369	\N	3229	1	1
19370	\N	3229	2	1
19286	\N	3215	2	1
19401	\N	3234	3	1
19348	\N	3225	4	1
19307	\N	3218	5	1
19386	\N	3231	6	1
19344	\N	3224	6	1
19334	\N	3223	2	1
19354	\N	3226	4	1
19366	\N	3228	4	1
19390	\N	3232	4	1
19396	\N	3233	4	1
19336	\N	3223	4	1
19397	\N	3233	5	1
19355	\N	3226	5	1
19391	\N	3232	5	1
19337	\N	3223	5	1
19368	\N	3228	6	1
19398	\N	3233	6	1
19338	\N	3223	6	1
19356	\N	3226	6	1
19392	\N	3232	6	1
19297	\N	3217	1	1
19299	\N	3217	3	1
19300	\N	3217	4	1
19301	\N	3217	5	1
19302	\N	3217	6	1
19447	\N	3242	1	1
19429	\N	3239	1	1
19441	\N	3241	1	1
19453	\N	3243	1	1
19423	\N	3238	1	1
19435	\N	3240	1	1
19417	\N	3237	1	1
19448	\N	3242	2	1
19478	\N	3247	2	1
19418	\N	3237	2	1
19442	\N	3241	2	1
19436	\N	3240	2	1
19430	\N	3239	2	1
19454	\N	3243	2	1
19424	\N	3238	2	1
19425	\N	3238	3	1
19419	\N	3237	3	1
19455	\N	3243	3	1
19449	\N	3242	3	1
19437	\N	3240	3	1
19443	\N	3241	3	1
19431	\N	3239	3	1
19579	\N	3264	1	1
19585	\N	3265	1	1
19599	\N	3267	3	1
19315	\N	3220	1	1
19378	\N	3230	4	1
19367	\N	3228	5	1
19298	\N	3217	2	1
19489	\N	3249	1	1
19497	\N	3250	3	1
19426	\N	3238	4	1
19504	\N	3251	4	1
19432	\N	3239	4	1
19462	\N	3244	4	1
19516	\N	3253	4	1
19480	\N	3247	4	1
19420	\N	3237	4	1
19438	\N	3240	4	1
19456	\N	3243	4	1
19450	\N	3242	4	1
19444	\N	3241	4	1
19522	\N	3254	4	1
19493	\N	3249	5	1
19439	\N	3240	5	1
19457	\N	3243	5	1
19469	\N	3245	5	1
19451	\N	3242	5	1
19463	\N	3244	5	1
19475	\N	3246	5	1
19427	\N	3238	5	1
19505	\N	3251	5	1
19499	\N	3250	5	1
19517	\N	3253	5	1
19487	\N	3248	5	1
19433	\N	3239	5	1
19511	\N	3252	5	1
19421	\N	3237	5	1
19445	\N	3241	5	1
19481	\N	3247	5	1
19523	\N	3254	5	1
19440	\N	3240	6	1
19500	\N	3250	6	1
19482	\N	3247	6	1
19476	\N	3246	6	1
19470	\N	3245	6	1
19434	\N	3239	6	1
19488	\N	3248	6	1
19524	\N	3254	6	1
19446	\N	3241	6	1
19518	\N	3253	6	1
19506	\N	3251	6	1
19494	\N	3249	6	1
19452	\N	3242	6	1
19428	\N	3238	6	1
19464	\N	3244	6	1
19422	\N	3237	6	1
19512	\N	3252	6	1
19458	\N	3243	6	1
19411	\N	3236	1	1
19525	\N	3255	1	1
19412	\N	3236	2	1
19526	\N	3255	2	1
19413	\N	3236	3	1
19527	\N	3255	3	1
19528	\N	3255	4	1
19414	\N	3236	4	1
19529	\N	3255	5	1
19415	\N	3236	5	1
19416	\N	3236	6	1
19530	\N	3255	6	1
\.


--
-- Name: gymnastics_athleteevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_athleteevent_id_seq', 20688, true);


--
-- Data for Name: gymnastics_event; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_event (id, name, sign_id, "order", initials) FROM stdin;
1	Floor	1	1	fe
2	Rings	2	2	sr
3	Pommel Horse	3	3	ph
4	Vault	4	4	vt
5	Parallel Bars	5	5	pb
6	High Bar	6	6	hb
\.


--
-- Name: gymnastics_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_event_id_seq', 7, true);


--
-- Data for Name: gymnastics_group; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_group (id, age_group, level, "order") FROM stdin;
286	6	4	2
287	7-8	4	3
285	9-10	4	4
288	11& U	4	5
284	7-8	5	6
282	9-10	5	7
283	11&UP	5	8
278	7-8	6	9
277	9-10	6	10
276	11&UP	6	11
281	9-10	7	12
279	11-12	7	13
280	13&UP	7	14
269	11-12	8	15
271	13-14	8	16
270	15-18	8	17
273	13-14	9	18
272	15-18	9	19
275	15-16	10	21
274	17-18	10	22
289	11-14	JE	23
\.


--
-- Name: gymnastics_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_group_id_seq', 289, true);


--
-- Data for Name: gymnastics_ledsign; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_ledsign (id, sign_id, device) FROM stdin;
1	1001	abc
2	2002	def
3	3003	ghi
4	4004	jkl
5	5005	mno
6	6006	pqr
\.


--
-- Name: gymnastics_ledsign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_ledsign_id_seq', 7, true);


--
-- Data for Name: gymnastics_meetsettings; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_meetsettings (id, name, date, event_award_percentage, all_around_award_percentage) FROM stdin;
1	MD State 2015	2015-02-14	1	1
\.


--
-- Name: gymnastics_meetsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_meetsettings_id_seq', 1, true);


--
-- Data for Name: gymnastics_message; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_message (id, name, message) FROM stdin;
\.


--
-- Name: gymnastics_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_message_id_seq', 1, false);


--
-- Data for Name: gymnastics_session; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_session (id, name) FROM stdin;
4	Session 1
5	Session 2
6	Session 3
7	Session 4
\.


--
-- Data for Name: gymnastics_session_groups; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_session_groups (id, session_id, group_id) FROM stdin;
45	4	272
46	4	273
47	4	274
48	4	275
49	4	269
50	4	270
51	4	271
52	5	276
53	5	277
54	5	278
55	5	279
56	5	280
57	5	281
58	6	282
59	6	283
60	6	284
61	7	288
62	7	289
63	7	285
64	7	286
65	7	287
\.


--
-- Name: gymnastics_session_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_session_groups_id_seq', 65, true);


--
-- Name: gymnastics_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_session_id_seq', 7, true);


--
-- Data for Name: gymnastics_team; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_team (id, name, qualified) FROM stdin;
256	Columbia	t
257	Fairland	t
258	Paragon	t
259	Preston	t
260	Rebounders	t
261	Sportsplex	t
262	Top Flight	t
263	Docksiders	t
264	Twisters	t
265	United	t
266	Clark's	t
267	North Shore	t
268	Excellence Gym Sport	t
\.


--
-- Name: gymnastics_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_team_id_seq', 268, true);


--
-- Data for Name: gymnastics_teamaward; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamaward (id, name, award_percentage) FROM stdin;
\.


--
-- Data for Name: gymnastics_teamaward_groups; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamaward_groups (id, teamaward_id, group_id) FROM stdin;
\.


--
-- Name: gymnastics_teamaward_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamaward_groups_id_seq', 1, false);


--
-- Name: gymnastics_teamaward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamaward_id_seq', 1, false);


--
-- Data for Name: gymnastics_teamawardrank; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamawardrank (id, rank, team_id, team_award_id, score) FROM stdin;
\.


--
-- Name: gymnastics_teamawardrank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamawardrank_id_seq', 1, false);


--
-- Data for Name: gymnastics_teamawards; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamawards (id, name) FROM stdin;
\.


--
-- Data for Name: gymnastics_teamawards_groups; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamawards_groups (id, teamawards_id, group_id) FROM stdin;
\.


--
-- Name: gymnastics_teamawards_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamawards_groups_id_seq', 3, true);


--
-- Name: gymnastics_teamawards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamawards_id_seq', 1, true);


--
-- Data for Name: gymnastics_teamawards_teams; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY gymnastics_teamawards_teams (id, teamawards_id, team_id) FROM stdin;
\.


--
-- Name: gymnastics_teamawards_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('gymnastics_teamawards_teams_id_seq', 19, true);


--
-- Data for Name: meet_meet; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY meet_meet (id, name, short_name, host, date, event_award_percentage, all_around_award_percentage, max_sessions_per_day, flow_thresh_min, flow_thresh_max, is_current_meet, notes) FROM stdin;
1	2015 Baltimore-Washington Men's Invitational	2015 BWI	Fairland	2015-12-12	0.5	0.5	3	10	15	t	\N
\.


--
-- Name: meet_meet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('meet_meet_id_seq', 1, true);


--
-- Data for Name: registration_coach; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_coach (id, first_name, last_name, usag, usag_expire_date, safety_expire_date, background_expire_date, team_id, notes, is_flagged, is_verified, meet_id) FROM stdin;
1	Kevin	Hallinan	543041	2016-07-31	2016-07-31	2016-07-31	1	\N	f	f	1
2	Stephen	Patterson	18562	2016-07-31	2017-07-31	\N	1	\N	f	f	1
3	Eric	Perdercini	228512	2016-07-31	2018-07-31	2016-07-31	1	\N	f	f	1
4	Anthony	Porche	90276	2016-07-31	\N	2017-07-31	1	\N	f	f	1
6	Zvonimir	Ilic	416739	2016-07-31	2016-01-31	2016-07-31	2	\N	f	f	1
7	Tyrone	Elam	410627	2016-07-31	2017-02-28	2016-07-31	2	\N	f	f	1
8	Nate	Campbell	439375	2016-07-31	2017-07-31	2017-01-31	3	\N	f	f	1
9	Dan	Galiczynski	360424	2016-07-31	2019-07-31	2016-07-31	3	\N	f	f	1
11	Charlie	Kowalski	413217	2016-07-31	2018-07-31	2017-12-31	5	\N	f	f	1
12	Billy	Rathell	045342	2015-07-31	2016-01-31	2016-01-31	5	\N	f	f	1
18	Jan	Chamasyan	438105	2016-07-31	2016-07-31	2017-07-31	9	\N	f	f	1
13	Vladimir	Shamenko	416254	2016-07-31	2016-02-29	2017-07-31	6	\N	f	f	1
14	Denise	Rowell	119873	2016-07-31	2016-07-31	2016-07-31	6	\N	f	f	1
21	Mario	Gorosito	573374	\N	\N	\N	11	\N	f	f	1
22	Eric	Cali	46891	\N	\N	\N	11	\N	f	f	1
23	Steve	Heitz	456499	\N	\N	\N	12	\N	f	f	1
24	Ramsey	Mitchell	992867	\N	\N	\N	13	\N	f	f	1
25	Emily	Walstrum	614122	\N	\N	\N	13	\N	f	f	1
26	Chelsea	Lahey	604087	\N	\N	\N	13	\N	f	f	1
10	Simacek	Jacob	117574	2016-07-31	2016-07-31	2016-07-31	4		f	f	1
27	Dimitryi	Gavrilyuk	412645	2016-07-31	2015-09-30	2016-07-31	14	\N	f	f	1
28	Oleg	Bezrodniy	12859	2016-07-31	2016-07-31	2016-07-31	14	\N	f	f	1
29	Andrii	Trofymenko	389137	2016-07-31	2016-07-31	2016-07-31	14	\N	f	f	1
15	Adam	Smith	325579	2015-07-31	2015-11-30	2015-07-31	7	\N	f	f	1
16	David	Quattlebaum	325576	2015-07-31	2016-01-31	2015-07-31	7	\N	f	f	1
30	Valentin	Vasilev	80668	2016-07-31	2018-07-31	2016-07-31	15	\N	f	f	1
31	Jamal	Rice	40604	\N	\N	\N	16	\N	f	f	1
32	Scott	Haddaway	32039	\N	\N	\N	16	\N	f	f	1
33	 Victor	Kolesnikov	413528	2016-07-31	2016-07-31	2016-07-31	17	\N	f	f	1
34	Jerry	Fix	408352	2016-07-31	2016-07-31	2016-07-31	17	\N	f	f	1
35	Brian	Narvaez	518222	2016-07-31	2016-01-31	2016-07-31	17	\N	f	f	1
37	Edixio	Mora	972658	2016-07-31	2018-07-31	2016-07-31	19	\N	f	f	1
38	Kevin	Preston	406938	2015-07-31	2016-07-31	2015-07-31	20	\N	f	f	1
39	Abdul	Mammeri	408160	2015-07-31	2017-07-31	2016-07-31	20	\N	f	f	1
\.


--
-- Name: registration_coach_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_coach_id_seq', 39, true);


--
-- Data for Name: registration_gymnast; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_gymnast (id, first_name, last_name, usag, dob, age, is_us_citizen, level_id, team_id, is_scratched, notes, is_flagged, is_verified, athlete_id, meet_id, overall_score, rank, division_id, starting_event_id, shirt_id) FROM stdin;
40	Ryan	Kaus	577616	2006-08-05	9	t	9	2	f		f	t	551	1	53	20	5	\N	4
2	CJ	Brewer		2008-03-05	7	t	8	1	f	\N	f	f	448	1	67.7999999999999972	1	1	\N	3
91	Lucas	DiPietro	619644	2005-11-16	9	t	9	6	f		f	t	513	1	62.6000000000000014	1	5	\N	\N
7	Tristan	Davis	970193	2005-03-28	10	t	9	1	f		f	t	556	1	55.8999999999999986	14	6	\N	4
13	Kai	Lakin	622279	2004-04-24	11	t	9	1	f		f	t	562	1	57.5	7	6	\N	4
153	Daniel	Rothwell	643533	2001-05-11	14	t	3	9	f		f	t	632	1	57.7999999999999972	8	11	\N	7
179	Jacob	Shinn	577015	2006-08-24	9	t	3	11	f		f	t	627	1	52.8999999999999986	12	8	\N	3
135	Thanh-Trieu	Nguyen	614759	2005-11-08	9	t	3	7	f		f	t	639	1	56.6000000000000014	7	8	\N	\N
176	Aaron	Barber	539860	2006-02-01	9	t	3	11	f		f	t	624	1	54.7000000000000028	8	8	\N	3
43	Benjamin	Hoberman	574047	2007-01-14	8	t	9	2	f		f	t	549	1	60.2000000000000028	4	4	\N	4
120	Kai	Hall	943289	2005-10-06	9	t	9	7	f		f	t	543	1	57.5	10	5	\N	3
4	Stone	Good		2007-04-12	8	t	8	1	f	\N	f	f	450	1	56	9	2	\N	3
11	Connor	Haydysch	982056	2007-10-29	7	t	9	1	f		f	t	560	1	52.3999999999999986	23	4	\N	3
66	Peter	Robell	959357	2002-08-26	13	t	9	4	f		f	t	574	1	50.8999999999999986	6	7	\N	\N
57	Kevin	Sobusiak	956182	2001-08-02	14	t	9	3	f		f	t	547	1	58.3999999999999986	2	7	\N	8
134	Damon	Nguyen	547955	2005-01-20	10	t	3	7	f		f	t	640	1	58.2999999999999972	6	9	\N	5
9	Remy	Gatewood	942339	2004-02-02	11	t	9	1	f		f	t	558	1	56.3999999999999986	12	6	\N	3
20	Zachary	Granados		2003-09-10	11	t	4	1	f	\N	f	f	718	1	53.8999999999999986	12	12	\N	4
96	Benjamin	Hanny	939779	2000-05-29	15	t	5	6	f		f	t	806	1	66.4000000000000057	1	15	\N	7
22	Elliot	Lippy	627271	2004-03-23	11	t	4	1	f		f	t	720	1	58	5	12	\N	8
25	Jarel	Gomez		2004-05-13	11	t	5	1	f	\N	f	f	825	1	55.8999999999999986	12	14	\N	4
23	Caleb	Melton		2004-08-12	11	t	4	1	f	\N	f	f	721	1	52.2999999999999972	15	12	\N	4
10	Jacob	Guida	622274	2007-07-23	8	t	9	1	f		f	t	559	1	55.5	19	4	\N	3
6	Justin	Bridges	942338	2007-01-19	8	t	9	1	f		f	t	554	1	52.3999999999999986	22	4	\N	3
141	Dawda	Saine	614762	2005-03-03	10	t	3	7	f		f	t	641	1	55.2999999999999972	12	9	\N	3
48	Colin	Kraft	509832	2005-06-08	10	t	3	2	f		f	t	647	1	54.2000000000000028	14	9	\N	4
60	Josh	Phillipps	629454	2004-07-13	11	t	3	3	f		f	t	643	1	61.2999999999999972	2	10	\N	4
46	Sullivan	Lee	571413	2004-07-30	11	t	3	2	f		f	t	648	1	52.7999999999999972	9	10	\N	4
16	Matt	Carter	622268	2003-12-10	11	t	3	1	f		f	t	650	1	60.5	3	10	\N	4
79	Liam	O'Toole	582005	2004-06-28	11	t	4	5	f		f	t	712	1	58.6000000000000014	4	12	\N	4
29	Xavier	Moore		1999-08-19	16	t	6	1	f	\N	f	f	926	1	57.8999999999999986	4	17	\N	8
99	Chase	Clingman	360792	2001-07-19	14	t	6	6	f		f	t	908	1	54.3999999999999986	21	16	\N	\N
51	Jakob	Feltquate	509427	2004-01-03	11	t	5	2	f		f	t	823	1	61	4	14	\N	4
133	Quinlan	Ngo	500064	2003-09-23	11	t	5	7	f		f	t	814	1	57.2999999999999972	7	14	\N	5
98	Paul	Sternberg	405143	2001-10-11	13	f	5	6	f		f	t	807	1	58.1000000000000014	4	15	\N	7
117	Kenneth	Graninger	500058	2004-04-16	11	t	5	7	f		f	t	812	1	54.2999999999999972	17	14	\N	5
154	Luke	Synder	382688	2002-08-05	13	t	3	9	f	Last name does not match USAG last name (USAG: Snyder)\n	t	f	633	1	62.5	2	11	\N	7
27	Aaron	Golden	431070	2002-01-13	13	t	6	1	f		f	t	924	1	62.7000000000000028	1	16	\N	7
101	Nathan	Clingman	272071	1998-03-28	17	t	7	6	f		f	t	1005	1	57.2000000000000028	6	19	\N	8
126	Donovan	Hewitt	405498	2001-11-02	13	t	6	7	f		f	t	919	1	61.7000000000000028	3	16	\N	5
30	Joao	Policarpo		2000-07-25	15	t	6	1	f	\N	f	f	927	1	51.3999999999999986	6	17	\N	9
109	Henry	Clark	581777	2006-03-13	9	t	9	7	f		f	t	541	1	57.1000000000000014	13	5	\N	\N
102	Aaron	Ayodele	547953	2004-06-01	11	t	5	7	f		f	t	810	1	56.1000000000000014	11	14	\N	7
32	Tyrus	Woodard		2000-09-27	14	t	6	1	f	\N	f	f	929	1	57.7000000000000028	10	16	\N	8
31	Owen	Sipes		2000-05-03	15	t	6	1	f	\N	f	f	928	1	57.7000000000000028	5	17	\N	8
37	Chris	McCord	205892	1998-09-17	16	t	7	1	f		f	t	1018	1	53.3999999999999986	9	18	\N	8
55	Harrison	Patrizio	212820	1999-05-01	16	t	7	2	f		f	t	1012	1	53.2999999999999972	10	18	\N	9
44	Aslan	Aksu	629300	2007-10-04	7	t	9	2	f		f	t	548	1	57.8999999999999986	10	4	\N	\N
8	TJ	Freeman	637230	2003-04-24	12	t	9	1	f		f	t	557	1	58.2999999999999972	3	7	\N	4
5	Jayden	Bridges	942336	2007-01-19	8	t	9	1	f		f	t	555	1	55.7000000000000028	18	4	\N	3
18	Caleb	Morrison	622283	2005-02-03	10	t	3	1	f		f	t	652	1	54.5	13	9	\N	4
28	Samuel	Golden	431067	2000-03-19	15	t	6	1	f		f	t	925	1	59.2999999999999972	2	17	\N	8
108	Riley	Chung	614756	2005-05-18	10	t	3	7	f		f	t	634	1	62.5	1	9	\N	\N
47	Vlad	Marchenko	968415	2005-07-14	10	t	3	2	f		f	t	649	1	57.7000000000000028	8	9	\N	4
162	Caleb	Hoover		2007-07-05	8	t	8	9	f	\N	f	f	432	1	58.2999999999999972	5	2	\N	3
100	Logan	Voegele	272066	2000-02-09	15	t	7	6	f		f	t	1006	1	56.7999999999999972	4	18	\N	8
36	Joey	Ladner	389053	2000-02-10	15	t	7	1	f		f	t	1017	1	64	1	18	\N	9
38	Isaac	Palacios	438122	1998-06-18	17	t	7	1	f		f	t	1019	1	63.5	2	19	\N	8
33	Solomon	Griffin	427885	1996-09-21	18	t	7	1	f		f	t	1014	1	65	1	19	\N	9
34	Ryan	Holloway	297601	1998-08-25	17	t	7	1	f		f	t	1015	1	58	5	19	\N	8
49	John	Delafosse	532993	2004-10-15	10	t	3	2	t		f	t	\N	1	\N	\N	\N	\N	4
229	Connor	Hastings	1018591	\N	\N	t	8	16	f	Date of birth does not match USAG date of birth (USAG: 2008-11-11)\n	t	f	468	1	61.3999999999999986	1	\N	\N	\N
219	Aaron	Valencia	951024	2006-07-28	9	t	9	15	f		f	t	589	1	53.2000000000000028	19	5	\N	\N
237	Ryan	Nesspor	575912	2005-08-17	10	t	9	16	f		f	t	578	1	55	15	6	\N	\N
97	Colin	Falgiano	494201	2004-05-18	11	t	5	6	f		f	t	805	1	52.5	19	14	\N	7
230	Sean	Horrigan	960816	2007-05-05	8	t	8	16	f		f	t	469	1	55.5	11	2	\N	\N
196	Cooper	Trump	994400	2008-07-21	7	t	8	14	f		f	t	479	1	55.8999999999999986	20	1	\N	3
227	Ashton	Gallo	1013311	2007-08-05	8	f	8	16	f		f	t	466	1	54.1000000000000014	14	2	\N	\N
136	Thien-Trieu	Nguyen	1010423	2008-09-28	6	t	8	7	f		f	t	446	1	56.7000000000000028	14	1	1	\N
173	Jason	Heald	944315	2004-10-25	10	t	9	11	f		f	t	534	1	53.2000000000000028	20	6	\N	4
212	Kevin	Mills	554553	2003-05-27	12	t	5	14	f		f	t	831	1	57.5	6	14	\N	7
240	Ryan	Jackson	575845	2005-06-21	10	f	3	16	f		f	t	657	1	60.8999999999999986	3	9	\N	\N
129	Kush	Kanthan	500063	2004-01-28	11	t	4	7	f		f	t	715	1	64.5	1	12	\N	4
180	Lawrence	Sturgeon	550914	2005-08-19	10	t	3	11	f		f	t	628	1	49.8999999999999986	18	9	\N	4
221	Xavier	Shedrick	632109	2005-01-28	10	t	3	15	f		f	t	662	1	58	7	9	\N	\N
246	Sebastian	Rutz	385810	2002-05-10	13	t	6	16	f		f	t	938	1	57.1000000000000014	15	16	\N	\N
239	Oliver	Black	635671	2006-06-13	9	t	3	16	f		f	t	656	1	53.2999999999999972	11	8	\N	\N
222	Ellis	Thompson	632111	2007-05-24	8	t	3	15	f		f	t	663	1	47.7999999999999972	14	8	\N	\N
241	Benjamin	Rosenberg	461900	2004-05-17	11	t	3	16	f		f	t	658	1	60.1000000000000014	4	10	\N	\N
152	Nima	Roham	472060	2003-05-05	12	t	3	9	f	Last name does not match USAG last name (USAG: Rohani)\n	t	f	631	1	62.2000000000000028	3	11	\N	4
207	Connor	Schrott	619410	2004-03-07	11	t	3	14	f		f	t	660	1	56.5	7	10	\N	4
143	Jason	Singleton	547954	2005-04-15	10	t	4	7	f		f	t	717	1	54	10	12	\N	4
231	Jullian	Marquez	1013460	2007-08-13	8	t	8	16	f	Level does not match USAG level (USAG: 10)\n	t	f	470	1	58	6	2	\N	\N
235	Will	Liang	635674	2006-08-02	9	t	9	16	f		f	t	576	1	61	2	5	\N	\N
238	Zachary	Silao	960821	2006-03-24	9	t	9	16	f		f	t	579	1	54.1000000000000014	17	5	\N	\N
197	Blake	Ficke	1010428	2007-04-19	8	t	8	14	f		f	t	474	1	55.6000000000000014	10	2	\N	3
138	Cameron	Rice	274588	2000-06-03	15	t	7	7	f		f	t	1008	1	53.6000000000000014	8	18	\N	9
245	Matthew	Rosendahl	385832	2002-03-17	13	t	6	16	f		f	t	937	1	62.5	2	16	\N	\N
211	Dima	Davis	463970	2003-08-12	12	t	5	14	f		f	t	830	1	61.7000000000000028	3	14	\N	7
106	Damien	Chu	500052	2003-06-27	12	t	5	7	f		f	t	811	1	54.6000000000000014	15	14	\N	4
147	Eric	Tran	500072	2003-01-04	12	t	5	7	f		f	t	819	1	56.5	9	14	\N	3
210	Benjamin	Currie	506150	2003-01-05	12	t	5	14	f		f	t	829	1	54.3999999999999986	16	14	\N	4
209	Jackson	Burgess	506149	2002-08-23	13	t	5	14	f		f	t	828	1	60	3	15	\N	7
130	NIcholas	Louloudes	422161	2001-10-15	13	t	6	7	f		f	t	920	1	56.7999999999999972	16	16	\N	4
145	Ibraheem	Spurlock	614761	2004-03-30	11	t	5	7	f		f	t	817	1	59.2000000000000028	5	14	\N	4
213	Jimmy	Callas	183567	1998-08-23	17	t	7	14	f		f	t	1022	1	62.7000000000000028	3	19	\N	9
273	Andrew	Overman	505112	2002-07-25	13	t	6	17	f		f	t	933	1	55.7000000000000028	19	16	\N	7
61	Caleb	Evans	468234	2001-12-05	13	t	6	3	f		f	t	921	1	58.5	6	16	\N	7
255	Joshua	Secord	950067	2007-05-15	8	t	8	17	f		f	t	455	1	55.3999999999999986	12	2	\N	4
223	Ethan	Kravet	258301	1999-10-12	15	t	7	15	f		f	t	1025	1	51.7999999999999972	12	18	\N	\N
155	Benjamin	Golden	535082	2004-07-06	11	t	9	9	f		f	t	539	1	57.2999999999999972	9	6	\N	4
262	Maksym	Pohorylo	950070	2006-01-04	9	t	9	17	f		f	t	570	1	60	7	5	\N	4
174	Gunnar	Montes	589690	2004-01-01	11	t	9	11	f		f	t	535	1	62.6000000000000014	2	6	\N	4
175	Connor	Robertson	639978	2006-03-24	9	t	9	11	f		f	t	536	1	57	14	5	\N	4
158	Gabriel	Getz	581849	2005-06-08	10	t	9	9	f		f	t	538	1	53.5	19	6	\N	4
266	Connor	Homan	578894	2004-05-02	11	t	3	17	f		f	t	654	1	51.3999999999999986	10	10	\N	5
202	Benjamin	Letvin	975083	2004-11-04	10	t	9	14	f		f	t	582	1	59.3999999999999986	4	6	\N	4
257	Spencer	Biggs	636882	2006-04-06	9	t	9	17	f		f	t	565	1	52	21	5	\N	4
220	David	Moroney	632105	2006-09-12	8	t	9	15	f	Level does not match USAG level (USAG: 6)\n	t	f	587	1	49.7000000000000028	25	4	\N	\N
226	Dylan	Barrett	1013307	2008-02-06	7	t	8	16	f		f	t	465	1	56.7999999999999972	13	1	\N	\N
156	Milo	Bantug	643528	2005-05-04	10	t	9	9	f		f	t	537	1	52.1000000000000014	21	6	\N	4
234	Anderson	Becker	635665	2007-01-05	8	t	9	16	f		f	t	575	1	60.5	3	4	\N	\N
75	Evan	Allen	643620	2007-05-28	8	t	3	5	f	Level does not match USAG level (USAG: 5)\n	t	f	619	1	56.7000000000000028	6	8	\N	3
259	Austin	Geibel	950071	2004-05-12	11	t	9	17	f		f	t	567	1	56.2000000000000028	13	6	\N	4
225	Avery	Massey	562189	1996-12-12	18	t	7	15	f		f	t	1027	1	50.6000000000000014	9	19	\N	\N
233	Gregory	Wilmot	1013314	2009-04-14	6	t	8	16	f		f	t	472	1	56.2000000000000028	17	1	\N	\N
232	James	Vey	1013306	2008-08-26	7	t	8	16	f		f	t	471	1	59.6000000000000014	6	1	\N	\N
118	Donovan	Hall	565343	2006-10-04	8	t	3	7	f		f	t	638	1	63.2000000000000028	1	8	\N	4
206	Tyler	Schrott	619408	2005-07-07	10	t	3	14	f		f	t	661	1	61.8999999999999986	2	9	\N	4
265	Casey	Thomas	477309	2002-04-03	13	t	3	17	f	Last name does not match USAG last name (USAG: Casey)\n	t	f	655	1	58.7999999999999972	7	11	\N	4
224	Stephen	Lewis	298421	1998-07-27	17	t	7	15	f		f	t	1026	1	56.8999999999999986	7	19	\N	\N
281	Grayson	Burchard	657526	2005-03-15	10	t	3	19	f		f	t	644	1	57.1000000000000014	10	9	\N	\N
298	Connor	Harman	554559	2004-05-24	11	t	3	20	f		f	t	615	1	59.6000000000000014	5	10	\N	\N
163	Ozzy	Im		2008-07-15	7	t	8	9	f	\N	f	f	433	1	56.2000000000000028	16	1	\N	2
294	Thomas	Chiang	1008955	2006-07-22	9	t	9	20	f		f	t	520	1	57.5	11	5	\N	\N
302	Sahil	Dev	429974	\N	\N	t	4	20	f	Date of birth does not match USAG date of birth (USAG: 2000-11-28)\n	t	f	702	1	\N	3	\N	\N	\N
17	Remy	Harwood	942340	2003-04-03	12	t	3	1	f		f	t	651	1	60.1000000000000014	5	11	\N	3
288	Tyler	Ostrowski	938128	2005-11-22	9	t	9	20	f		f	t	528	1	55.5	15	5	\N	\N
301	Xavier	Donnely		\N	\N	t	5	20	f		f	f	809	1	\N	3	\N	\N	\N
303	James	Gernhar...	506486	2002-07-30	13	t	4	20	f		f	t	704	1	56.1000000000000014	4	13	\N	\N
260	Spencer	Lewis	641686	2006-02-24	9	t	9	17	f		f	t	568	1	51.2999999999999972	23	5	\N	4
24	Simons	Noah		2005-05-12	10	t	4	1	f	\N	f	f	722	1	54.3999999999999986	8	12	\N	3
308	Hollis	Luethy	521581	2001-09-12	13	t	4	20	f		f	t	707	1	59.2000000000000028	3	13	\N	\N
267	TJ	Langdon	424073	2002-06-03	13	t	4	17	f		f	t	724	1	52.6000000000000014	7	13	\N	4
306	Gabe	Mignardi	396527	2000-11-30	14	t	4	20	f		f	t	708	1	55.5	5	13	\N	\N
300	Joshua	Berman	463969	2004-07-22	11	t	5	20	f		f	t	808	1	63.8999999999999986	1	14	\N	\N
81	Adam	Joyner	523298	2004-04-26	11	t	4	5	f		f	t	711	1	57.3999999999999986	6	12	\N	3
119	Finn	Hall	937188	2008-05-16	7	t	9	7	f		f	t	542	1	50.8999999999999986	24	4	\N	2
77	Stephen	Damm	579601	2004-05-31	11	t	3	5	f		f	t	621	1	57.5	6	10	\N	3
84	Daniel	Jekal	939766	2007-07-05	8	t	9	6	f		f	t	516	1	58.5	7	4	\N	3
304	Andrew	Gernhart	506477	2004-07-05	11	t	4	20	f		f	t	705	1	63.7999999999999972	2	12	\N	\N
311	Aleksandr	Kuzmenchuk	372142	2002-07-25	13	t	6	20	f		f	t	913	1	56.7999999999999972	17	16	\N	\N
310	Paul	Rudie	433836	2001-12-11	13	t	6	20	f		f	f	917	1	58.2999999999999972	7	16	\N	\N
313	Johnny	Gregory	458583	2001-05-22	14	t	6	20	f		f	t	912	1	57.3999999999999986	12	16	\N	\N
285	Alex	Miller	938125	2005-05-21	10	t	9	20	f		f	t	524	1	56.7999999999999972	11	6	\N	\N
279	Mitchell	Faglioni	522955	2005-08-10	10	t	3	19	f		f	t	645	1	52.1000000000000014	16	9	\N	\N
250	Rowan	Avatara	1016535	2008-04-01	7	t	8	17	f		f	t	451	1	55.2000000000000028	24	1	\N	2
276	Adam	Bauer	256327	2000-10-25	14	t	7	19	f		f	t	1009	1	\N	3	\N	\N	\N
56	Joey	Damanti	956183	2006-07-28	9	t	9	3	f		f	t	546	1	51.8999999999999986	22	5	\N	3
104	Pierce	Bennet	991260	2009-01-20	6	t	8	7	f	Last name does not match USAG last name (USAG: Bennett)\n	t	f	437	1	50.6000000000000014	28	1	1	2
289	Adam	Richards	661838	2005-06-15	10	t	9	20	f		f	t	529	1	60.2000000000000028	3	6	\N	\N
115	Simon	Farias	996935	2009-06-06	6	t	8	7	f		f	t	440	1	62.2000000000000028	4	1	1	2
110	Logan	Cooper	995890	2008-05-19	7	t	8	7	f		f	t	439	1	55.2999999999999972	23	1	1	2
3	Mason	Gandia		2007-10-02	7	t	8	1	f	\N	f	f	449	1	53.7000000000000028	26	1	\N	2
315	Ian	Dinmore	425358	2002-06-05	13	t	6	20	f		f	t	911	1	57.2999999999999972	13	16	\N	\N
312	Zyler	Powers	433836	2002-05-03	13	t	6	20	f		f	f	916	1	57.2999999999999972	14	16	\N	\N
277	Carson	Ryan	446268	1999-10-06	15	t	7	19	f		f	t	1011	1	58.5	3	18	\N	\N
278	Grady	Rutherford	436001	2001-11-26	13	t	5	19	f		f	t	821	1	65.5	2	15	\N	\N
305	Griffin	Hewitt	511224	2002-09-07	12	t	4	20	f		f	t	706	1	63.5	2	13	\N	\N
80	Marcel	Eid	523296	2005-07-19	10	t	4	5	f		f	t	710	1	53.3999999999999986	14	12	\N	3
208	Zachary	Arensdorf	506141	2005-06-01	10	t	4	14	f		f	t	726	1	54.2999999999999972	9	12	\N	7
64	Owen	Fabian	959359	2005-03-14	10	t	8	4	f		f	t	460	1	58.5	10	3	\N	\N
290	Sergei	Simpson	621927	2002-12-14	12	t	9	20	f		f	t	530	1	56.2000000000000028	4	7	\N	\N
122	Jackson	Hayter	991283	2008-06-18	7	t	8	7	f		f	t	442	1	54.3999999999999986	25	1	1	2
103	Deven	Bailey	991256	2008-06-04	7	t	8	7	f		f	t	436	1	56.2999999999999972	15	1	1	2
87	Jesse	Hanny	939774	2007-05-18	8	t	9	6	f		f	t	514	1	63.2000000000000028	2	4	\N	2
193	Matthew	Fitch	994396	2007-04-08	8	t	8	14	f		f	t	476	1	52.3999999999999986	17	2	\N	2
21	Matvei	Isbell	495813	2004-07-29	11	t	4	1	f		f	t	719	1	54	11	12	\N	3
317	Mark	Barnhouse	621943	1999-10-20	15	t	6	20	f		f	t	909	1	59.1000000000000014	3	17	\N	\N
280	Hayden	Hicks	636527	2004-01-25	11	t	3	19	f		f	t	646	1	65.4000000000000057	1	10	\N	\N
295	Dawud	Muhammad	650435	2005-11-08	9	t	9	20	f		f	t	527	1	60.6000000000000014	4	5	\N	\N
88	Joshua	Hanny	939769	2007-05-18	8	t	9	6	f		f	t	515	1	56.7999999999999972	13	4	\N	2
274	Collin	Cunane	423834	2001-07-14	14	t	6	17	f		f	t	932	1	58.2999999999999972	8	16	\N	2
252	Aaron	Gonslaves	1007598	2008-07-18	7	t	8	17	f		f	t	454	1	56	19	1	\N	2
67	Nate	Colin	1011424	2008-05-12	7	t	8	5	f		f	t	424	1	53.2000000000000028	27	1	\N	3
296	Keon	Sheppard	571647	2006-08-17	9	t	3	20	f		f	t	618	1	58.7000000000000028	4	8	\N	\N
76	Michael	Kirvan	579620	2005-06-29	10	t	3	5	f		f	t	623	1	59.6000000000000014	4	9	\N	3
14	Lochrie	Ryan	955643	2003-04-27	12	t	9	1	f	Last name does not match USAG last name (USAG: Lochrie)\n	t	f	563	1	59.7000000000000028	1	7	\N	3
42	Nikhil	Dhayagude	571419	2006-11-29	8	t	5	2	f	Level does not match USAG level (USAG: 5)\n	t	f	822	1	\N	3	\N	\N	2
124	Stanley	Maher-Rippin	995900	2008-02-01	7	t	8	7	f	Last name does not match USAG last name (USAG: Maher-R...)\n	t	f	444	1	63.7000000000000028	3	1	1	3
71	Brent	Willis	1011494	2006-08-01	9	t	9	5	f		f	t	533	1	58.7000000000000028	8	5	\N	3
111	Drew	Cowan	614763	2004-12-10	10	t	3	7	f		f	t	635	1	50.2000000000000028	17	9	\N	3
216	Nathaniel	Frempong	951023	2006-08-11	9	t	9	15	f		f	t	585	1	60.8999999999999986	3	5	\N	\N
93	Neil	Morgan	552928	2005-02-09	10	t	3	6	f		f	t	612	1	59.5	5	9	\N	4
128	Christian	Jarrell	198617	1999-10-23	15	t	7	7	f		f	t	1007	1	52.1000000000000014	11	18	\N	8
90	Tiernan	Yoder	939768	2006-06-27	9	t	9	6	f		f	t	518	1	60	6	5	\N	3
107	Patrick	Chu	937186	2007-07-25	8	t	8	7	f	Level does not match USAG level (USAG: 5)\n	t	f	438	1	60.2999999999999972	3	2	1	3
170	Ronan	Agundes-Wright	956997	2007-05-13	8	t	8	11	f	Last name does not match USAG last name (USAG: Agundes...)\n	t	f	428	1	58.3999999999999986	4	2	\N	3
248	Cameron	Leonard	204504	1998-08-18	17	t	7	16	f	Date of birth does not match USAG date of birth (USAG: 1998-08-08)\n	t	f	1021	1	61.5	4	19	\N	\N
95	Josef	Pelligrini	619651	2002-05-29	13	t	3	6	f	Last name does not match USAG last name (USAG: Pellegrini)\n	t	f	613	1	65.9000000000000057	1	11	\N	7
181	Cameron	Sullivan	590646	2006-07-13	9	t	3	11	f		f	t	629	1	57.8999999999999986	5	8	\N	4
307	Elijah	Fisher	482708	2001-06-03	14	t	4	20	f	Level does not match USAG level (USAG: 6)\n	t	f	703	1	54.2999999999999972	6	13	\N	\N
182	Makennen	Warra	550699	2006-06-21	9	t	3	11	f		f	t	630	1	59.6000000000000014	3	8	\N	4
297	Wesley	Haycock	486369	2002-04-22	13	t	3	20	f		f	t	616	1	59.5	6	11	\N	\N
183	Dylan	Defoor	540046	2005-09-28	9	t	4	11	f		f	t	713	1	49.1000000000000014	16	12	\N	4
268	Edris	Graves	532060	2004-05-24	11	t	4	17	f		f	t	723	1	62.6000000000000014	3	12	\N	5
140	Zachary	Rollins	547957	2004-08-16	11	t	4	7	f		f	t	716	1	53.6000000000000014	13	12	\N	3
116	Julian	Galvez	548134	2004-10-04	10	t	4	7	f		f	t	714	1	54.6000000000000014	7	12	\N	3
113	Jonathan	Dao	614758	2005-03-31	10	t	3	7	f		f	t	637	1	56	11	9	\N	3
205	Andrew	Hibbert	619405	2007-02-22	8	t	3	14	f		f	t	659	1	54.3999999999999986	10	8	\N	3
123	Miles	Hayter	937335	2006-03-10	9	t	9	7	f		f	t	544	1	54.1000000000000014	18	5	\N	3
203	Samuel	Nile	952796	2007-06-04	8	t	9	14	f	Last name does not match USAG last name (USAG: Samuel)\n	t	f	583	1	54.3999999999999986	20	4	\N	3
83	Alex	Rearden	989668	2007-09-29	7	t	8	6	f		f	t	415	1	61.5	5	1	\N	2
121	Landon	Hall	996936	2008-08-25	7	t	8	7	f		f	t	441	1	59.5	7	1	1	3
251	Gavin	Felix	1000825	2006-12-22	8	t	8	17	f		f	t	452	1	52.6000000000000014	16	2	\N	3
249	Isaac	Steele		2007-10-16	7	f	8	17	f		f	f	457	1	57.6000000000000014	10	1	\N	3
82	Jacob	York	989666	2009-01-16	6	t	8	6	f		f	t	416	1	58.3999999999999986	8	1	\N	3
172	Kenneth	Sault	1000972	2008-11-25	6	t	8	11	f		f	t	430	1	56.7999999999999972	12	1	\N	3
215	Marcus	Valiente	255148	1999-09-04	15	t	7	14	f		f	t	1024	1	55.2000000000000028	6	18	\N	3
316	Dhiren	Lutchman	245810	2000-09-14	14	t	6	20	f		f	t	914	1	58.8999999999999986	5	16	\N	\N
270	Liam	Bachman	377434	2002-06-30	13	t	6	17	f		f	t	930	1	53.7000000000000028	23	16	\N	4
271	Jackson	Scheck	374903	2002-01-11	13	t	6	17	f		f	t	934	1	61.6000000000000014	4	16	\N	4
272	Kieran	Clark	488032	2002-05-03	13	t	6	17	f		f	t	931	1	55.8999999999999986	18	16	\N	4
114	Reese	Durso	1014104	2002-03-23	13	t	6	7	f		f	t	918	1	57.8999999999999986	9	16	\N	3
275	Joe	Cramer	258877	1999-05-30	16	t	7	19	f		f	t	1010	1	56.3999999999999986	5	18	\N	\N
177	James	Bishop	580814	2002-12-29	12	t	3	11	f		f	t	625	1	61.3999999999999986	4	11	\N	4
50	Parker	Thackston	471446	2003-12-08	11	t	5	2	f	Level does not match USAG level (USAG: 6)\nUSAG member is not active (USAG: Expired)\n	t	f	824	1	50.6000000000000014	20	14	\N	4
247	Brendan	Fritz	243962	\N	\N	f	7	16	f	Date of birth does not match USAG date of birth (USAG: 1998-11-27)\n	t	f	1020	1	\N	3	\N	\N	\N
228	Marshall	Greer	960819	\N	\N	t	8	16	f	Date of birth does not match USAG date of birth (USAG: 2006-11-16)\n	t	f	467	1	51.7000000000000028	2	\N	\N	\N
299	Bode	Kunda	592599	\N	\N	t	3	20	f	Date of birth does not match USAG date of birth (USAG: 2006-01-30)\n	t	f	617	1	\N	3	\N	\N	\N
244	Owen	Lawler	584620	\N	\N	t	6	16	f	Date of birth does not match USAG date of birth (USAG: 2000-12-05)\n	t	f	936	1	\N	3	\N	\N	\N
269	Kyle	Walchuk	505115	2005-05-10	10	t	5	17	f		f	t	827	1	\N	3	\N	\N	3
178	Logan	Boyle	550911	2005-10-18	9	t	3	11	f		f	t	626	1	51.3999999999999986	13	8	\N	4
236	Enzo	Napolitano	1013320	2006-04-23	9	t	9	16	f		f	t	577	1	57.5	12	5	\N	\N
261	Oliver	March	952156	2002-10-22	12	t	9	17	f		f	t	569	1	50.7999999999999972	7	7	\N	2
258	AJ	DiPillo	950066	2005-07-13	10	t	9	17	f		f	t	566	1	58.6000000000000014	5	6	\N	3
72	Gavin	Keefer	974232	2007-12-05	7	t	9	5	f		f	t	531	1	64	1	4	\N	3
201	Ficke	Brit	648849	2005-03-14	10	t	9	14	f	Last name does not match USAG last name (USAG: Ficke)\n	t	f	580	1	54.1000000000000014	16	6	\N	3
264	Ryan	Uy	978410	2006-06-03	9	t	9	17	f		f	t	572	1	60.2000000000000028	5	5	\N	3
318	Brett	Bowling	380451	1999-10-01	15	t	6	20	f	USAG member is not active (USAG: Expired)\n	t	f	910	1	59.2999999999999972	1	17	\N	\N
214	Samuel	Penn	230564	1998-02-21	17	t	7	14	f		f	t	1023	1	55.8999999999999986	8	19	\N	3
309	Henry	Shiffrin	519898	2003-04-26	12	t	4	20	f	Last name does not match USAG last name (USAG: Shifrin)\nLevel does not match USAG level (USAG: 6)\n	t	f	709	1	65.9000000000000057	1	13	\N	\N
253	Owen	Geibel	1000824	2007-02-21	8	t	8	17	f		f	t	453	1	60.8999999999999986	1	2	\N	3
58	Adin	Esberg	626828	2002-07-19	13	t	3	3	f	Last name does not match USAG last name (USAG: Berard)\nDate of birth does not match USAG date of birth (USAG: 2015-10-12)\nLevel does not match USAG level (USAG: None)\nUSAG member is not active (USAG: Not an athlete member)\n	t	f	642	1	58.7999999999999972	7	11	\N	7
198	Brooks	Ficke	1010429	2008-04-08	7	t	8	14	f	Date of birth does not match USAG date of birth (USAG: 2008-07-07)\n	t	f	475	1	55.2999999999999972	22	1	\N	2
291	Orion	Campbell	639727	2006-05-29	9	t	9	20	f	Date of birth does not match USAG date of birth (USAG: 2006-05-24)\n	t	f	519	1	51.2000000000000028	24	5	\N	\N
132	Geovanny	Mejia-Gabriel	969397	2007-08-29	8	t	9	7	f	Last name does not match USAG last name (USAG: Mejia-G...)\n	t	f	545	1	57	12	4	\N	3
146	Aaban	Syed	500067	2004-03-27	11	t	5	7	f		f	t	818	1	55	13	14	\N	4
217	Judah	Matti	951026	2006-09-20	8	t	9	15	f	Date of birth does not match USAG date of birth (USAG: 2006-02-12)\n	t	f	586	1	56.2000000000000028	15	4	\N	\N
41	Schneider	Joseph	571338	2006-10-27	8	t	9	2	f	Last name does not match USAG last name (USAG: Schneider)\n	t	f	550	1	56.5	14	4	\N	2
292	Spencer	Kestler	573985	2004-04-30	11	t	9	20	f	USAG member is not active (USAG: Expired)\n	t	f	521	1	57.5	8	6	\N	\N
286	Colin	Morrison	621924	2005-11-24	9	t	9	20	f	Level does not match USAG level (USAG: 4)\nUSAG member is not active (USAG: Expired)\n	t	f	525	1	54.3999999999999986	16	5	\N	\N
62	Antony	Altwater	959356	2002-06-28	13	t	9	4	f	Last name does not match USAG last name (USAG: Altvater)\n	t	f	573	1	56.2000000000000028	5	7	\N	\N
314	Christopher	Mateer	431013	2002-03-27	13	t	6	20	f	Level does not match USAG level (USAG: 8)\nUSAG member is not active (USAG: Expired)\n	t	f	915	1	54.2999999999999972	22	16	\N	\N
73	Brandon	McCready	967055	2008-05-05	7	t	9	5	f	Last name does not match USAG last name (USAG: McReady)\n	t	f	532	1	55.7000000000000028	17	4	\N	2
242	Boaz	Kelly	575925	\N	\N	t	4	16	f	Date of birth does not match USAG date of birth (USAG: 2004-12-21)\n	t	f	725	1	\N	3	\N	\N	\N
243	Gavin	Christopher	433826	\N	\N	t	6	16	f	Last name does not match USAG last name (USAG: Christo...)\nDate of birth does not match USAG date of birth (USAG: 2000-11-15)\n	t	f	935	1	\N	3	\N	\N	\N
54	Brendan	Smith	523711	2000-05-11	15	t	7	2	f	Level does not match USAG level (USAG: 9)\n	t	f	1013	1	63.2000000000000028	2	18	\N	9
218	Robbie	Slaton	951022	2005-06-03	10	t	9	15	f	Last name does not match USAG last name (USAG: Slayton)\n	t	f	588	1	53.7999999999999972	18	6	\N	\N
78	Alexander	Auchincloss	523288	2004-12-04	10	t	3	5	f	Last name does not match USAG last name (USAG: Auchinc...)\n	t	f	620	1	57.5	9	9	\N	7
19	Jack	Thurston 	661303	2005-03-16	10	t	3	1	f	Last name does not match USAG last name (USAG: Thurston)\n	t	f	653	1	54.2000000000000028	15	9	\N	4
125	Joshua	Henry-Price	455261	2003-04-01	12	t	5	7	f	Last name does not match USAG last name (USAG: Henry-P...)\n	t	f	813	1	56.1000000000000014	10	14	\N	4
200	Caden	Burges	648853	2006-01-19	9	f	9	14	f	Last name does not match USAG last name (USAG: Burgess)\n	t	f	581	1	57.8999999999999986	9	5	\N	4
137	Jadon	Ra-Akbar	456209	2003-09-03	11	t	5	7	f	Level does not match USAG level (USAG: 6)\nUSAG member is not active (USAG: Expired)\n	t	f	815	1	54.7000000000000028	14	14	\N	\N
74	Isaiah	Irons	643614	2006-12-20	8	t	3	5	f	Level does not match USAG level (USAG: 5)\n	t	f	622	1	59.7000000000000028	2	8	\N	3
204	Vivek	Suravenkat	994394	2005-01-27	10	t	9	14	f		f	t	584	1	57.5	6	6	\N	4
112	Asher	Cronin	936964	2006-04-01	9	t	3	7	f	Last name does not match USAG last name (USAG: Cronin )\n	t	f	636	1	54.5	9	8	\N	\N
35	Garrett	Kasiski	420868	2000-08-05	15	t	7	1	f		f	t	1016	1	54.2999999999999972	7	18	\N	8
70	Tristan	Watkins	1011493	2009-04-17	6	t	8	5	f		f	t	427	1	64.5999999999999943	2	1	\N	2
293	Malakai	Kofie	583018	2006-12-19	8	t	9	20	f		f	t	522	1	57.7000000000000028	11	4	\N	\N
284	Luke	Mazzuca	621923	2007-08-30	8	t	9	20	f		f	t	523	1	55.8999999999999986	16	4	\N	\N
287	Tyler	Morrison	587041	2006-11-21	8	t	9	20	f	Level does not match USAG level (USAG: 4)\nUSAG member is not active (USAG: Expired)\n	t	f	526	1	54.2000000000000028	21	4	\N	\N
157	Matthew	Schlueter	643536	2005-04-05	10	t	9	9	f		f	t	540	1	54	17	6	\N	4
85	Conner	Lin	989664	2007-10-10	7	t	8	6	f		f	t	413	1	58	9	1	\N	3
39	Jeremy	Maletzky	958086	2007-10-23	7	t	9	2	f	Level does not match USAG level (USAG: 4)\n	t	f	552	1	60.1000000000000014	5	4	\N	2
45	Issac	Samuel	577619	2006-11-16	8	t	9	2	f		f	t	553	1	58.2999999999999972	8	4	\N	2
151	Simon	Wedge	994241	2008-06-22	7	t	8	7	f		f	t	447	1	57.1000000000000014	11	1	1	2
131	Jan	Mason	991280	2009-07-25	6	t	8	7	f		f	t	445	1	56.1000000000000014	18	1	1	2
254	Adam	Zolper	1000826	2007-11-27	7	t	8	17	f		f	t	458	1	55.5	21	1	\N	3
12	Sean	Kellogg	628047	2006-09-25	8	t	9	1	f		f	t	561	1	58.1000000000000014	9	4	\N	3
15	Brennan	Walker	622288	2006-09-15	8	t	9	1	f		f	t	564	1	58.7000000000000028	6	4	\N	4
263	Sean	Salisbury	636887	2004-10-16	10	t	9	17	f		f	t	571	1	56.8999999999999986	10	6	\N	4
94	David	Pelligrini	619648	2003-09-19	11	t	3	6	f	Last name does not match USAG last name (USAG: Pellegrini)\n	t	f	614	1	55.6000000000000014	8	10	\N	7
142	Brandon	Singleton	455967	2002-12-18	12	t	5	7	f		f	t	816	1	56.7999999999999972	8	14	\N	5
283	Zack	Mazzuca	1008952	2007-08-30	8	t	8	20	f		f	t	418	1	55.1000000000000014	13	2	\N	\N
191	Aiden	Serres	992862	2006-09-03	8	t	8	13	f		f	t	423	1	57.2999999999999972	7	2	\N	\N
161	Konrad	Mazur-Chang		2007-08-27	8	t	8	9	f	\N	f	f	435	1	49.7999999999999972	18	2	\N	2
127	Tyler	Jackson	999856	2006-11-16	8	t	8	7	f		f	t	443	1	56.1000000000000014	8	2	1	2
150	Michael	Venit	500075	2004-06-02	11	t	5	7	f		f	t	820	1	61.7999999999999972	2	14	\N	4
26	Kyle	Shilling	457824	2003-09-06	11	t	5	1	f		f	t	826	1	53.7999999999999972	18	14	\N	4
52	P.J.	Spagnoletti	537029	2000-12-07	14	t	6	2	f	Last name does not match USAG last name (USAG: Spagnol...)\nLevel does not match USAG level (USAG: 8)\n	t	f	922	1	54.6000000000000014	20	16	\N	8
53	Dylan	Vaughn	440614	2001-07-22	14	t	6	2	f	Level does not match USAG level (USAG: 8)\n	t	f	923	1	57.6000000000000014	11	16	\N	8
184	Nick	DeNisco	1008616	2006-11-16	8	t	8	12	f		f	t	462	1	60.3999999999999986	2	2	\N	4
195	Michael	Rymut	994398	2006-12-26	8	t	8	14	f	Last name does not match USAG last name (USAG: Michael)\n	t	f	478	1	53.6000000000000014	15	2	\N	4
92	Ethan	Wells	619653	2005-06-09	10	t	9	6	f		f	t	517	1	62.7000000000000028	1	6	\N	4
186	Garrett	Murry	1015881	1999-11-09	15	t	8	12	f		f	t	463	1	65.5	1	3	\N	8
171	William	Jones	1017124	2005-06-07	10	t	8	11	f		f	t	429	1	62.7000000000000028	2	3	\N	3
89	Michael	Peppiatt	1004176	2004-02-29	11	t	8	6	f		f	t	414	1	62.2999999999999972	3	3	\N	3
159	Matthew	Harnish	958266	2006-04-08	9	t	8	9	f	Last name does not match USAG last name (USAG: Harnisch)\n	t	f	431	1	61.5	4	3	\N	3
189	Cole	Lane	992856	2006-08-02	9	t	8	13	f		f	t	421	1	61.3999999999999986	5	3	\N	\N
187	Jacob	Griffin	992840	2005-08-12	10	t	8	13	f		f	t	419	1	60.2999999999999972	6	3	\N	\N
160	Henry	Levi	658960	2006-07-28	9	t	8	9	f		f	t	434	1	60.2999999999999972	7	3	\N	4
65	Solomon	Miller	959355	2006-06-11	9	t	8	4	f	Date of birth does not match USAG date of birth (USAG: 2006-06-12)\n	t	f	461	1	60	8	3	\N	\N
69	Marc	Portaro	1011470	2006-02-22	9	t	8	5	f		f	t	426	1	58.7999999999999972	9	3	\N	3
185	Seth	Wayland	1008613	2006-01-16	9	t	8	12	f		f	t	464	1	57.6000000000000014	11	3	\N	3
63	Caleb	Dahllof	959353	2004-09-20	10	t	8	4	f		f	t	459	1	56.3999999999999986	12	3	\N	\N
68	Charles	Magness	1011466	2006-03-17	9	t	8	5	f		f	t	425	1	56.2000000000000028	13	3	\N	3
190	Mathew	Pattison	992860	2003-05-11	12	t	8	13	f		f	t	422	1	55.8999999999999986	14	3	\N	\N
194	Liam	Hood	994397	2006-02-07	9	t	8	14	f		f	t	477	1	55.7999999999999972	15	3	\N	3
188	Aidan	Kuvshinoff	992854	2005-03-06	10	t	8	13	f		f	t	420	1	54.7999999999999972	16	3	\N	\N
256	Zachary	Secord	950068	2005-08-05	10	t	8	17	f		f	t	456	1	53.5	17	3	\N	4
199	Braden	Wysocki	994401	2005-12-01	9	t	8	14	f		f	t	480	1	53.3999999999999986	18	3	\N	3
86	Tyler	Durante	989662	2005-09-12	9	t	8	6	f		f	t	412	1	12	21	3	\N	4
192	Jezrael	Agbor-Obal	994395	2006-04-22	9	t	8	14	f		f	t	473	1	52.8999999999999986	19	3	\N	4
282	Kunda	Becker	938283	2006-01-30	9	t	8	20	f	Last name does not match USAG last name (USAG: Kunda)\n	t	f	417	1	52.7999999999999972	20	3	\N	\N
\.


--
-- Name: registration_gymnast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_gymnast_id_seq', 318, true);


--
-- Data for Name: registration_gymnastpricing; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_gymnastpricing (id, price, name, meet_id) FROM stdin;
1	80	$80 per gymnast (Early Bird)	1
2	90	$90 per gymnast	1
\.


--
-- Name: registration_gymnastpricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_gymnastpricing_id_seq', 2, true);


--
-- Data for Name: registration_level; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_level (id, level, "order", meet_id) FROM stdin;
3	6	2	1
4	7	3	1
5	8	4	1
6	9	5	1
7	10	6	1
8	4	0	1
9	5	1	1
\.


--
-- Name: registration_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_level_id_seq', 12, true);


--
-- Data for Name: registration_levelpricing; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_levelpricing (id, price, name, meet_id) FROM stdin;
1	50	$50	1
\.


--
-- Name: registration_levelpricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_levelpricing_id_seq', 1, true);


--
-- Data for Name: registration_shirtsize; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_shirtsize (id, name, "order") FROM stdin;
1	Extra Small (Youth)	0
2	Small (Youth)	1
3	Medium (Youth)	2
4	Large (Youth)	3
5	Extra Large (Youth)	4
6	Extra Small (Adult)	5
7	Small (Adult)	6
8	Medium (Adult)	7
9	Large (Adult)	8
10	Extra Large (Adult)	9
\.


--
-- Name: registration_shirtsize_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_shirtsize_id_seq', 10, true);


--
-- Data for Name: registration_team; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_team (id, gym, address_1, address_2, city, first_name, last_name, email, gymnast_cost, level_cost, total_cost, started, updated, payment_postmark, registration_complete, paid_in_full, notes, postal_code, state, phone, usag, team, meet_id, qualified, per_level_cost_id, per_gymnast_cost_id) FROM stdin;
16	Rebounders Gymnastics				Jamal	Rice	team@rebounders.com	1840.00	150.00	1990.00	2015-10-07 20:25:58.644612-04	2015-10-08 12:41:20.260928-04	2015-10-07	2015-10-05 20:00:00-04	t				410-252-3374 ex 116	023955	Rebouders	1	t	1	\N
17	KMC Gymnastics	912 W Cypress St		Kennett Square	Tara	Graves	karen@kmcgymnastics.org	2080.00	150.00	2230.00	2015-10-08 18:09:13.096649-04	2015-10-08 18:48:20.840311-04	\N	2015-10-07 20:00:00-04	f		19348	Pennsylvania	610-444-4464	23825	KMC	1	t	1	\N
5	Docksiders Gymnastics	216 Najoles Rd		Millersville	Charlie	Kowalski	docksiders@aol.com	1200.00	200.00	1400.00	2015-09-21 22:41:57.926811-04	2015-10-08 19:09:21.718443-04	2015-09-16	2015-09-15 20:00:00-04	t		21108	Maryland	410-987-8780	24544	Docksiders	1	t	1	\N
13	Beach Bounders Gymnastics	400 S. Brown Street		Fruitland	Ramsey	Mitchell	beachbounders@comcast.net	400.00	50.00	450.00	2015-10-01 17:17:26.712771-04	2015-10-08 19:11:50.740365-04	2015-10-29	2015-09-28 20:00:00-04	t		21826	Maryland		397250	Beach Bounders	1	t	1	\N
19	Gym Quest Gymnastics	2196 Lanier Lane		Rockville	Jodi	Bauer	Jod_Bauer@hotmail.com	560.00	100.00	660.00	2015-10-09 23:37:28.729746-04	2015-10-09 23:45:42.879234-04	\N	\N	f		23146	Virginia	804-346-1499	71008	Gym Quest	1	t	1	\N
12	Olympiad Gymnastics	380 Water St.		Newport	Susan	Heitz	sue@flipkidz.com	240.00	0.00	240.00	2015-10-01 13:41:17.036325-04	2015-10-07 20:56:25.747444-04	2015-10-06	2015-09-30 20:00:00-04	t		19804	Delaware	302-636-0606		Olympiad	1	t	1	\N
2	Gymland Arena Gymnastics	6 Tennis Ct.		Hamilton	Zvonimir	Ilic	office@gym-land.com	1280.00	150.00	1430.00	2015-09-08 12:29:34.999184-04	2015-10-03 22:06:06.054066-04	2015-09-10	2015-08-29 20:00:00-04	t		08619	NJ	609-584-7700		Gymland	1	t	1	\N
11	Excalibur Gymnastics	5816 Arrowhead Drive		Virginia Beach	Mariana	Moure	office@excalibur-gymnastics.com	1120.00	150.00	1270.00	2015-09-30 14:57:37.716964-04	2015-10-08 17:38:47.675157-04	\N	2015-09-29 20:00:00-04	f		23462	Virginia	757-499-8258		Excalibur	1	t	1	\N
7	Fairland Sports & Aquatics Complex				Mel	Brown	mel.brown@pgparks.com	4000.00	300.00	4300.00	2015-09-30 13:38:11.094817-04	2015-10-03 22:05:14.895445-04	2015-09-30	2015-09-29 20:00:00-04	t				301-362-6066		Fairland	1	t	1	\N
1	Gymstrada	5644 Parliament Drive		Virginia Beach	Barry	Goldwater	nictolley@gmail.com	2960.00	300.00	3260.00	2015-07-26 13:52:42.512901-04	2015-10-03 22:06:16.03421-04	2015-09-10	2015-08-27 20:00:00-04	t		23462	Virginia	(757) 499-8591	023979	Gymstrada	1	t	1	\N
9	Fairfax Gymnastics Academy				Monina	Bantug	Monina.Bantug@gmail.com	960.00	150.00	1110.00	2015-09-30 14:13:14.599425-04	2015-10-03 22:05:49.109874-04	\N	2015-09-29 20:00:00-04	f				240-421-1158		Fairfax	1	t	1	\N
14	Top Flight Gymnastics	9179A Red Branch Road		Columbia	Dale	Kaestner	dalekkaestner@mac.com	1920.00	250.00	2170.00	2015-10-03 20:53:38.842692-04	2015-10-03 22:07:21.979442-04	\N	2015-10-02 20:00:00-04	f		21045	Maryland	410-992-1600		Top Flight	1	t	1	\N
20	All-Pro Gymnastics, Paragon Boys Team	PO Box 8686		Elkridge	Kevin	Preston		2960.00	200.00	3160.00	2015-10-09 23:50:57.153058-04	2015-10-10 00:32:27.844509-04	\N	2015-10-08 20:00:00-04	f		21075	Maryland	443-545-2262	97293	Paragon	1	t	1	\N
4	North Shore Gymnastics	505 Blue Ball Road 140-D		Elktron	Tracy	Cooper	northshoregym@comcast.net	400.00	50.00	450.00	2015-09-21 19:44:02.392944-04	2015-10-03 22:06:30.23826-04	2015-09-16	2015-09-15 20:00:00-04	t		208806	MD	410-398-3022		North Shore	1	t	1	\N
15	United Gymnastix	12300 Owings Mills Blvd		Reisterstown	Donell	Thompson	llenodt@gmail.com	800.00	150.00	950.00	2015-10-07 20:12:17.843301-04	2015-10-07 20:13:08.693412-04	\N	\N	f		21136	Maryland	410-377-0193		United Gymnastix	1	t	1	\N
3	Gravity Forged Gymnastics	2920 Turnpike Dr		Hatboro	Dan	Galiczynski	gravityforged@gmail.com	400.00	0.00	400.00	2015-09-10 12:29:54.304311-04	2015-10-07 18:49:01.384249-04	2015-09-12	2015-09-09 20:00:00-04	t		19040	Pennsylvania	2152757526		Gravity Forged	1	t	1	\N
6	APEX Gymnastics	741 Miller Dr. SE I-1		Leesburg	Vladimir	Shamenko		1600.00	300.00	1900.00	2015-09-29 13:49:31.51546-04	2015-10-11 17:32:19.109066-04	2015-09-29	2015-09-28 20:00:00-04	t		20175	Virginia	703-777-5344	024893	APEX	1	t	1	1
\.


--
-- Name: registration_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_team_id_seq', 20, true);


--
-- Name: registration_team_level_awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fairplay
--

SELECT pg_catalog.setval('registration_team_level_awards_id_seq', 1, false);


--
-- Data for Name: registration_team_team_awards; Type: TABLE DATA; Schema: public; Owner: fairplay
--

COPY registration_team_team_awards (id, team_id, teamaward_id) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: competition_athleteevent_gymnast_id_9218ffc9fb3da41_uniq; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_athleteevent
    ADD CONSTRAINT competition_athleteevent_gymnast_id_9218ffc9fb3da41_uniq UNIQUE (gymnast_id, event_id);


--
-- Name: competition_athleteevent_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_athleteevent
    ADD CONSTRAINT competition_athleteevent_pkey PRIMARY KEY (id);


--
-- Name: competition_division_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_division
    ADD CONSTRAINT competition_division_pkey PRIMARY KEY (id);


--
-- Name: competition_event_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_event
    ADD CONSTRAINT competition_event_pkey PRIMARY KEY (id);


--
-- Name: competition_ledshow_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_ledshow
    ADD CONSTRAINT competition_ledshow_pkey PRIMARY KEY (id);


--
-- Name: competition_ledshowmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_ledshowmessage
    ADD CONSTRAINT competition_ledshowmessage_pkey PRIMARY KEY (id);


--
-- Name: competition_ledsign_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_ledsign
    ADD CONSTRAINT competition_ledsign_pkey PRIMARY KEY (id);


--
-- Name: competition_session_divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_session_divisions
    ADD CONSTRAINT competition_session_divisions_pkey PRIMARY KEY (id);


--
-- Name: competition_session_divisions_session_id_division_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_session_divisions
    ADD CONSTRAINT competition_session_divisions_session_id_division_id_key UNIQUE (session_id, division_id);


--
-- Name: competition_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_session
    ADD CONSTRAINT competition_session_pkey PRIMARY KEY (id);


--
-- Name: competition_teamaward_divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamaward_divisions
    ADD CONSTRAINT competition_teamaward_divisions_pkey PRIMARY KEY (id);


--
-- Name: competition_teamaward_divisions_teamaward_id_division_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamaward_divisions
    ADD CONSTRAINT competition_teamaward_divisions_teamaward_id_division_id_key UNIQUE (teamaward_id, division_id);


--
-- Name: competition_teamaward_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamaward_levels
    ADD CONSTRAINT competition_teamaward_levels_pkey PRIMARY KEY (id);


--
-- Name: competition_teamaward_levels_teamaward_id_level_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamaward_levels
    ADD CONSTRAINT competition_teamaward_levels_teamaward_id_level_id_key UNIQUE (teamaward_id, level_id);


--
-- Name: competition_teamaward_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamaward
    ADD CONSTRAINT competition_teamaward_pkey PRIMARY KEY (id);


--
-- Name: competition_teamawardrank_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY competition_teamawardrank
    ADD CONSTRAINT competition_teamawardrank_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_627e21ab8179124e_uniq; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_627e21ab8179124e_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: gymnastics_athlete_athlete_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymnastics_athlete_athlete_id_key UNIQUE (athlete_id);


--
-- Name: gymnastics_athlete_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymnastics_athlete_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_athlete_usag_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymnastics_athlete_usag_id_key UNIQUE (usag_id);


--
-- Name: gymnastics_athleteevent_athlete_id_6382e848cce5e03a_uniq; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_athleteevent
    ADD CONSTRAINT gymnastics_athleteevent_athlete_id_6382e848cce5e03a_uniq UNIQUE (athlete_id, event_id);


--
-- Name: gymnastics_athleteevent_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_athleteevent
    ADD CONSTRAINT gymnastics_athleteevent_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_event_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_event
    ADD CONSTRAINT gymnastics_event_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_group
    ADD CONSTRAINT gymnastics_group_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_ledsign_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_ledsign
    ADD CONSTRAINT gymnastics_ledsign_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_ledsign_sign_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_ledsign
    ADD CONSTRAINT gymnastics_ledsign_sign_id_key UNIQUE (sign_id);


--
-- Name: gymnastics_meetsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_meetsettings
    ADD CONSTRAINT gymnastics_meetsettings_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_message_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_message
    ADD CONSTRAINT gymnastics_message_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_session_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_session_groups
    ADD CONSTRAINT gymnastics_session_groups_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_session_groups_session_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_session_groups
    ADD CONSTRAINT gymnastics_session_groups_session_id_group_id_key UNIQUE (session_id, group_id);


--
-- Name: gymnastics_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_session
    ADD CONSTRAINT gymnastics_session_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_team_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_team
    ADD CONSTRAINT gymnastics_team_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamaward_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamaward_groups
    ADD CONSTRAINT gymnastics_teamaward_groups_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamaward_groups_teamaward_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamaward_groups
    ADD CONSTRAINT gymnastics_teamaward_groups_teamaward_id_group_id_key UNIQUE (teamaward_id, group_id);


--
-- Name: gymnastics_teamaward_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamaward
    ADD CONSTRAINT gymnastics_teamaward_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamawardrank_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawardrank
    ADD CONSTRAINT gymnastics_teamawardrank_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamawards_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawards_groups
    ADD CONSTRAINT gymnastics_teamawards_groups_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamawards_groups_teamawards_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawards_groups
    ADD CONSTRAINT gymnastics_teamawards_groups_teamawards_id_group_id_key UNIQUE (teamawards_id, group_id);


--
-- Name: gymnastics_teamawards_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawards
    ADD CONSTRAINT gymnastics_teamawards_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamawards_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawards_teams
    ADD CONSTRAINT gymnastics_teamawards_teams_pkey PRIMARY KEY (id);


--
-- Name: gymnastics_teamawards_teams_teamawards_id_team_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY gymnastics_teamawards_teams
    ADD CONSTRAINT gymnastics_teamawards_teams_teamawards_id_team_id_key UNIQUE (teamawards_id, team_id);


--
-- Name: meet_meet_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY meet_meet
    ADD CONSTRAINT meet_meet_pkey PRIMARY KEY (id);


--
-- Name: registration_coach_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_coach
    ADD CONSTRAINT registration_coach_pkey PRIMARY KEY (id);


--
-- Name: registration_gymnast_athlete_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registration_gymnast_athlete_id_key UNIQUE (athlete_id);


--
-- Name: registration_gymnast_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registration_gymnast_pkey PRIMARY KEY (id);


--
-- Name: registration_gymnastpricing_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_gymnastpricing
    ADD CONSTRAINT registration_gymnastpricing_pkey PRIMARY KEY (id);


--
-- Name: registration_level_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_level
    ADD CONSTRAINT registration_level_pkey PRIMARY KEY (id);


--
-- Name: registration_levelpricing_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_levelpricing
    ADD CONSTRAINT registration_levelpricing_pkey PRIMARY KEY (id);


--
-- Name: registration_shirtsize_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_shirtsize
    ADD CONSTRAINT registration_shirtsize_pkey PRIMARY KEY (id);


--
-- Name: registration_team_level_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_team_team_awards
    ADD CONSTRAINT registration_team_level_awards_pkey PRIMARY KEY (id);


--
-- Name: registration_team_level_awards_team_id_teamaward_id_key; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_team_team_awards
    ADD CONSTRAINT registration_team_level_awards_team_id_teamaward_id_key UNIQUE (team_id, teamaward_id);


--
-- Name: registration_team_pkey; Type: CONSTRAINT; Schema: public; Owner: fairplay; Tablespace: 
--

ALTER TABLE ONLY registration_team
    ADD CONSTRAINT registration_team_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: competition_athleteevent_4437cfac; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_athleteevent_4437cfac ON competition_athleteevent USING btree (event_id);


--
-- Name: competition_athleteevent_c0f3deba; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_athleteevent_c0f3deba ON competition_athleteevent USING btree (gymnast_id);


--
-- Name: competition_division_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_division_57413943 ON competition_division USING btree (meet_id);


--
-- Name: competition_division_80e0bd5f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_division_80e0bd5f ON competition_division USING btree (level_id);


--
-- Name: competition_event_0dee419f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_event_0dee419f ON competition_event USING btree (sign_id);


--
-- Name: competition_event_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_event_57413943 ON competition_event USING btree (meet_id);


--
-- Name: competition_ledshowmessage_035d209c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_ledshowmessage_035d209c ON competition_ledshowmessage USING btree (led_sign_id);


--
-- Name: competition_ledshowmessage_64d8a6fa; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_ledshowmessage_64d8a6fa ON competition_ledshowmessage USING btree (led_show_id);


--
-- Name: competition_session_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_session_57413943 ON competition_session USING btree (meet_id);


--
-- Name: competition_session_divisions_7fc8ef54; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_session_divisions_7fc8ef54 ON competition_session_divisions USING btree (session_id);


--
-- Name: competition_session_divisions_9ff3405c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_session_divisions_9ff3405c ON competition_session_divisions USING btree (division_id);


--
-- Name: competition_teamaward_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamaward_57413943 ON competition_teamaward USING btree (meet_id);


--
-- Name: competition_teamaward_divisions_0763afb4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamaward_divisions_0763afb4 ON competition_teamaward_divisions USING btree (teamaward_id);


--
-- Name: competition_teamaward_divisions_9ff3405c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamaward_divisions_9ff3405c ON competition_teamaward_divisions USING btree (division_id);


--
-- Name: competition_teamaward_levels_0763afb4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamaward_levels_0763afb4 ON competition_teamaward_levels USING btree (teamaward_id);


--
-- Name: competition_teamaward_levels_80e0bd5f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamaward_levels_80e0bd5f ON competition_teamaward_levels USING btree (level_id);


--
-- Name: competition_teamawardrank_11043aa6; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamawardrank_11043aa6 ON competition_teamawardrank USING btree (team_award_id);


--
-- Name: competition_teamawardrank_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX competition_teamawardrank_f6a7ca40 ON competition_teamawardrank USING btree (team_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: gymnastics_athlete_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_athlete_0e939a4f ON gymnastics_athlete USING btree (group_id);


--
-- Name: gymnastics_athlete_bbc11087; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_athlete_bbc11087 ON gymnastics_athlete USING btree (starting_event_id);


--
-- Name: gymnastics_athlete_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_athlete_f6a7ca40 ON gymnastics_athlete USING btree (team_id);


--
-- Name: gymnastics_athleteevent_4437cfac; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_athleteevent_4437cfac ON gymnastics_athleteevent USING btree (event_id);


--
-- Name: gymnastics_athleteevent_975a0aa5; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_athleteevent_975a0aa5 ON gymnastics_athleteevent USING btree (athlete_id);


--
-- Name: gymnastics_event_0dee419f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_event_0dee419f ON gymnastics_event USING btree (sign_id);


--
-- Name: gymnastics_session_groups_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_session_groups_0e939a4f ON gymnastics_session_groups USING btree (group_id);


--
-- Name: gymnastics_session_groups_7fc8ef54; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_session_groups_7fc8ef54 ON gymnastics_session_groups USING btree (session_id);


--
-- Name: gymnastics_teamaward_groups_0763afb4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamaward_groups_0763afb4 ON gymnastics_teamaward_groups USING btree (teamaward_id);


--
-- Name: gymnastics_teamaward_groups_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamaward_groups_0e939a4f ON gymnastics_teamaward_groups USING btree (group_id);


--
-- Name: gymnastics_teamawardrank_11043aa6; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawardrank_11043aa6 ON gymnastics_teamawardrank USING btree (team_award_id);


--
-- Name: gymnastics_teamawardrank_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawardrank_f6a7ca40 ON gymnastics_teamawardrank USING btree (team_id);


--
-- Name: gymnastics_teamawards_groups_0e939a4f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawards_groups_0e939a4f ON gymnastics_teamawards_groups USING btree (group_id);


--
-- Name: gymnastics_teamawards_groups_342c934d; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawards_groups_342c934d ON gymnastics_teamawards_groups USING btree (teamawards_id);


--
-- Name: gymnastics_teamawards_teams_342c934d; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawards_teams_342c934d ON gymnastics_teamawards_teams USING btree (teamawards_id);


--
-- Name: gymnastics_teamawards_teams_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX gymnastics_teamawards_teams_f6a7ca40 ON gymnastics_teamawards_teams USING btree (team_id);


--
-- Name: registration_coach_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_coach_57413943 ON registration_coach USING btree (meet_id);


--
-- Name: registration_coach_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_coach_f6a7ca40 ON registration_coach USING btree (team_id);


--
-- Name: registration_gymnast_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_57413943 ON registration_gymnast USING btree (meet_id);


--
-- Name: registration_gymnast_80e0bd5f; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_80e0bd5f ON registration_gymnast USING btree (level_id);


--
-- Name: registration_gymnast_9ff3405c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_9ff3405c ON registration_gymnast USING btree (division_id);


--
-- Name: registration_gymnast_a199d76c; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_a199d76c ON registration_gymnast USING btree (shirt_id);


--
-- Name: registration_gymnast_bbc11087; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_bbc11087 ON registration_gymnast USING btree (starting_event_id);


--
-- Name: registration_gymnast_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnast_f6a7ca40 ON registration_gymnast USING btree (team_id);


--
-- Name: registration_gymnastpricing_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_gymnastpricing_57413943 ON registration_gymnastpricing USING btree (meet_id);


--
-- Name: registration_level_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_level_57413943 ON registration_level USING btree (meet_id);


--
-- Name: registration_levelpricing_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_levelpricing_57413943 ON registration_levelpricing USING btree (meet_id);


--
-- Name: registration_team_0596c34a; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_team_0596c34a ON registration_team USING btree (per_gymnast_cost_id);


--
-- Name: registration_team_57413943; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_team_57413943 ON registration_team USING btree (meet_id);


--
-- Name: registration_team_c74ea229; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_team_c74ea229 ON registration_team USING btree (per_level_cost_id);


--
-- Name: registration_team_level_awards_0763afb4; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_team_level_awards_0763afb4 ON registration_team_team_awards USING btree (teamaward_id);


--
-- Name: registration_team_level_awards_f6a7ca40; Type: INDEX; Schema: public; Owner: fairplay; Tablespace: 
--

CREATE INDEX registration_team_level_awards_f6a7ca40 ON registration_team_team_awards USING btree (team_id);


--
-- Name: D2d9fb7d6183205603281ea42e3fb644; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team
    ADD CONSTRAINT "D2d9fb7d6183205603281ea42e3fb644" FOREIGN KEY (per_level_cost_id) REFERENCES registration_levelpricing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D5edc2b373a7ecbc5164c44a47440089; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team
    ADD CONSTRAINT "D5edc2b373a7ecbc5164c44a47440089" FOREIGN KEY (per_gymnast_cost_id) REFERENCES registration_gymnastpricing(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_251a926a5b095dcf_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_251a926a5b095dcf_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_517bd90ff136fc91_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_517bd90ff136fc91_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_6a1aedd5e7a8cc98_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_6a1aedd5e7a8cc98_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_353621f9a56f98c0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_353621f9a56f98c0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_3869042d0080229b_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_3869042d0080229b_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_466a7c53304d3d14_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_466a7c53304d3d14_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_14664e676efa66a2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_14664e676efa66a2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: compe_team_award_id_f24c188ade69c0e_fk_competition_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamawardrank
    ADD CONSTRAINT compe_team_award_id_f24c188ade69c0e_fk_competition_teamaward_id FOREIGN KEY (team_award_id) REFERENCES competition_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: compe_teamaward_id_282ab6868bd6f50b_fk_competition_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_levels
    ADD CONSTRAINT compe_teamaward_id_282ab6868bd6f50b_fk_competition_teamaward_id FOREIGN KEY (teamaward_id) REFERENCES competition_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: compe_teamaward_id_72948ab44c5484a5_fk_competition_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_divisions
    ADD CONSTRAINT compe_teamaward_id_72948ab44c5484a5_fk_competition_teamaward_id FOREIGN KEY (teamaward_id) REFERENCES competition_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competi_division_id_21b143babbcbe418_fk_competition_division_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_session_divisions
    ADD CONSTRAINT competi_division_id_21b143babbcbe418_fk_competition_division_id FOREIGN KEY (division_id) REFERENCES competition_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competi_division_id_4aa05dcc200aaa2d_fk_competition_division_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_divisions
    ADD CONSTRAINT competi_division_id_4aa05dcc200aaa2d_fk_competition_division_id FOREIGN KEY (division_id) REFERENCES competition_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competit_led_show_id_2a0dbd4eadcda691_fk_competition_ledshow_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_ledshowmessage
    ADD CONSTRAINT competit_led_show_id_2a0dbd4eadcda691_fk_competition_ledshow_id FOREIGN KEY (led_show_id) REFERENCES competition_ledshow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competiti_gymnast_id_a98006c43a31d58_fk_registration_gymnast_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_athleteevent
    ADD CONSTRAINT competiti_gymnast_id_a98006c43a31d58_fk_registration_gymnast_id FOREIGN KEY (gymnast_id) REFERENCES registration_gymnast(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competiti_led_sign_id_e4edccee0581860_fk_competition_ledsign_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_ledshowmessage
    ADD CONSTRAINT competiti_led_sign_id_e4edccee0581860_fk_competition_ledsign_id FOREIGN KEY (led_sign_id) REFERENCES competition_ledsign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competiti_session_id_607fa95496b3d6b1_fk_competition_session_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_session_divisions
    ADD CONSTRAINT competiti_session_id_607fa95496b3d6b1_fk_competition_session_id FOREIGN KEY (session_id) REFERENCES competition_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition__level_id_591fc54590140e21_fk_registration_level_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_division
    ADD CONSTRAINT competition__level_id_591fc54590140e21_fk_registration_level_id FOREIGN KEY (level_id) REFERENCES registration_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition__sign_id_5308d02a072a2123_fk_competition_ledsign_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_event
    ADD CONSTRAINT competition__sign_id_5308d02a072a2123_fk_competition_ledsign_id FOREIGN KEY (sign_id) REFERENCES competition_ledsign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_a_event_id_59ce81fdbb52c15e_fk_competition_event_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_athleteevent
    ADD CONSTRAINT competition_a_event_id_59ce81fdbb52c15e_fk_competition_event_id FOREIGN KEY (event_id) REFERENCES competition_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_division_meet_id_5cb0b8fe548624aa_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_division
    ADD CONSTRAINT competition_division_meet_id_5cb0b8fe548624aa_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_event_meet_id_1b5eb1be617cce79_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_event
    ADD CONSTRAINT competition_event_meet_id_1b5eb1be617cce79_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_session_meet_id_592a51773f743639_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_session
    ADD CONSTRAINT competition_session_meet_id_592a51773f743639_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_t_level_id_2a55a41c366c887_fk_registration_level_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward_levels
    ADD CONSTRAINT competition_t_level_id_2a55a41c366c887_fk_registration_level_id FOREIGN KEY (level_id) REFERENCES registration_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_tea_team_id_fc6a630a35a6b04_fk_registration_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamawardrank
    ADD CONSTRAINT competition_tea_team_id_fc6a630a35a6b04_fk_registration_team_id FOREIGN KEY (team_id) REFERENCES registration_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_teamaward_meet_id_66de8f76dcf41a3e_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY competition_teamaward
    ADD CONSTRAINT competition_teamaward_meet_id_66de8f76dcf41a3e_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djang_content_type_id_c15841a83c86e8a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djang_content_type_id_c15841a83c86e8a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_16d28d56fe638851_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_16d28d56fe638851_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymn_teamawards_id_1a96b65abadc28b3_fk_gymnastics_teamawards_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_teams
    ADD CONSTRAINT gymn_teamawards_id_1a96b65abadc28b3_fk_gymnastics_teamawards_id FOREIGN KEY (teamawards_id) REFERENCES gymnastics_teamawards(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymn_teamawards_id_5753a37bcfe6aa9a_fk_gymnastics_teamawards_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_groups
    ADD CONSTRAINT gymn_teamawards_id_5753a37bcfe6aa9a_fk_gymnastics_teamawards_id FOREIGN KEY (teamawards_id) REFERENCES gymnastics_teamawards(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymna_starting_event_id_7f52c11682c3d1f0_fk_gymnastics_event_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymna_starting_event_id_7f52c11682c3d1f0_fk_gymnastics_event_id FOREIGN KEY (starting_event_id) REFERENCES gymnastics_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymna_team_award_id_2b5be0530ae01af7_fk_gymnastics_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawardrank
    ADD CONSTRAINT gymna_team_award_id_2b5be0530ae01af7_fk_gymnastics_teamaward_id FOREIGN KEY (team_award_id) REFERENCES gymnastics_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnas_teamaward_id_61fe94ad646346ea_fk_gymnastics_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamaward_groups
    ADD CONSTRAINT gymnas_teamaward_id_61fe94ad646346ea_fk_gymnastics_teamaward_id FOREIGN KEY (teamaward_id) REFERENCES gymnastics_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_ath_event_id_1a458a81dc9006c2_fk_gymnastics_event_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athleteevent
    ADD CONSTRAINT gymnastics_ath_event_id_1a458a81dc9006c2_fk_gymnastics_event_id FOREIGN KEY (event_id) REFERENCES gymnastics_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_ath_group_id_6fe6ea166f267729_fk_gymnastics_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymnastics_ath_group_id_6fe6ea166f267729_fk_gymnastics_group_id FOREIGN KEY (group_id) REFERENCES gymnastics_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_athle_team_id_31b2ff280aa6c84d_fk_gymnastics_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athlete
    ADD CONSTRAINT gymnastics_athle_team_id_31b2ff280aa6c84d_fk_gymnastics_team_id FOREIGN KEY (team_id) REFERENCES gymnastics_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_athlete_id_175c925096f62499_fk_gymnastics_athlete_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_athleteevent
    ADD CONSTRAINT gymnastics_athlete_id_175c925096f62499_fk_gymnastics_athlete_id FOREIGN KEY (athlete_id) REFERENCES gymnastics_athlete(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_ev_sign_id_303945d2622b85f2_fk_gymnastics_ledsign_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_event
    ADD CONSTRAINT gymnastics_ev_sign_id_303945d2622b85f2_fk_gymnastics_ledsign_id FOREIGN KEY (sign_id) REFERENCES gymnastics_ledsign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_ses_group_id_1cea550db0d031af_fk_gymnastics_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_session_groups
    ADD CONSTRAINT gymnastics_ses_group_id_1cea550db0d031af_fk_gymnastics_group_id FOREIGN KEY (group_id) REFERENCES gymnastics_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_session_id_720abb1ad7e10302_fk_gymnastics_session_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_session_groups
    ADD CONSTRAINT gymnastics_session_id_720abb1ad7e10302_fk_gymnastics_session_id FOREIGN KEY (session_id) REFERENCES gymnastics_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_tea_group_id_19a18f6add60c9e5_fk_gymnastics_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_groups
    ADD CONSTRAINT gymnastics_tea_group_id_19a18f6add60c9e5_fk_gymnastics_group_id FOREIGN KEY (group_id) REFERENCES gymnastics_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_tea_group_id_54379628c6785775_fk_gymnastics_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamaward_groups
    ADD CONSTRAINT gymnastics_tea_group_id_54379628c6785775_fk_gymnastics_group_id FOREIGN KEY (group_id) REFERENCES gymnastics_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_teama_team_id_275982647a9acf9c_fk_gymnastics_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawardrank
    ADD CONSTRAINT gymnastics_teama_team_id_275982647a9acf9c_fk_gymnastics_team_id FOREIGN KEY (team_id) REFERENCES gymnastics_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gymnastics_teama_team_id_74c95fa6e7d1f9bd_fk_gymnastics_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY gymnastics_teamawards_teams
    ADD CONSTRAINT gymnastics_teama_team_id_74c95fa6e7d1f9bd_fk_gymnastics_team_id FOREIGN KEY (team_id) REFERENCES gymnastics_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: regi_starting_event_id_692a4893cddc5ab8_fk_competition_event_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT regi_starting_event_id_692a4893cddc5ab8_fk_competition_event_id FOREIGN KEY (starting_event_id) REFERENCES competition_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: regis_teamaward_id_6a8c54a8895b5951_fk_competition_teamaward_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team_team_awards
    ADD CONSTRAINT regis_teamaward_id_6a8c54a8895b5951_fk_competition_teamaward_id FOREIGN KEY (teamaward_id) REFERENCES competition_teamaward(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registr_division_id_5ceb56d84a68ea54_fk_competition_division_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registr_division_id_5ceb56d84a68ea54_fk_competition_division_id FOREIGN KEY (division_id) REFERENCES competition_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registra_shirt_id_1150a9e6cf6f6e9c_fk_registration_shirtsize_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registra_shirt_id_1150a9e6cf6f6e9c_fk_registration_shirtsize_id FOREIGN KEY (shirt_id) REFERENCES registration_shirtsize(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_co_team_id_ff9acda6c42ce06_fk_registration_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_coach
    ADD CONSTRAINT registration_co_team_id_ff9acda6c42ce06_fk_registration_team_id FOREIGN KEY (team_id) REFERENCES registration_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_coach_meet_id_5b3b5749392da007_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_coach
    ADD CONSTRAINT registration_coach_meet_id_5b3b5749392da007_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_g_team_id_484edccddf45e9ae_fk_registration_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registration_g_team_id_484edccddf45e9ae_fk_registration_team_id FOREIGN KEY (team_id) REFERENCES registration_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_gymnast_meet_id_5b593943a0976008_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registration_gymnast_meet_id_5b593943a0976008_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_gymnastpr_meet_id_7b473f46ba2dd238_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnastpricing
    ADD CONSTRAINT registration_gymnastpr_meet_id_7b473f46ba2dd238_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_level_id_5e3be821e1ee54f1_fk_registration_level_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_gymnast
    ADD CONSTRAINT registration_level_id_5e3be821e1ee54f1_fk_registration_level_id FOREIGN KEY (level_id) REFERENCES registration_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_level_meet_id_79e26cf14dba7833_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_level
    ADD CONSTRAINT registration_level_meet_id_79e26cf14dba7833_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_levelpric_meet_id_115d7a881a305b69_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_levelpricing
    ADD CONSTRAINT registration_levelpric_meet_id_115d7a881a305b69_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_te_team_id_8c83035989929a5_fk_registration_team_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team_team_awards
    ADD CONSTRAINT registration_te_team_id_8c83035989929a5_fk_registration_team_id FOREIGN KEY (team_id) REFERENCES registration_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_team_meet_id_afd8addf4559835_fk_meet_meet_id; Type: FK CONSTRAINT; Schema: public; Owner: fairplay
--

ALTER TABLE ONLY registration_team
    ADD CONSTRAINT registration_team_meet_id_afd8addf4559835_fk_meet_meet_id FOREIGN KEY (meet_id) REFERENCES meet_meet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: bhall
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM bhall;
GRANT ALL ON SCHEMA public TO bhall;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

