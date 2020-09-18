require('dbms').init(CONF[`${CONF.env}.database`], ERROR('DBMS'));
