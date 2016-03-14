name := """play-spring-data-jpa"""

version := "1.0-SNAPSHOT"

playJavaSettings

ebeanEnabled := false

libraryDependencies ++= Seq(
    javaCore,
    javaJpa,
    "org.springframework" % "spring-context" % "4.2.5.RELEASE",
    "javax.inject" % "javax.inject" % "1",
    "org.springframework.data" % "spring-data-jpa" % "1.9.4.RELEASE",
    "org.springframework" % "spring-expression" % "4.2.5.RELEASE",
    "org.hibernate" % "hibernate-entitymanager" % "5.1.0.Final",
    "org.mockito" % "mockito-core" % "1.9.5" % "test",
    "mysql" % "mysql-connector-java" % "5.1.18"
)

//fork in run := true

EclipseKeys.preTasks := Seq(compile in Compile)

EclipseKeys.projectFlavor := EclipseProjectFlavor.Java

EclipseKeys.createSrc := EclipseCreateSrc.Default + EclipseCreateSrc.Resource
