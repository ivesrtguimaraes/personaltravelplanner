-- Execute uma vez no SQL Editor do seu projeto. Nenhum dado pessoal deve ser inserido aqui.
create table if not exists public.planner_snapshots (
 user_id uuid primary key references auth.users(id) on delete cascade,
 revision bigint not null check (revision >= 1),
 payload jsonb not null check (jsonb_typeof(payload) = 'object')
);
alter table public.planner_snapshots enable row level security;
revoke all on public.planner_snapshots from anon, authenticated;
grant select, insert, update on public.planner_snapshots to authenticated;
drop policy if exists planner_read on public.planner_snapshots;
drop policy if exists planner_insert on public.planner_snapshots;
drop policy if exists planner_update on public.planner_snapshots;
create policy planner_read on public.planner_snapshots for select to authenticated using ((select auth.uid()) = user_id);
create policy planner_insert on public.planner_snapshots for insert to authenticated with check ((select auth.uid()) = user_id);
create policy planner_update on public.planner_snapshots for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
