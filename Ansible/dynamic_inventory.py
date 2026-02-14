#!/usr/bin/env python3
import json
import subprocess

result = subprocess.check_output(
    ["terraform", "output", "-json"],
    cwd="../Terraform"
)

data = json.loads(result)
ip = data["ec2_public_ip"]["value"]

inventory = {
    "web": {
        "hosts": [ip],
        "vars": {
            "ansible_user": "ec2-user",
            "ansible_ssh_private_key_file": "terraform-key.pem"
        }
    }
}

print(json.dumps(inventory))

