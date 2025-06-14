# 🚀 ICLAD Hackathon 2025 — SLM Laptop Setup & Submission Guide

Welcome to the **SLM (Small Language Model)** category of the ICLAD Hackathon 2025. This guide walks you through everything—from setting up your pre-configured laptop environment to understanding and evaluating the **Qualcomm AES Debugging Challenge**.

---

## 🧑‍💻 1. Login and Access Instructions

### ✅ System Credentials

- **Username**: `gmrd01`
- **Password**: `gmrd01`

### 💻 Launch Ubuntu via Windows Subsystem for Linux (WSL)

Open PowerShell and execute:

```bash
wsl --list
wsl -d Ubuntu-22.04
```

> 🧠 *Ubuntu-22.04 contains all necessary EDA tools pre-installed.*

---

## 📂 2. Folder Structure After Login

```plaintext
~/miniconda3/
~/iclad_hackathon/
```

### 📦 Clone the Hackathon Repository

```bash
cd ~/iclad_hackathon
git clone https://github.com/ICLAD-Hackathon/ICLAD-Hackathon-2025.git
```

---

## 🛠️ 3. EDA Tool Setup & Verification

All tools below are **pre-installed** in the Ubuntu image:

### ⚡ OpenROAD Flow

```bash
cd ~/iclad_hackathon/tools/OpenROAD-flow-scripts
source env.sh
cd flow/
make
```

> ✅ Look for successful GDSII generation as confirmation.

### 📘 Icarus Verilog (Simulation)

```bash
cd ~/iclad_hackathon/tools/iverilog_test
iverilog -o hello hello.v
vvp hello
```

Expected output:

```text
Hello, World!
```

### 📊 GTKWave (Waveform Viewer)

To view generated `.vcd` files:

```bash
gtkwave dump.vcd
```

---

## 📌 4. Qualcomm AES Debugging Problem

### 📁 Navigate to Problem Directory

```bash
cd ~/iclad_hackathon/ICLAD-Hackathon-2025/problem-categories/Qualcomm-Problems
```

### 📦 Directory Structure

```plaintext
.
├── buggy_netlist/
│   └── aes_bug_v1/
├── buggy_rtl/
│   ├── aes_bug_v1/
│   └── team_01/
│       ├── aes_bug_v2/
├── golden_rtl/
│   └── aes/
├── patched_netlist/
│   └── team_01/
├── tb/
│   ├── buggy_v1/
│   └── golden/
```

### 🧠 Objective

Reverse-engineer the **buggy RTL** from the **synthesized netlist**, using the **golden RTL** as a reference.

You’ll be evaluated on whether your reconstructed RTL passes the original testbench designed for the buggy version.

---

## 🧪 5. Running Testbenches

### 🔬 Golden RTL Test

```bash
cd tb/golden
iverilog -o golden_test tb_aes_cipher_top.v ../../golden_rtl/*.v
vvp golden_test
```

### 🐞 Buggy RTL Test

Place your generated RTL inside `buggy_rtl/team_name/`.

```bash
cd tb/buggy_v1
iverilog -o buggy_test tb_aes_cipher_top.v ../../buggy_rtl/team_name/*.v
vvp buggy_test
```

---

## 🎯 6. Waveform Inspection (Optional but Recommended)

```bash
gtkwave dump.vcd
```

Use this to debug signal mismatches and better understand faulty behavior.

---

## 📨 7. Submission Guidelines for SLM Category

- Submit your solution as a ZIP file: `team_name.zip`
- On unzipping, it should contain:
  ```plaintext
  ICLAD-Hackathon-2025/
    └── problem-categories/
        └── Qualcomm-Problems/
            ├── buggy_rtl/
            │   └── team_name/
            ├── patched_netlist/
            │   └── team_name/
            └── logs/
                └── team_name/   <- Chat logs, code, notes
  ```

> 💡 Include your LLM prompt logs and intermediate explorations for extra credit!

---

## 🤝 FAQ & Other Tracks

- For **ASU-ICLAD** and **Google** tracks, create:
  - `submission/<team_name>/problemK/`
  - `logs/<team_name>/`

Refer to the official Hackathon repo and slides for more details.

---

## 🖼️ Snapshot Diagrams (For PPT/Docs)

> Add the following diagrams to presentations:

- Workflow for EDA tool invocation
- Agentic/Non-agentic approaches used to interact with SLMs and corresponding logs.


---

Happy Chipping! 💻🔍🧠

