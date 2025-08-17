# 🛡️ PhishGuard: Interactive Phishing Defense Training Tool

PhishGuard is a CLI-based cybersecurity awareness toolkit built using Bash scripting.
It simulates real-world phishing attacks (emails, fake websites, and social engineering)
to help users practice spotting red flags and improve their cyber defense skills.

—

## 🚀 Features
• Email Analysis Module → Simulated phishing emails with spoofed domains and fake links.
• Website Inspection Module → SSL certificate inspection and suspicious domain detection.
• Social Engineering Simulation → Interactive attacker chat/phone call scenarios.
• Quiz Mode → Random phishing challenges with scoring & feedback.
• Performance Tracking → Scores saved to local CSV logs for review.

—

## 🏗️ Implementation
• Built entirely in Bash scripting (no external APIs).
• Simulates phishing scenarios in a controlled lab environment.
• Optional Python helper (Faker) to generate realistic fake emails.
• Tested on Kali Linux and Ubuntu.

—

## 👩‍💻 Team Contributions
• Fiza Iman (https://github.com/f1za1man) → Website Inspection Module 🌐 (SSL checks, fake website analysis)
• Eman Hamayoun → Email Analysis Module 📧 (phishing emails & header inspection)
• Marwah Ghazanfar (https://github.com/MarwahGhazanfar) → Quiz Module 📝 (random phishing quiz with scoring)

—

## 📂 Project Structure
PhishGuard/
│── phishguard.sh              — Main menu script (entry point)
│── modules/                   — Modules folder
│    ├── email_analysis.sh     — Email analysis (Eman)
│    ├── website_inspection.sh — Website inspection (Fiza)
│    ├── social_engineering.sh — Social engineering simulation
│    ├── quiz.sh               — Quiz (Marwah)
│    └── email_gen.py          — Optional Python email generator
│── lib/
│    └── scoring.sh            — Scoring system (used by all modules)
│── logs/                      — Empty initially, stores user scores
│── requirements.txt           — Python dependencies
│── README.md                  — This file
│── LICENSE                    — Open-source license

—

## 📜 How to Run
1) Clone the repository
   git clone https://github.com/<your-username>/PhishGuard.git
   cd PhishGuard

2) Make the main script executable
   chmod +x phishguard.sh

3) Run the tool
   ./phishguard.sh

—

## 🎯 Objectives
1. Train users to identify phishing emails, fake websites, and SE attacks.
2. Provide an interactive learning environment with real-life scenarios.
3. Enhance cybersecurity awareness through gamified practice.

—

## ⚠️ Disclaimer
This project is for educational purposes only.
—

