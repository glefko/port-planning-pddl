# Port Planning (PDDL)

Artificial Intelligence — Action Planning Assignment

---

## 🎯 Objective

Investigate and model a **port logistics** planning problem using **PDDL (Planning Domain Definition Language)**. The work includes:
- An **analysis of the problem family (domain)** for ports and of a specific **problem instance**.
- A **PDDL domain** and a **PDDL problem** encoding for the instance.

---

## 🧩 Problem Description

We consider a port with multiple **docks**. At each dock there are **stacks of containers**.

**Capabilities & constraints**
- Each dock can host an **unbounded number of stacks**.
- Docks are connected via **bidirectional roads** so that **trucks (robots)** can move between them.
- Each truck has an **integrated crane** and can:
  - pick up a container,
  - load/unload a container (truck capacity = **1 container**),
  - place a container **on top of another** container, or
  - start a **new stack**.
- **At most one truck** may occupy a dock **at any given time**.

---

## 🔎 Specific Instance

- **Docks:** `d1`, `d2`, `d3`  
- **Containers:** `c1`, `c2`, `c3`  
- **Truck:** `r1`  
- **Roads (bidirectional):**  
  - `d1` ↔ `d3`  
  - `d2` ↔ `d1`

**Initial state**
- At `d1`: one stack of **two** containers (**top→bottom:** `c1` on `c3`).  
- At `d2`: one stack of **one** container (`c2`).  
- Truck `r1` is **at `d2`**.

**Goal state**
- Truck `r1` is **at `d1`**.  
- At `d3`: **two stacks** exist:
  - a **single-container** stack with `c3`,
  - a **two-container** stack (**top→bottom:** `c2` on `c1`).

---

## ✅ Tasks

**A. Domain & Problem Family Analysis**  
Describe the **port domain** (objects, predicates, actions, and constraints) and analyze the **given instance** above.

**B. PDDL Encodings**  
Provide:
- the **PDDL domain** file capturing the general port problem (docks, roads, trucks, containers, stacking/loading/moving constraints), and  
- the **PDDL problem** file for the specific instance (objects, initial state, and goals).
