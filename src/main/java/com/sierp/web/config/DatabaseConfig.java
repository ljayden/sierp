package com.sierp.web.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 */
@Configuration
@EnableTransactionManagement(mode = AdviceMode.PROXY, order = 0)
@ComponentScan(basePackages = {"com.sierp.web.**.dao"}, 
	includeFilters = @Filter(value = {Repository.class}), 
	useDefaultFilters = false
)
@MapperScan(basePackages = {"com.sierp.web.**.dao"}, sqlSessionTemplateRef = "sqlSession", annotationClass = Repository.class)
public class DatabaseConfig {

	
	@Bean(destroyMethod = "shutdown")
	public HikariDataSource hikariDataSource() {
		HikariConfig config = new HikariConfig();
		config.setMinimumIdle(10);
		config.setMaximumPoolSize(10);
		
		config.setConnectionTimeout(300000); 
		config.setConnectionTestQuery("SELECT 1 FROM dual");
		
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "50");
		config.addDataSourceProperty("useServerPrepStmts", "true");
		
		config.setDriverClassName("org.sqlite.JDBC");
		
		config.addDataSourceProperty("user", "");
		config.addDataSourceProperty("password", "");
		config.setJdbcUrl("jdbc:sqlite:D:\\workspace-study\\sierp\\db.db3");
		
		HikariDataSource hds = new HikariDataSource(config);
		
		return hds;
    }
	
    @Bean
    public DataSource dataSource(HikariDataSource hikariDataSource) {
    	return new LazyConnectionDataSourceProxy(hikariDataSource);
    }


   @Bean
   public DataSourceTransactionManager membershipTransactionManager(DataSource dataSource) {
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager(dataSource);
        return dataSourceTransactionManager;
   }

   @Bean
   public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
	   SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
	   sqlSessionFactory.setDataSource(dataSource);
	   PathMatchingResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();

	   sqlSessionFactory.setConfigLocation(resourcePatternResolver.getResource("classpath:mybatis-config.xml"));
	   sqlSessionFactory.setMapperLocations(resourcePatternResolver.getResources("classpath*:mapper/**/*.xml"));

	   TypeHandlerRegistry typeHandlerRegistry = sqlSessionFactory.getObject().getConfiguration().getTypeHandlerRegistry();
	   typeHandlerRegistry.register(java.sql.Timestamp.class, org.apache.ibatis.type.DateTypeHandler.class);
	   typeHandlerRegistry.register(java.sql.Time.class, org.apache.ibatis.type.DateTypeHandler.class);
	   typeHandlerRegistry.register(java.sql.Date.class, org.apache.ibatis.type.DateTypeHandler.class);
	   return sqlSessionFactory.getObject();
   }
   



   @Bean(destroyMethod = "clearCache")
   public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
	   SqlSessionTemplate sessionTemplate = new SqlSessionTemplate(sqlSessionFactory);
	   return sessionTemplate;
   }
}
