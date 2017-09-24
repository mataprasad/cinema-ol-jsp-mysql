package com.app.db;

import org.apache.commons.dbcp2.BasicDataSource;

public class DataSource {

	private static final int CONN_POOL_SIZE = 5;

	private BasicDataSource bds = new BasicDataSource();

	public DataSource(DbConfigHelper config) {
		// Set database driver name
		bds.setDriverClassName(config.getDriver());
		// Set database url
		bds.setUrl(config.getDbUrl());
		// Set database user
		bds.setUsername(config.getUserId());
		// Set database password
		bds.setPassword(config.getPassword());
		// Set the connection pool size
		bds.setInitialSize(CONN_POOL_SIZE);
	}

	public BasicDataSource getBds() {
		return bds;
	}

	public void setBds(BasicDataSource bds) {
		this.bds = bds;
	}
}
