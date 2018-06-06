Create Base Tables:
  mysql_query.run:
    - database: foo
    - query: "create table pillar (pillar_id integer not null,minion_id varchar(30) not null,pillar varchar(30) not null,value varchar(30) not null,constraint pk_pillar primary key (pillar_id));"
