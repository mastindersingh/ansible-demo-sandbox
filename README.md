# Ansible Demo Sandbox 🚀

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/mastinder/ansible-demo-sandbox)
[![Open in Codespaces](https://img.shields.io/badge/GitHub-Codespaces-black?logo=github)](https://codespaces.new/mastinder/ansible-demo-sandbox?quickstart=1)

Run a real Ansible project, **entirely in your browser**, using GitHub Codespaces or Gitpod.  
Two Docker containers (`web1`, `web2`) act as your target “servers”, so you can safely run playbooks end-to-end.

---

## 🎞 Visualizing Ansible: From Config → Inventory → Roles → Targets

![Ansible Project Map](assets/ansible_project_map.gif)

I created an **animated, color-coded map** of an Ansible project to make its structure easier to follow for both beginners and experienced SRE/DevOps engineers.

### 🔑 What it shows
- **ansible.cfg** → project-wide defaults (SSH, privilege escalation, paths)  
- **Inventory (hosts.ini / yml)** → the “address book” of your servers and groups  
- **group_vars / host_vars** → variables at the group or host level  
- **Playbooks (site.yml)** → high-level “recipes”: which hosts get which roles  
- **Roles** → reusable building blocks (tasks, handlers, templates, files, defaults, vars, meta)  
- **Vault** → encrypted secrets (API keys, passwords)  
- **Targets** → the actual servers, containers, or cloud instances where automation runs  

### 🎯 Why this matters
A well-structured project makes automation:
- Easier to **scale** across environments (dev, test, prod)  
- Easier to **secure** (with vaults)  
- Easier to **collaborate** (roles are shareable)  
- Easier to **debug** (clear separation of responsibilities)  

💡 The animation walks through each step — highlighting one piece at a time — so you can **see the flow of automation** from config to the final targets.

---

## 🚀 Quick Start

### ▶️ Run in GitHub Codespaces
1. Click **Open in Codespaces** (button above).
2. If you see errors about Ansible not finding your config or failing to create temp directories, check:
   - The workspace directory is **not world-writable**. Run: `chmod o-w .`
   - The `ansible.cfg` file contains:
     ```ini
     [defaults]
     remote_tmp = /tmp/.ansible/tmp
     ```
3. If you see errors about missing containers (`No such container: web1`), start them with:
   ```bash
   docker run -d --name web1 python:3 sleep infinity
   docker run -d --name web2 python:3 sleep infinity
   ```
   This will create two test containers for Ansible to target.
4. Then run:
   ```bash
   make ping     # or: ansible -i inventory.ini web -m ping -vv
   make play     # or: ansible-playbook -i inventory.ini site.yml -vv
   ```
   > If a module needs Python inside the containers, run:
   > ```bash
   > INSTALL_PYTHON_IN_CONTAINERS=1 bash scripts/start_lab.sh
   > ```
2. When the dev container finishes building:
   ```bash
   bash scripts/start_lab.sh
   make ping     # or: ansible -i inventory.ini web -m ping -vv
   make play     # or: ansible-playbook -i inventory.ini site.yml -vv
   ```
   > If a module needs Python inside the containers, run:
   > ```bash
   > INSTALL_PYTHON_IN_CONTAINERS=1 bash scripts/start_lab.sh
   > ```

### ▶️ Run in Gitpod
1. Click **Open in Gitpod** (button above).  
2. Gitpod will install Ansible, start Docker, and boot the two containers automatically.  
3. Then run:
   ```bash
   make ping
   make play
   ```

---

## 📂 Project Structure
```
.
├─ .devcontainer/
│  ├─ devcontainer.json
│  └─ docker-compose.yml
├─ .gitpod.yml / .gitpod.Dockerfile
├─ ansible.cfg
├─ inventory.ini
├─ requirements.yml
├─ scripts/start_lab.sh
├─ site.yml
├─ Makefile
└─ assets/
   └─ ansible_project_map.gif   # (add your animation here)
```

---

## 🙌 Credits
Created by **Mastinder Singh** — Demo to make Ansible structure easier to learn and teach.
