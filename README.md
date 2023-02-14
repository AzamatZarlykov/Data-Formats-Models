# data formats T1G3

## Homework 1

* Choose a domain/topic for homework
* Create a conceptual model using UML Class Diagrams and structured textual description
* Represented in the domain model
* 5-8 classes with 2-4 attributes each, some with multiplicity 0..*
* At least 4 associations with multiplicities 0..*, 0..1, 1..1

## Homework 2

* Represent the data in RDF using RDF Turtle, validate it and add labels for each new property.
* Load the RDF data into a triplestore such as Apache Jena Fuseki or Openlink Virtuoso.
* Develop meaningful SPARQL queries with explanations.
* Visualize a data sample in LPG using edge properties and node/relationship labels.
* Represent the data in LPG using an executable Cypher script.
* Load the LPG data into Neo4j.
* Develop meaningful Cypher queries with explanations.

## Homework 3

* Created one or more hierarchical diagrams showing how the data will be structured into hierarchies
* Created corresponding XML Schemas for each hierarchical model, enforcing proper datatypes
* Represented the data in XML files that are valid against the created XML Schemas
* Created a set of non-trivial XPath queries to query the XML data
* Created a non-trivial XSLT transformation producing HTML representation of a reasonable subset of the data
* Created XSLT transformations producing RDF Turtle representation of the data that is identical to the one from Homework 2 and validated the result
* Created corresponding JSON Schemas for each hierarchical model, enforcing proper datatypes
* Represented the data in JSON files that are valid against the created JSON Schemas
* Created a JSON-LD context mapping the JSON representations to RDF, which resulted in RDF data representation identical to the one from Homework 2 and viewed the result in RDF N-Quads representation
* Used Apache Jena riot command-line tool to transform the result into RDF Turtle
* Created a set of non-trivial jq queries to query the JSON data

## Homework 4

* Based on the conceptual model, create a relational model to show how the data will be split into tables, including primary keys and foreign keys.
* Create a CSV on the Web Table group descriptor, specifying proper data types, languages, and primary and foreign keys.
* Represent the data in CSV files, following the created CSV on the Web descriptor.
* Enhance the CSV on the Web descriptor with virtual columns and annotations such as aboutUrl, propertyUrl, and valueUrl.
* The resulting RDF data representation should match the ones from Homework 2 and 3.
* Use the rdf-tabular ruby gem to convert the CSV table group to RDF N-Triples.
* Convert the result into RDF Turtle using the Apache Jena riot command-line tool or the RDF Translator online tool.