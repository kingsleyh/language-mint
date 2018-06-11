describe "ChoiceScript grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-mint")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.mint")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.mint"

  it "tokenizes the general keywords", ->
    assertGeneralKeyword('module')

  assertGeneralKeyword = (keyword) ->
    {tokens} = grammar.tokenizeLine(keyword)
    expect(tokens[0]).toEqual value: keyword, scopes: ['source.mint', 'keyword.control.def.mint']
