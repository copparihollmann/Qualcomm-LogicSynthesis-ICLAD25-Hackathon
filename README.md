# 📌  Qualcomm AES Debugging Problem

## 📁 Navigate to Problem Directory

```bash
cd ~/iclad_hackathon/ICLAD-Hackathon-2025/problem-categories/Qualcomm-Problems
```

## 📦 Directory Structure

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

## 🧠 Objective

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

