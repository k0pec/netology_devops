# 9.2 CI/CD
## HomeWork

***Task 1***  
### Sonarqube  
```bash
        k0pec@k0pec-ub:~/sonarqube-example$ sonar-scanner -Dsonar.coverage.exclusions=fail.py -Dsonar.login=a94d43ee9b4bf3d632f736a4c81b57f8b584cb50 -Dsonar.projectKey=mytest
        INFO: Scanner configuration file: /home/k0pec/sonar-scanner/conf/sonar-scanner.properties
        INFO: Project root configuration file: NONE
        INFO: SonarScanner 4.7.0.2747
        INFO: Java 11.0.14.1 Eclipse Adoptium (64-bit)
        INFO: Linux 5.13.0-41-generic amd64
        INFO: User cache: /home/k0pec/.sonar/cache
        INFO: Scanner configuration file: /home/k0pec/sonar-scanner/conf/sonar-scanner.properties
        INFO: Project root configuration file: NONE
        INFO: Analyzing on SonarQube server 8.7.1
        INFO: Default locale: "ru_RU", source code encoding: "UTF-8" (analysis is platform dependent)
        INFO: Load global settings
        INFO: Load global settings (done) | time=52ms
        INFO: Server id: BF41A1F2-AYD3ZCG2oJ34DdKpXip1
        INFO: User cache: /home/k0pec/.sonar/cache
        INFO: Load/download plugins
        INFO: Load plugins index
        INFO: Load plugins index (done) | time=26ms
        INFO: Load/download plugins (done) | time=73ms
        INFO: Process project properties
        INFO: Process project properties (done) | time=1ms
        INFO: Execute project builders
        INFO: Execute project builders (done) | time=1ms
        INFO: Project key: mytest
        INFO: Base dir: /home/k0pec/sonarqube-example
        INFO: Working dir: /home/k0pec/sonarqube-example/.scannerwork
        INFO: Load project settings for component key: 'mytest'
        INFO: Load project settings for component key: 'mytest' (done) | time=18ms
        INFO: Load quality profiles
        INFO: Load quality profiles (done) | time=51ms
        INFO: Load active rules
        INFO: Load active rules (done) | time=977ms
        WARN: SCM provider autodetection failed. Please use "sonar.scm.provider" to define SCM of your project, or disable the SCM Sensor in the project settings.
        INFO: Indexing files...
        INFO: Project configuration:
        INFO:   Excluded sources for coverage: fail.py
        INFO: 1 file indexed
        INFO: Quality profile for py: Sonar way
        INFO: ------------- Run sensors on module mytest
        INFO: Load metrics repository
        INFO: Load metrics repository (done) | time=19ms
        INFO: Sensor Python Sensor [python]
        INFO: Starting global symbols computation
        INFO: 1 source files to be analyzed
        INFO: Load project repositories
        INFO: Load project repositories (done) | time=13ms
        INFO: Starting rules execution
        INFO: 1 source files to be analyzed
        INFO: 1/1 source files have been analyzed
        INFO: Sensor Python Sensor [python] (done) | time=3228ms
        INFO: Sensor Cobertura Sensor for Python coverage [python]
        INFO: 1/1 source files have been analyzed
        INFO: Sensor Cobertura Sensor for Python coverage [python] (done) | time=6ms
        INFO: Sensor PythonXUnitSensor [python]
        INFO: Sensor PythonXUnitSensor [python] (done) | time=0ms
        INFO: Sensor CSS Rules [cssfamily]
        INFO: No CSS, PHP, HTML or VueJS files are found in the project. CSS analysis is skipped.
        INFO: Sensor CSS Rules [cssfamily] (done) | time=0ms
        INFO: Sensor JaCoCo XML Report Importer [jacoco]
        INFO: 'sonar.coverage.jacoco.xmlReportPaths' is not defined. Using default locations: target/site/jacoco/jacoco.xml,target/site/jacoco-it/jacoco.xml,build/reports/jacoco/test/jacocoTestReport.xml
        INFO: No report imported, no coverage information will be imported by JaCoCo XML Report Importer
        INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=2ms
        INFO: Sensor C# Properties [csharp]
        INFO: Sensor C# Properties [csharp] (done) | time=0ms
        INFO: Sensor JavaXmlSensor [java]
        INFO: Sensor JavaXmlSensor [java] (done) | time=1ms
        INFO: Sensor HTML [web]
        INFO: Sensor HTML [web] (done) | time=1ms
        INFO: Sensor VB.NET Properties [vbnet]
        INFO: Sensor VB.NET Properties [vbnet] (done) | time=1ms
        INFO: ------------- Run sensors on project
        INFO: Sensor Zero Coverage Sensor
        INFO: Sensor Zero Coverage Sensor (done) | time=0ms
        INFO: SCM Publisher No SCM system was detected. You can use the 'sonar.scm.provider' property to explicitly specify it.
        INFO: CPD Executor Calculating CPD for 1 file
        INFO: CPD Executor CPD calculation finished (done) | time=5ms
        INFO: Analysis report generated in 38ms, dir size=91 KB
        INFO: Analysis report compressed in 11ms, zip size=12 KB
        INFO: Analysis report uploaded in 23ms
        INFO: ANALYSIS SUCCESSFUL, you can browse http://localhost:9000/dashboard?id=mytest
        INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
        INFO: More about the report processing at http://localhost:9000/api/ce/task?id=AYD3nSCPoJ34DdKpXnpB
        INFO: Analysis total time: 5.263 s
        INFO: ------------------------------------------------------------------------
        INFO: EXECUTION SUCCESS
        INFO: ------------------------------------------------------------------------
        INFO: Total time: 5.908s
        INFO: Final Memory: 71M/244M
        INFO: ------------------------------------------------------------------------
```
[sonarqube_fail.py](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/sonar_1.png)
```bash
        k0pec@k0pec-ub:~/sonarqube-example$ sonar-scanner -Dsonar.coverage.exclusions=fail.py -Dsonar.login=a94d43ee9b4bf3d632f736a4c81b57f8b584cb50 -Dsonar.projectKey=mytest
        INFO: Scanner configuration file: /home/k0pec/sonar-scanner/conf/sonar-scanner.properties
        INFO: Project root configuration file: NONE
        INFO: SonarScanner 4.7.0.2747
        INFO: Java 11.0.14.1 Eclipse Adoptium (64-bit)
        INFO: Linux 5.13.0-41-generic amd64
        INFO: User cache: /home/k0pec/.sonar/cache
        INFO: Scanner configuration file: /home/k0pec/sonar-scanner/conf/sonar-scanner.properties
        INFO: Project root configuration file: NONE
        INFO: Analyzing on SonarQube server 8.7.1
        INFO: Default locale: "ru_RU", source code encoding: "UTF-8" (analysis is platform dependent)
        INFO: Load global settings
        INFO: Load global settings (done) | time=69ms
        INFO: Server id: BF41A1F2-AYD3ZCG2oJ34DdKpXip1
        INFO: User cache: /home/k0pec/.sonar/cache
        INFO: Load/download plugins
        INFO: Load plugins index
        INFO: Load plugins index (done) | time=27ms
        INFO: Load/download plugins (done) | time=72ms
        INFO: Process project properties
        INFO: Process project properties (done) | time=0ms
        INFO: Execute project builders
        INFO: Execute project builders (done) | time=1ms
        INFO: Project key: mytest
        INFO: Base dir: /home/k0pec/sonarqube-example
        INFO: Working dir: /home/k0pec/sonarqube-example/.scannerwork
        INFO: Load project settings for component key: 'mytest'
        INFO: Load project settings for component key: 'mytest' (done) | time=9ms
        INFO: Load quality profiles
        INFO: Load quality profiles (done) | time=28ms
        INFO: Load active rules
        INFO: Load active rules (done) | time=784ms
        WARN: SCM provider autodetection failed. Please use "sonar.scm.provider" to define SCM of your project, or disable the SCM Sensor in the project settings.
        INFO: Indexing files...
        INFO: Project configuration:
        INFO:   Excluded sources for coverage: fail.py
        INFO: 1 file indexed
        INFO: Quality profile for py: Sonar way
        INFO: ------------- Run sensors on module mytest
        INFO: Load metrics repository
        INFO: Load metrics repository (done) | time=18ms
        INFO: Sensor Python Sensor [python]
        INFO: Starting global symbols computation
        INFO: 1 source files to be analyzed
        INFO: Load project repositories
        INFO: Load project repositories (done) | time=10ms
        INFO: Starting rules execution
        INFO: 1 source files to be analyzed
        INFO: 1/1 source files have been analyzed
        INFO: Sensor Python Sensor [python] (done) | time=3379ms
        INFO: 1/1 source files have been analyzed
        INFO: Sensor Cobertura Sensor for Python coverage [python]
        INFO: Sensor Cobertura Sensor for Python coverage [python] (done) | time=6ms
        INFO: Sensor PythonXUnitSensor [python]
        INFO: Sensor PythonXUnitSensor [python] (done) | time=0ms
        INFO: Sensor CSS Rules [cssfamily]
        INFO: No CSS, PHP, HTML or VueJS files are found in the project. CSS analysis is skipped.
        INFO: Sensor CSS Rules [cssfamily] (done) | time=1ms
        INFO: Sensor JaCoCo XML Report Importer [jacoco]
        INFO: 'sonar.coverage.jacoco.xmlReportPaths' is not defined. Using default locations: target/site/jacoco/jacoco.xml,target/site/jacoco-it/jacoco.xml,build/reports/jacoco/test/jacocoTestReport.xml
        INFO: No report imported, no coverage information will be imported by JaCoCo XML Report Importer
        INFO: Sensor JaCoCo XML Report Importer [jacoco] (done) | time=1ms
        INFO: Sensor C# Properties [csharp]
        INFO: Sensor C# Properties [csharp] (done) | time=0ms
        INFO: Sensor JavaXmlSensor [java]
        INFO: Sensor JavaXmlSensor [java] (done) | time=1ms
        INFO: Sensor HTML [web]
        INFO: Sensor HTML [web] (done) | time=1ms
        INFO: Sensor VB.NET Properties [vbnet]
        INFO: Sensor VB.NET Properties [vbnet] (done) | time=0ms
        INFO: ------------- Run sensors on project
        INFO: Sensor Zero Coverage Sensor
        INFO: Sensor Zero Coverage Sensor (done) | time=0ms
        INFO: SCM Publisher No SCM system was detected. You can use the 'sonar.scm.provider' property to explicitly specify it.
        INFO: CPD Executor Calculating CPD for 1 file
        INFO: CPD Executor CPD calculation finished (done) | time=4ms
        INFO: Analysis report generated in 38ms, dir size=91 KB
        INFO: Analysis report compressed in 11ms, zip size=12 KB
        INFO: Analysis report uploaded in 11ms
        INFO: ANALYSIS SUCCESSFUL, you can browse http://localhost:9000/dashboard?id=mytest
        INFO: Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
        INFO: More about the report processing at http://localhost:9000/api/ce/task?id=AYD3pw3voJ34DdKpXnpC
        INFO: Analysis total time: 5.184 s
        INFO: ------------------------------------------------------------------------
        INFO: EXECUTION SUCCESS
        INFO: ------------------------------------------------------------------------
        INFO: Total time: 5.845s
        INFO: Final Memory: 70M/240M
        INFO: ------------------------------------------------------------------------
```
[fail.py_fix](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/fail.py)  
[sonarqube_fail.py_fix](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/sonar_2.png)  

