-- CasaPlan v56: inventario doméstico conectado con la compra
-- Ejecutar completo en Supabase SQL Editor. Es repetible y no borra datos.

create extension if not exists pgcrypto;

create table if not exists public.household_inventory (
  id uuid primary key default gen_random_uuid(),
  family_id uuid not null references public.families(id) on delete cascade,
  name text not null,
  category text not null default 'limpieza',
  shopping_category text not null default 'limpieza',
  quantity numeric not null default 0 check (quantity >= 0),
  unit text not null default 'uds',
  reorder_level numeric not null default 1 check (reorder_level >= 0),
  restock_quantity numeric not null default 1 check (restock_quantity > 0),
  store text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists household_inventory_family_name_uq
  on public.household_inventory (family_id, lower(name));
create index if not exists household_inventory_family_idx
  on public.household_inventory (family_id);

alter table public.shopping_items
  add column if not exists inventory_id uuid references public.household_inventory(id) on delete set null;
alter table public.shopping_items
  add column if not exists inventory_restocked boolean not null default false;
create index if not exists shopping_items_inventory_idx
  on public.shopping_items (inventory_id);

alter table public.household_inventory enable row level security;

drop policy if exists household_inventory_select on public.household_inventory;
create policy household_inventory_select on public.household_inventory for select to anon, authenticated using (true);
drop policy if exists household_inventory_insert on public.household_inventory;
create policy household_inventory_insert on public.household_inventory for insert to anon, authenticated with check (true);
drop policy if exists household_inventory_update on public.household_inventory;
create policy household_inventory_update on public.household_inventory for update to anon, authenticated using (true) with check (true);
drop policy if exists household_inventory_delete on public.household_inventory;
create policy household_inventory_delete on public.household_inventory for delete to anon, authenticated using (true);

do $$
begin
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='household_inventory') then
    alter publication supabase_realtime add table public.household_inventory;
  end if;
end $$;

notify pgrst, 'reload schema';
