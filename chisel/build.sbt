organization := "edu.berkeley.cs"

version := "2.3-SNAPSHOT"

name := "ahb-mli"

scalaVersion := "2.11.7"

scalacOptions ++= Seq("-deprecation", "-feature", "-unchecked", "-language:reflectiveCalls","-language:implicitConversions","-language:postfixOps")

unmanagedSourceDirectories in Compile += baseDirectory.value / "../junctions"
unmanagedSourceDirectories in Compile += baseDirectory.value / "../context-dependent-environments"
