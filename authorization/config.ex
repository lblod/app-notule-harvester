# Juste faire un public graph là dedans, virer tout le reste du bordel.

alias Acl.Accessibility.Always, as: AlwaysAccessible
alias Acl.GraphSpec.Constraint.ResourceFormat, as: ResourceFormatConstraint
alias Acl.GraphSpec.Constraint.Resource, as: ResourceConstraint
alias Acl.GraphSpec, as: GraphSpec
alias Acl.GroupSpec, as: GroupSpec
alias Acl.GroupSpec.GraphCleanup, as: GraphCleanup

defmodule Acl.UserGroups.Config do

  def user_groups do
    # These elements are walked from top to bottom.  Each of them may
    # alter the quads to which the current query applies.  Quads are
    # represented in three sections: current_source_quads,
    # removed_source_quads, new_quads.  The quads may be calculated in
    # many ways.  The useage of a GroupSpec and GraphCleanup are
    # common.
    [
      # // PUBLIC
      %GroupSpec{
        name: "public",
        useage: [:read],
        access: %AlwaysAccessible{}, # TODO: Should be only for logged in users
        graphs: [ %GraphSpec{
                    graph: "http://mu.semte.ch/graphs/public",
                    constraint: %ResourceConstraint{
                      resource_types: [
                        "http://mu.semte.ch/vocabularies/validation/Execution",
                        "http://mu.semte.ch/vocabularies/validation/Validation",
                        "http://mu.semte.ch/vocabularies/validation/Error",
                        "http://mu.semte.ch/vocabularies/ext/FormNode",
                        "http://mu.semte.ch/vocabularies/ext/FormInput",
                        "http://mu.semte.ch/vocabularies/ext/DynamicSubform",
                        "http://mu.semte.ch/vocabularies/ext/DocumentStatus",
                        "http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#FileDataObject",
                        "http://mu.semte.ch/vocabularies/ext/supervision/InzendingType",
                        "http://mu.semte.ch/vocabularies/ext/supervision/DecisionType",
                        "http://mu.semte.ch/vocabularies/ext/supervision/TaxType",
                        "http://mu.semte.ch/vocabularies/ext/supervision/Nomenclature",
                        "http://mu.semte.ch/vocabularies/ext/supervision/FiscalPeriod",
                        "http://mu.semte.ch/vocabularies/ext/supervision/DeliveryReportType",
                        "http://mu.semte.ch/vocabularies/ext/supervision/AccountAcceptanceStatus",
                        "http://mu.semte.ch/vocabularies/ext/supervision/DocumentAuthenticityType",
                        "http://mu.semte.ch/vocabularies/ext/supervision/RegulationType",
                        "http://www.w3.org/ns/prov#Location",
                        "http://mu.semte.ch/vocabularies/ext/BestuurseenheidClassificatieCode",
                        "http://data.vlaanderen.be/ns/besluit#Bestuursorgaan",
                        "http://mu.semte.ch/vocabularies/ext/BestuursorgaanClassificatieCode",
                        "http://mu.semte.ch/vocabularies/ext/Fractietype",
                        "http://mu.semte.ch/vocabularies/ext/KandidatenlijstType",
                        "http://data.vlaanderen.be/ns/mandaat#Kandidatenlijst",
                        "http://data.vlaanderen.be/ns/mandaat#Mandaat",
                        "http://mu.semte.ch/vocabularies/ext/BestuursfunctieCode",
                        "http://mu.semte.ch/vocabularies/ext/MandatarisStatusCode",
                        "http://mu.semte.ch/vocabularies/ext/BeleidsdomeinCode",
                        "http://mu.semte.ch/vocabularies/ext/GeslachtCode",
                        "http://data.europa.eu/eli/ontology#LegalResource",
                        "http://data.vlaanderen.be/ns/mandaat#RechtsgrondAanstelling",
                        "http://data.vlaanderen.be/ns/mandaat#RechtsgrondBeeindiging",
                        "http://data.vlaanderen.be/ns/mandaat#RechtstreekseVerkiezing",
                        "http://data.vlaanderen.be/ns/mandaat#Verkiezingsresultaat",
                        "http://mu.semte.ch/vocabularies/ext/VerkiezingsresultaatGevolgCode",
                        "http://www.w3.org/ns/org#Role",
                        "http://data.vlaanderen.be/ns/besluit#Bestuurseenheid",
                        "http://data.lblod.info/vocabularies/leidinggevenden/FunctionarisStatusCode",
                        "http://data.lblod.info/vocabularies/leidinggevenden/Bestuursfunctie",
                        "http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#Entry",
                        "http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#Level",
                        "http://persistence.uni-leipzig.org/nlp2rdf/ontologies/rlog#StatusCode",
                        "http://mu.semte.ch/vocabularies/ext/LogSource"
                      ]
                    } },
                  %GraphSpec{
                    graph: "http://mu.semte.ch/graphs/sessions",
                    constraint: %ResourceFormatConstraint{
                      resource_prefix: "http://mu.semte.ch/sessions/"
                    } } ] },
                    
      # // CLEANUP
      #
      %GraphCleanup{
        originating_graph: "http://mu.semte.ch/application",
        useage: [:write],
        name: "clean"
      }
    ]
  end
end
