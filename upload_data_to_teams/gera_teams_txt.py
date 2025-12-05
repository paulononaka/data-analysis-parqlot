import json
from pathlib import Path

# caminhos de entrada e saída
input_path = Path(__file__).parent / "teams_normalized.json"
output_path = Path(__file__).parent / "teams_normalized.txt"

def main():
    # lê o json
    with input_path.open("r", encoding="utf-8") as f:
        data = json.load(f)

    teams = data.get("teams", [])

    with output_path.open("w", encoding="utf-8") as out:
        for t in teams:
            team_id = t.get("id")
            team_name = t.get("team", "")
            # escreve no formato pedido
            line = f'"id": {team_id}, "team": "{team_name}"\n'
            out.write(line)

    print(f"✓ Arquivo gerado: {output_path}")
    print(f"✓ Total de times processados: {len(teams)}")

if __name__ == "__main__":
    main()
