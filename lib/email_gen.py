#!/usr/bin/env python3
from faker import Faker
fake = Faker()

subject = fake.catch_phrase()
sender = fake.email()
link = fake.url()

print(f"Subject: {subject}")
print(f"From: {sender}")
print(f"Link: {link}")
