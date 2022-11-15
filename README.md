# sqlite-es

> An SQLite implementation of the `PersistedEventRepository` trait in cqrs-es.

[![Build status](https://github.com/johnbcodes/sqlite-es/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/johnbcodes/sqlite-es/actions/workflows/ci.yml)
[![Crates.io](https://img.shields.io/crates/v/sqlite-es)](https://crates.io/crates/sqlite-es)
[![docs](https://img.shields.io/badge/API-docs-blue.svg)](https://docs.rs/sqlite-es)

---

## Usage
Add to your Cargo.toml file:

```toml
[dependencies]
cqrs-es = "0.4.5"
sqlite-es = "0.4.5"
```

A simple configuration example:
```
let store = default_sqlite_pool("sqlite://my.db");
let cqrs = sqlite_es::sqite_cqrs::<MyAggregate>(pool, vec![], ())
```

Things that could be helpful:
- [User guide](https://doc.rust-cqrs.org) along with an introduction to CQRS and event sourcing.
- [Demo application](https://github.com/johnbcodes/cqrs-es-demo-sqlite) using [axum](https://github.com/tokio-rs/axum) web application framework.


