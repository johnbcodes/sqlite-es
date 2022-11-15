-- a single table is used for all events in the cqrs system
CREATE TABLE events
(
  aggregate_type text                          NOT NULL,
  aggregate_id   text                          NOT NULL,
  sequence       integer CHECK (sequence >= 0) NOT NULL,
  event_type     text                          NOT NULL,
  event_version  text                          NOT NULL,
  payload        text                          NOT NULL,
  metadata       text                          NOT NULL,
  PRIMARY KEY (aggregate_type, aggregate_id, sequence)
) STRICT;

-- this table is only needed if snapshotting is employed
CREATE TABLE snapshots
(
  aggregate_type   text                                  NOT NULL,
  aggregate_id     text                                  NOT NULL,
  last_sequence    integer CHECK (last_sequence >= 0)    NOT NULL,
  current_snapshot integer CHECK (current_snapshot >= 0) NOT NULL,
  payload          text                                  NOT NULL,
  PRIMARY KEY (aggregate_type, aggregate_id, last_sequence)
) STRICT;

-- one view table should be created for every `SqliteViewRepository` used
-- replace name with the value used in `SqliteViewRepository::new(view_name: String)`
CREATE TABLE test_view
(
  view_id text                         NOT NULL,
  version integer CHECK (version >= 0) NOT NULL,
  payload text                         NOT NULL,
  PRIMARY KEY (view_id)
) STRICT;

INSERT INTO events (aggregate_type, aggregate_id, sequence, event_type, event_version, payload, metadata)
VALUES ('Customer', 'previous_event_in_need_of_upcast', 1, 'NameAdded', '1.0', '{"NameAdded": {}}', '{}');
