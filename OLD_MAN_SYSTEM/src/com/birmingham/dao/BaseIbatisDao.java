/**
 * ibatis 基本操作方法
 * @author YQL
 */
package com.birmingham.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapExecutor;

public class BaseIbatisDao extends SqlMapClientDaoSupport implements IbatisDao {

	private Logger logger = Logger.getLogger(this.getClass());

	
	public Object insert(String statementName, Object paramMap) {
		logger.debug("ibatis insert " + statementName);
		logger.debug("ibatis insert paramMap" + paramMap);
		return getSqlMapClientTemplate().insert(statementName, paramMap);
	}

	
	public boolean update(String statementName, Object paramMap) {
		logger.debug("ibatis update " + statementName);
		logger.debug("ibatis update paramMap" + paramMap);
		return this.getSqlMapClientTemplate().update(statementName, paramMap) > 0;
	}

	
	public boolean delete(String statementName, Object paramMap) {
		logger.debug("ibatis delete " + statementName);
		logger.debug("ibatis delete paramMap" + paramMap);
		return getSqlMapClientTemplate().delete(statementName, paramMap) > 0;
	}

	
	public Object load(String statementName, Object paramMap) {
		logger.debug("ibatis load " + statementName);
		return getSqlMapClientTemplate().queryForObject(statementName, paramMap);
	}

	
	public Map queryForMap(String statementName, Object paramMap) {
		logger.debug("ibatis load " + statementName);
		logger.debug("ibatis load paramMap" + paramMap);
		return (Map) load(statementName, paramMap);
	}

	
	public int queryForInt(String statementName, Object paramMap) {
		Integer rst = (Integer) load(statementName, paramMap);
		return rst == null ? 0 : rst.intValue();
	}

	
	public String queryForStr(String statementName, Object paramMap) {
		return (String) load(statementName, paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public List findList(String statementName, Object paramObj) {
		return this.getSqlMapClientTemplate().queryForList(statementName,paramObj);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean batch4Update(final String statementName, final List datas) {
		getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				for (Iterator iter = datas.iterator(); iter.hasNext();) {
					Map data = (Map) iter.next();
					executor.insert(statementName, data);
				}
				executor.executeBatch();
				return null;
			}
		});
		return true;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean batch4Update(final List<String> statementNames, final Map map) {
		getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				for (String statementName : statementNames) {
					executor.update(statementName, map);
				}
				executor.executeBatch();
				return null;
			}
		});
		return true;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean batch4Update(final String statementName, final List datas,
			final int batchSize) {
		getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
			public Object doInSqlMapClient(SqlMapExecutor executor)
					throws SQLException {
				executor.startBatch();
				int batch = 0;
				for (Iterator iter = datas.iterator(); iter.hasNext();) {
					Map data = (Map) iter.next();
					executor.insert(statementName, data);
					batch++;
					if (batch > batchSize) {
						batch = 0;
						executor.executeBatch();
					}
				}
				if (batch > 0)
					executor.executeBatch();
				return null;
			}
		});
		return true;
	}

}
