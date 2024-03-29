<?xml version="1.0"?>
<project
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
	xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>com.frogsing</groupId>
		<artifactId>parent</artifactId>
		<version>erd1.0</version>
		<relativePath>../../parent/</relativePath>
	</parent>
	<artifactId>${pdm.code}-${pack()}</artifactId>
	<name>frogsing :: Module :: ${pdm.code}</name>
	<dependencies>

        <dependency>
            <groupId>com.frogsing</groupId>
            <artifactId>parameter-api</artifactId>
            <version>${"$"}{version}</version>
        </dependency>

		<#if pack()=="service" >
        <dependency>
            <groupId>com.frogsing</groupId>
            <artifactId>${pdm.code}-api</artifactId>
            <version>${"$"}{version}</version>
        </dependency>
		</#if>
        <dependency>
            <groupId>com.frogsing</groupId>
            <artifactId>heart</artifactId>
        </dependency>
		<!-- hibernate -->  
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-entitymanager</artifactId>

		</dependency>
		<!-- JSON begin -->
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-core</artifactId>

		</dependency>
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>

		</dependency>
		<dependency>
			<groupId>com.fasterxml.jackson.module</groupId>
			<artifactId>jackson-module-jaxb-annotations</artifactId>

		</dependency>
		<!-- JSON end -->
		<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-lang3</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.maven</groupId>
			<artifactId>maven-plugin-api</artifactId>
			<version>2.0</version>
		</dependency>


		<dependency>
			<groupId>org.eclipse.jetty</groupId>
			<artifactId>jetty-jsp</artifactId>
			<scope>runtime</scope>
			<optional>true</optional>
		</dependency>



		<dependency>
			<groupId>com.google.guava</groupId>
			<artifactId>guava</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
		</dependency>
		<dependency>
				<groupId>org.springframework.data</groupId>
				<artifactId>spring-data-jpa</artifactId>
		</dependency>
	</dependencies>
	<build>
		<finalName>jh-plugins</finalName>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-jar-plugin</artifactId>
				<configuration>
					<archive>
						<addMavenDescriptor>false</addMavenDescriptor>
					</archive>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
