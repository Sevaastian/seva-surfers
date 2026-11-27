create table if not exists rs_scores (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 14),
  score int not null check (score between 0 and 5000000),
  dist int not null check (dist between 0 and 200000),
  char text, board text not null,
  created_at timestamptz default now()
);
create index on rs_scores (board, score desc);
alter table rs_scores enable row level security;
create policy "herkes okuyabilir" on rs_scores for select using (true);
create policy "herkes ekleyebilir" on rs_scores for insert with check (true);

-- Hayalet yarışı için (zaten tablo varsa bunu da çalıştır):
alter table rs_scores add column if not exists ghost text;
