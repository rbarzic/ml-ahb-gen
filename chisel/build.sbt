name := "AHB_MLI"

scalaVersion := "2.10.2"

addSbtPlugin("com.github.scct" %% "sbt-scct" % "0.2")

scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature", "-language:reflectiveCalls","-language:implicitConversions")

libraryDependencies <+= scalaVersion("org.scala-lang" % "scala-compiler" % _)

scalaSource in Compile <<= baseDirectory(_ / "src")

libraryDependencies += "edu.berkeley.cs" %% "chisel" % "latest.release"




// libraryDependencies += "edu.berkeley.cs" %% "chisel" % "2.2.31"

//libraryDependencies ++= (Seq("chisel","cde").map {
//  dep: String => sys.props.get(dep + "Version") map { "edu.berkeley.cs" %% dep % _ }}).flatten

//organization := "edu.berkeley.cs"
//
//version := "2.3-SNAPSHOT"
//
//name := "AHB_MLI"
//
//scalaVersion := "2.11.7"
//
//scalacOptions ++= Seq("-deprecation", "-feature", "-unchecked", "-language:reflectiveCalls")
