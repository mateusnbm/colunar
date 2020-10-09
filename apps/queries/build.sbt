name := "HelloWorld"
version := "1.0"
scalaVersion := "2.11.12"

assemblyMergeStrategy in assembly := {
 case PathList("META-INF", xs @ _*) => MergeStrategy.discard
 case x => MergeStrategy.first
}

unmanagedBase := baseDirectory.value / "lib"