***Task 2***
### Nexus

[nexus](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/nexus.png)

[maven-metadata.xml](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/maven-metadata.xml)   

***Task 3***
### Maven
```bash
      k0pec@k0pec-ub:~$ mvn --version
      Apache Maven 3.8.5 (3599d3414f046de2324203b78ddcf9b5e4388aa0)
      Maven home: /home/k0pec/maven
      Java version: 1.8.0_312, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
      Default locale: ru_RU, platform encoding: UTF-8
      OS name: "linux", version: "5.13.0-44-generic", arch: "amd64", family: "unix"
```
```bash
      k0pec@k0pec-ub:~/maven$ mvn package
      [INFO] Scanning for projects...
      [INFO] 
      [INFO] --------------------< com.netology.app:simple-app >---------------------
      [INFO] Building simple-app 1.0-SNAPSHOT
      [INFO] --------------------------------[ jar ]---------------------------------
      Downloading from my-repo: http://localhost:8081/repository/maven-public/netology/java/8_282/java-8_282.pom
      Downloading from central: https://repo.maven.apache.org/maven2/netology/java/8_282/java-8_282.pom
      [WARNING] The POM for netology:java:tar.gz:distrib:8_282 is missing, no dependency information available
      Downloading from my-repo: http://localhost:8081/repository/maven-public/netology/java/8_282/java-8_282-distrib.tar.gz
      Downloaded from my-repo: http://localhost:8081/repository/maven-public/netology/java/8_282/java-8_282-distrib.tar.gz (254 B at 12 kB/s)
      [INFO] 
      [INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ simple-app ---
      [WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory /home/k0pec/maven/src/main/resources
      [INFO] 
      [INFO] --- maven-compiler-plugin:3.1:compile (default-compile) @ simple-app ---
      [INFO] No sources to compile
      [INFO] 
      [INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ simple-app ---
      [WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory /home/k0pec/maven/src/test/resources
      [INFO] 
      [INFO] --- maven-compiler-plugin:3.1:testCompile (default-testCompile) @ simple-app ---
      [INFO] No sources to compile
      [INFO] 
      [INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ simple-app ---
      [INFO] No tests to run.
      [INFO] 
      [INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ simple-app ---
      [WARNING] JAR will be empty - no content was marked for inclusion!
      [INFO] Building jar: /home/k0pec/maven/target/simple-app-1.0-SNAPSHOT.jar
      [INFO] ------------------------------------------------------------------------
      [INFO] BUILD SUCCESS
      [INFO] ------------------------------------------------------------------------
      [INFO] Total time:  1.499 s
      [INFO] Finished at: 2022-05-25T22:13:36+03:00
      [INFO] ------------------------------------------------------------------------
```
```bash
    k0pec@k0pec-ub:~/maven$ ll ~/.m2/repository/netology/java/8_282
      итого 24
      drwxrwxr-x 2 k0pec k0pec 4096 мая 25 22:13 ./
      drwxrwxr-x 3 k0pec k0pec 4096 мая 25 22:13 ../
      -rw-rw-r-- 1 k0pec k0pec  254 мая 25 22:13 java-8_282-distrib.tar.gz
      -rw-rw-r-- 1 k0pec k0pec   40 мая 25 22:13 java-8_282-distrib.tar.gz.sha1
      -rw-rw-r-- 1 k0pec k0pec  382 мая 25 22:13 java-8_282.pom.lastUpdated
      -rw-rw-r-- 1 k0pec k0pec  175 мая 25 22:13 _remote.repositories
```
[pom.xml](https://github.com/k0pec/netology_devops/blob/main/9.2_CI_CD/pom.xml)