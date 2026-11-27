#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

set -e

sql_escape() {
  local value=$1
  value=${value//\'/\'\'}
  printf '%s' "$value"
}

while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  winner_sql=$(sql_escape "$winner")
  opponent_sql=$(sql_escape "$opponent")
  round_sql=$(sql_escape "$round")

  $PSQL "INSERT INTO teams(name) VALUES ('$winner_sql') ON CONFLICT (name) DO NOTHING"
  $PSQL "INSERT INTO teams(name) VALUES ('$opponent_sql') ON CONFLICT (name) DO NOTHING"

  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner_sql'")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent_sql'")

  $PSQL "INSERT INTO games(winner_id, opponent_id, year, round, winner_goals, opponent_goals)
    SELECT $winner_id, $opponent_id, $year, '$round_sql', $winner_goals, $opponent_goals
    WHERE NOT EXISTS (
      SELECT 1 FROM games
      WHERE winner_id = $winner_id
        AND opponent_id = $opponent_id
        AND year = $year
        AND round = '$round_sql'
        AND winner_goals = $winner_goals
        AND opponent_goals = $opponent_goals
    )"
done < <(tail -n +2 games.csv)
