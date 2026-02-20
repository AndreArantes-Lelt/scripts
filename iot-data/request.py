import requests, json, random, subprocess
from datetime import datetime, timezone
from time import sleep

TENANT = "4efbe1b0-59e4-4cb6-9679-ab52367f52a8"

CAUSES = ["BATTERY", "LIGHT", "TEMPERATURE", "MOVEMENT"]
STATUS = ["ACTIVE", "INACTIVE", "ALARMED", "SILENCED"]


def Main():
    try:
        status = STATUS[int(input(f"Select a status:\n{STATUS}\n")) - 1]

        while True:
            timestamp = datetime.now(timezone.utc).isoformat()
            r = random.randint(0, 4)

            reasons = []
            for _ in range(r):
                cause = random.choice(CAUSES)
                if cause.upper() not in reasons:
                    reasons.append(cause.upper())

            print(f"Populating data...\nCauses: {reasons}\nStatus: {status}")

            payload = {
                "timestamp": timestamp,
                "tenantId": TENANT,
                "reasons": reasons,
                "status": status,
                "device": {
                    "id": "227038a7-439b-45e7-949b-cbc312daf0ac",
                    "description": "IoTName",
                    "identificator_in_network": "DSJHWF3245",
                    "project": "80829662-37d4-4001-b8f7-b1a8ba85c4fe",
                    "project_name": "Projetin",
                },
            }

            data = {
                "type": "http",
                "message": json.dumps(payload),
            }
            r = requests.post("http://localhost:5100/api/iot-alarms", json=data)

            Status(r)
            sleep(3)
            subprocess.run("clear")

    except KeyboardInterrupt:
        print(f"\nStopping...")


def Status(r: requests.Response):
    code = r.status_code

    if code == 204:
        print(f"{code}: No Content")
    else:
        print(f"Error: {code}\n{r.text}")
        sleep(2)


if __name__ == "__main__":
    Main()
