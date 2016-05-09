package com.gyanpedia.dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.gyanpedia.model.User;
import com.gyanpedia.util.GyanpediaException;

public class BaseDao {
	private static final String DB_DRIVER="com.mysql.jdbc.Driver";
	private static final String DB_URL="jdbc:MySql://localhost:3306/gyanpedia";
	private static final String DB_USER="root";
	private static final String DB_PASSWORD="admin";
	
	public Connection getConnection() throws GyanpediaException{
		Connection connection = null;
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			throw new GyanpediaException("Error occured while connecting with databes"+e);
		}
		try {
			connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (SQLException e) {
			throw new GyanpediaException("Error occured while connecting with databes"+e);
		}
		return connection;
	}
	
	public PreparedStatement getPrepardeStattement(Connection connection, String sqlQuery) throws GyanpediaException{
		PreparedStatement preparedStatement; 
		try {
			preparedStatement=connection.prepareStatement(sqlQuery);
		} catch (SQLException e) {
			throw new GyanpediaException("Error occured while crating prepared statment "+e);
		}
		return preparedStatement;
	}
	
	protected void closeConnection(Connection connection) {
		if(connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				connection = null;
			}
		}
	}

	protected void closePreparedStatement(PreparedStatement preparedStatement) {
		if(preparedStatement != null){
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				preparedStatement = null;
			}
		}
	}

	protected void closeResultset(ResultSet resultSet) {
		if(resultSet != null){
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				resultSet = null;
			}
		}
	}
	
	protected User populateBean(ResultSet resultSet, Class<User> classType) {
		try {
			ResultSetMetaData metaData = resultSet.getMetaData();	
			Field[] declaredFields = classType.getDeclaredFields();
			for (int i = 0; i < declaredFields.length; i++) {
				Field field = declaredFields[i];
				if(!field.isAccessible()){
					field.setAccessible(true);
				}
				try {
					field.set(resultSet.getObject(field.getName()), classType);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
