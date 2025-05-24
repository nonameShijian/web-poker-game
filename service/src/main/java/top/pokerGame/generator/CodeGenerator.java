package top.pokergame.generator;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;
import com.baomidou.mybatisplus.generator.query.SQLQuery;
import org.apache.ibatis.type.JdbcType;

import java.nio.file.Paths;

public class CodeGenerator {
    public static final String ip = "localhost";
    public static final String port = "3306";
    public static final String dataBase = "pokergamedb";
    public static final String userName = "root";
    public static final String passWord = "123456";
    public static final String packageName = "top.pokergame";
    // 表名
    public static final String[] tableNames = new String[] {  };

    public static void main(String[] args) {
        FastAutoGenerator.create("jdbc:mysql://" + ip + ":" + port + "/" + dataBase + "?remarks=true&useInformationSchema=true&tinyInt1isBit=true", userName, passWord)
                .globalConfig(builder -> builder
                        .author("Song")
                        .outputDir(Paths.get(System.getProperty("user.dir")) + "/src/main/java")
                        .commentDate("yyyy-MM-dd")
                        .disableOpenDir()
                )
                .dataSourceConfig(builder ->
                        builder.databaseQueryClass(SQLQuery.class)
                                .typeConvert(new MySqlTypeConvert())
                                .dbQuery(new MySqlQuery())
                                .typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
                                    // 兼容旧版本转换成Integer
                                    if (JdbcType.TINYINT == metaInfo.getJdbcType()) {
                                        return DbColumnType.INTEGER;
                                    }
                                    return typeRegistry.getColumnType(metaInfo);
                                })
                )
                .packageConfig(builder -> builder
                        .parent(packageName)
                        .entity("entity")
                        .mapper("mapper")
                        .service("service")
                        .serviceImpl("service.impl")
                        .xml("mapper.xml")
                )
                // 模板配置
//                .templateConfig(builder -> builder
//                        .controller("/templates/controller.java")
//                        .entity("/templates/entity.java")
//                        .service("/templates/service.java")
//                        .serviceImpl("/templates/serviceImpl.java")
//                        .mapper("/templates/mapper.java")
//                )
                // 策略配置
                .strategyConfig(builder -> builder
                                // 指定表名，用逗号分隔
                                // .addInclude(tableNames)
                                // 先开启 Controller 配置
                                .controllerBuilder()
                                // 开启生成 @RestController 控制器
                                .enableRestStyle()
                                // 开启驼峰转连字符
                                .enableHyphenStyle()
                                // 先开启 Entity 配置
                                .entityBuilder()
                                // 开启主键自增
                                .idType(IdType.AUTO)
                                // 数据库表映射到实体的命名策略，驼峰命名
                                .naming(NamingStrategy.underline_to_camel)
                                // 数据库表字段映射到实体的命名策略，驼峰命名
                                .columnNaming(NamingStrategy.underline_to_camel)
                                // 开启生成实体时生成字段注解
                                .enableTableFieldAnnotation()
                                .enableLombok()
                        // 模版配置
//                         .enableFileOverride()
//                         .javaTemplate("/templates/entity.java") // 设置实体类模板
//                         .disable() // 禁用实体类生成
//                         .serviceBuilder()
//                         .disableService() // 禁用 Service 层生成
//                         .serviceTemplate("/templates/service.java") // 设置 Service 模板
//                         .serviceImplTemplate("/templates/serviceImpl.java") // 设置 ServiceImpl 模板
                )
                .templateEngine(new VelocityTemplateEngine())
                .execute();
    }
}

