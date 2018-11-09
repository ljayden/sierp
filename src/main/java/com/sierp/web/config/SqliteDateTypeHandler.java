package com.sierp.web.config;

import java.sql.Date;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class SqliteDateTypeHandler extends BaseTypeHandler<Date> {
	
	FastDateFormat formatter = FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss");
	
	@Override
	public void setNonNullParameter(PreparedStatement ps, int index, Date parameter, JdbcType jdbcType) throws SQLException {
		System.out.println("444444444444444");
		ps.setTimestamp(index, new Timestamp(parameter.getTime()));
	}

	@Override
	public Date getNullableResult(ResultSet rs, String columnName) throws SQLException {
		String sqlTimestamp = rs.getString(columnName);
		if (sqlTimestamp != null) {
			try {
				return new Date(formatter.parse(sqlTimestamp).getTime());
			} catch (Exception e) {
				throw new SQLException(e);
			}
		}
		return null;
	}

	@Override
	public Date getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		String sqlTimestamp = rs.getString(columnIndex);
	    if (sqlTimestamp != null) {
			try {
				return new Date(formatter.parse(sqlTimestamp).getTime());
			} catch (Exception e) {
				throw new SQLException(e);
			}
	    }
		return null;
	}

	@Override
	public Date getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String sqlTimestamp = cs.getString(columnIndex);
	    if (sqlTimestamp != null) {
			try {
				return new Date(formatter.parse(sqlTimestamp).getTime());
			} catch (Exception e) {
				throw new SQLException(e);
			}
	    }
		return null;
	}
}
