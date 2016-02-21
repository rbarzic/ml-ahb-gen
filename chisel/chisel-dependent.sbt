// Provide a managed dependency on chisel.
// The default version is "latest.release".
// This may be overridden if -DchiselVersion="" is supplied on the command line.

val chiselVersion_h = System.getProperty("chiselVersion", "latest.release")

libraryDependencies += "edu.berkeley.cs" %% "chisel" % "latest.release"
// libraryDependencies += "edu.berkeley.cs" %% "cde" % "latest.release"

//libraryDependencies ++= ( if (chiselVersion_h != "None" ) ("edu.berkeley.cs" %% "chisel" % chiselVersion_h) :: Nil; else Nil)
//libraryDependencies ++= (Seq("chisel","cde").map {
//  dep: String => sys.props.get(dep + "Version") map { "edu.berkeley.cs" %% dep % _ }}).flatten
