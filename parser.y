%{
    #include<bits/stdc++.h>
    using namespace std;   
    extern "C" int yylex();
    extern "C" FILE *yyin;
    extern "C" int yylineno; 
    // map<string,string> dat;
    vector<string> dat;
    map<string,int> cnt;
    void yyerror(char *s);
    string conv(char *s);
%}
%union{
    char* val;
}

/* data types */
%start COMPILATIONUNIT

%token<val> BOOLEAN BYTE SHORT INT LONG CHAR FLOAT DOUBLE 

/* Separators */
%token<val> COMMA QUESTIONMARK SEMICOLON  OPENCURLY CLOSECURLY ANGULARLEFT ANGULARRIGHT OPENSQUARE CLOSESQUARE OPENPARAN CLOSEPARAN DOUBLECOLON TRIPLEDOT WS

/* Operators  AND -> & COMPLEMENT -> ~ */
%token<val> EQUALS MULTIPLYEQUALS DIVIDEEQUALS MODEQUALS PLUSEQUALS MINUSEQUALS PLUS MINUS DIVIDE MULTIPLY MOD OR XOR COLON NOT COMPLEMENT AND DOT OROR ANDAND PLUSPLUS MINUSMINUS ANGULARLEFTANGULARLEFT ANGULARRIGHTANGULARRIGHT ANGULARRIGHTANGULARRIGHTANGULARRIGHT
EQUALSEQUALS NOTEQUALS
/* Literals */
%token<val> INTEGERLITERAL FLOATINGPOINTLITERAL BOOLEANLITERAL CHARACTERLITERAL STRINGLITERAL TEXTBLOCK NULLLITERAL

/* Keywords */
%token<val> EXTENDS SUPER CLASS PUBLIC PRIVATE IMPLEMENTS PERMITS PROTECTED STATIC FINAL TRANSIENT VOLATILE INSTANCEOF THIS VOID NEW THROW ASSERT VAR BREAK CONTINUE RETURN YIELD IF ELSE WHILE FOR ABSTRACT SYNCHRONIZED NATIVE STRICTFP

/*  Unused keywords  See throw, throws and throwss*/
%token<val> SWITCH DEFAULT PACKAGE DO GOTO IMPORT THROWSS CASE ENUM CATCH TRY INTERFACE FINALLY CONST UNDERSCORE EXPORTS OPENS REQUIRES USES MODULE SEALED PROVIDES TO WITH OPEN RECORD TRANSITIVE ERROR ONCE NL 


%token<val> TYPEIDENTIFIER IDENTIFIER UNQUALIFIEDMETHODIDENTIFIER 



/* %type<val> CHAPTERTITLE SECTIONTITLE  */

%%

/* Type definitions */
TYPE    :   PRIMITIVETYPE
            |   REFERENCETYPE;

PRIMITIVETYPE   :   NUMERICTYPE
                |   BOOLEAN;

NUMERICTYPE     :   INTEGRALTYPE
                |   FLOATINGTYPE;

INTEGRALTYPE    : BYTE
                | SHORT 
                | INT 
                | LONG 
                | CHAR;

FLOATINGTYPE    :   FLOAT
                |   DOUBLE;

REFERENCETYPE   :   CLASSORINTERFACETYPE
                |   ARRAYTYPE;

/* CLASSORINTERFACETYPE    :   CLASSTYPE
                        |   INTERFACETYPE; */


CLASSORINTERFACETYPE    :   CLASSTYPE

CLASSTYPE   :   CLASSTYPE1
            |   CLASSTYPE3;

CLASSTYPE1  :   TYPEIDENTIFIER
            |   TYPEIDENTIFIER  TYPEARGUMENTS;

TYPEARGUMENTS   :   ANGULARLEFT TYPEARGUMENTLIST  ANGULARRIGHT

TYPEARGUMENTLIST    :   TYPEARGUMENT
                    |   TYPEARGUMENTLIST COMMA TYPEARGUMENT

TYPEARGUMENT    :   REFERENCETYPE
                |   WILDCARD;

WILDCARD    :   QUESTIONMARK 
            |   QUESTIONMARK WILDCARDBOUNDS

WILDCARDBOUNDS  :   EXTENDS REFERENCETYPE
                |   SUPER REFERENCETYPE;

CLASSTYPE3  :   CLASSORINTERFACETYPE DOT TYPEIDENTIFIER 
            |   CLASSORINTERFACETYPE DOT TYPEIDENTIFIER TYPEARGUMENTS

INTERFACETYPE   :   CLASSTYPE

/* TYPEVARIABLE    :   TYPEIDENTIFIER */

ARRAYTYPE   :   PRIMITIVETYPE   DIMS
            |   CLASSORINTERFACETYPE DIMS

DIMS    :   OPENSQUARE CLOSESQUARE
        |   DIMS OPENSQUARE CLOSESQUARE


/* Names */

/* TYPENAME    :   TYPEIDENTIFIER */

EXPRESSIONNAME  :   AMBIGUOUSNAME

METHODNAME  :   UNQUALIFIEDMETHODIDENTIFIER     //identifier other than yield

AMBIGUOUSNAME   :   IDENTIFIER
                |   AMBIGUOUSNAME DOT IDENTIFIER

/* Start Symbol : CompilationUnit */

COMPILATIONUNIT     :    ORDINARYCOMPILATIONUNIT;

ORDINARYCOMPILATIONUNIT :   
                        |   TOPLEVELCLASSORINTERFACEDECLARATION;

TOPLEVELCLASSORINTERFACEDECLARATION :   CLASSDECLARATION
                                    |   SEMICOLON;

/* Ignored enum and record */
CLASSDECLARATION    :   NORMALCLASSDECLARATION
                    

NORMALCLASSDECLARATION  :    CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSPERMITS CLASSBODY
                            | CLASS TYPEIDENTIFIER CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSPERMITS CLASSBODY
                            // | CLASSMODIFIER CLASS TYPEIDENTIFIER CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSPERMITS CLASSBODY
                            | SUPER1 CLASS TYPEIDENTIFIER CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSPERMITS CLASSBODY
                            | SUPER2 CLASS TYPEIDENTIFIER CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSEXTENDS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSIMPLEMENTS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER TYPEPARAMETERS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSIMPLEMENTS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSEXTENDS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSIMPLEMENTS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSPERMITS CLASSBODY
                            | SUPER3 CLASS TYPEIDENTIFIER CLASSBODY

// CLASSMODIFIER   :   SUPERMODIFIER
//                 |   CLASSMODIFIER SUPERMODIFIER;

/* CLASSMODIFIER1   :  ABSTRACT | SEALED  */

TYPEPARAMETERS  :   ANGULARLEFT TYPEPARAMETERLIST ANGULARRIGHT

TYPEPARAMETERLIST   :   TYPEPARAMETER
                    |   TYPEPARAMETERLIST COMMA TYPEPARAMETER

TYPEPARAMETER   :   TYPEIDENTIFIER TYPEBOUND
                |   TYPEIDENTIFIER;


TYPEBOUND   :  EXTENDS TYPEIDENTIFIER
            |   EXTENDS CLASSORINTERFACETYPE ADDITIONALBOUND

ADDITIONALBOUND :   AND INTERFACETYPE
                |   ADDITIONALBOUND AND INTERFACETYPE

CLASSEXTENDS    :   EXTENDS CLASSTYPE

CLASSIMPLEMENTS :    IMPLEMENTS INTERFACETYPELIST

INTERFACETYPELIST   :   INTERFACETYPE
                    |   INTERFACETYPELIST COMMA INTERFACETYPE

CLASSPERMITS    :   PERMITS TYPENAMES

TYPENAMES   :   TYPEIDENTIFIER
            |   TYPENAMES COMMA TYPEIDENTIFIER

CLASSBODY   :  OPENCURLY CLOSECURLY
            |   OPENCURLY CLASSBODYDECLARATIONS CLOSECURLY

CLASSBODYDECLARATIONS   :   CLASSBODYDECLARATION
                        |   CLASSBODYDECLARATIONS CLASSBODYDECLARATION

CLASSBODYDECLARATION    :   CLASSMEMBERDECLARATION
                        |   INSTANCEINITIALIZER
                        |   STATICINITIALIZER
                        |   CONSTRUCTORDECLARATION;

CLASSMEMBERDECLARATION:     FIELDDECLARATION
                            |   METHODDECLARATION
                            |   CLASSDECLARATION
                            |   SEMICOLON

FIELDDECLARATION    :   FIELDMODIFIERS UNANNTYPE VARIABLEDECLARATORLIST SEMICOLON
                    |   SUPER1 UNANNTYPE VARIABLEDECLARATORLIST SEMICOLON
                    |   SUPER2 UNANNTYPE VARIABLEDECLARATORLIST SEMICOLON
                    |   UNANNTYPE VARIABLEDECLARATORLIST SEMICOLON;


// FIELDMODIFIERS  :   FIELDMODIFIER
//                 |   FIELDMODIFIERS FIELDMODIFIER
//                 |   SUPERMODIFIER
//                 |   FIELDMODIFIERS SUPERMODIFIER;

SUPERMODIFIER   :   PUBLIC | PROTECTED |  PRIVATE | STATIC | FINAL 

FIELDMODIFIER   :   TRANSIENT | VOLATILE

VARIABLEDECLARATORLIST  :   VARIABLEDECLARATOR
                        |   VARIABLEDECLARATORLIST COMMA VARIABLEDECLARATOR;

VARIABLEDECLARATOR  :   VARIABLEDECLARATORID EQUALS VARIABLEINITIALIZER
                    |   VARIABLEDECLARATORID

VARIABLEDECLARATORID    :   IDENTIFIER 
                        |   IDENTIFIER DIMS

VARIABLEINITIALIZER :    EXPRESSION
                    |   ARRAYINITIALIZER

EXPRESSION  :  ASSIGNMENTEXPRESSION

ASSIGNMENTEXPRESSION    :   CONDITIONALEXPRESSION
                        |   ASSIGNMENT

ASSIGNMENT  :   LEFTHANDSIDE ASSIGNMENTOPERATOR EXPRESSION

LEFTHANDSIDE    :   EXPRESSIONNAME
                |   FIELDACCESS
                |   ARRAYACCESS

ASSIGNMENTOPERATOR  :  EQUALS
                    |  MULTIPLYEQUALS
                    |   DIVIDEEQUALS
                    |   MODEQUALS
                    |   PLUSEQUALS
                    |   MINUSEQUALS
                    
FIELDACCESS: PRIMARY DOT IDENTIFIER
            |	SUPER DOT IDENTIFIER
            |	TYPEIDENTIFIER DOT SUPER DOT IDENTIFIER

PRIMARY: PRIMARYNONEWARRAY
        |	ARRAYCREATIONEXPRESSION


/* here */
PRIMARYNONEWARRAY: LITERAL
                  |	CLASSLITERAL
                  |	THIS
                  |	TYPEIDENTIFIER DOT THIS
                  |	OPENPARAN EXPRESSION CLOSEPARAN
                  |	CLASSINSTANCECREATIONEXPRESSION         
                  |	FIELDACCESS
                  |	ARRAYACCESS
                  |	METHODINVOCATION
                  |	METHODREFERENCE

LITERAL: INTEGERLITERAL
        |	FLOATINGPOINTLITERAL
        |	BOOLEANLITERAL
        |	CHARACTERLITERAL
        |	STRINGLITERAL
        |	TEXTBLOCK
        |	NULLLITERAL

CLASSLITERAL: TYPEIDENTIFIER DOT CLASS
             |	NUMERICTYPE DOT CLASS
             |	BOOLEAN DOT CLASS
             |	VOID DOT CLASS
             | TYPEIDENTIFIER SQUARESTAR DOT CLASS
             |	NUMERICTYPE SQUARESTAR DOT CLASS
             |	BOOLEAN SQUARESTAR DOT CLASS

SQUARESTAR  :   OPENSQUARE CLOSESQUARE
            |   SQUARESTAR  OPENSQUARE CLOSESQUARE

CLASSINSTANCECREATIONEXPRESSION: UNQUALIFIEDCLASSINSTANCECREATIONEXPRESSION
                                |	EXPRESSIONNAME DOT UNQUALIFIEDCLASSINSTANCECREATIONEXPRESSION
                                |	PRIMARY DOT UNQUALIFIEDCLASSINSTANCECREATIONEXPRESSION

UNQUALIFIEDCLASSINSTANCECREATIONEXPRESSION:     NEW CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN CLOSEPARAN
                                            |   NEW CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN CLOSEPARAN CLASSBODY
                                            |   NEW CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN ARGUMENTLIST CLOSEPARAN
                                            |   NEW CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN ARGUMENTLIST CLOSEPARAN CLASSBODY 
                                            |   NEW TYPEARGUMENTS CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN CLOSEPARAN
                                            |   NEW TYPEARGUMENTS CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN CLOSEPARAN CLASSBODY
                                            |   NEW TYPEARGUMENTS CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN ARGUMENTLIST CLOSEPARAN
                                            |   NEW TYPEARGUMENTS CLASSORINTERFACETYPETOINSTANTIATE OPENPARAN ARGUMENTLIST CLOSEPARAN CLASSBODY

CLASSORINTERFACETYPETOINSTANTIATE:  IDENTIFIER  
                                |   IDENTIFIER DOTIDENTIFIER
                                |   IDENTIFIER TYPEARGUMENTSORDIAMOND
                                |   IDENTIFIER DOTIDENTIFIER TYPEARGUMENTSORDIAMOND

DOTIDENTIFIER   :   DOT IDENTIFIER
                |   DOTIDENTIFIER DOT IDENTIFIER

/* here <> ignored */
TYPEARGUMENTSORDIAMOND: TYPEARGUMENTS

ARGUMENTLIST: EXPRESSION
            |   ARGUMENTLIST COMMA EXPRESSION

METHODINVOCATION: METHODNAME OPENPARAN CLOSEPARAN
                 |  METHODNAME OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	TYPEIDENTIFIER DOT IDENTIFIER OPENPARAN CLOSEPARAN
                 |	TYPEIDENTIFIER DOT IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	TYPEIDENTIFIER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN CLOSEPARAN
                 |	TYPEIDENTIFIER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	EXPRESSIONNAME DOT IDENTIFIER OPENPARAN CLOSEPARAN
                 |	EXPRESSIONNAME DOT IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	EXPRESSIONNAME DOT TYPEARGUMENTS IDENTIFIER OPENPARAN CLOSEPARAN
                 |	EXPRESSIONNAME DOT TYPEARGUMENTS IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	PRIMARY DOT IDENTIFIER OPENPARAN CLOSEPARAN
                 |	PRIMARY DOT IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	PRIMARY DOT TYPEARGUMENTS IDENTIFIER OPENPARAN CLOSEPARAN
                 |	PRIMARY DOT TYPEARGUMENTS IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	SUPER DOT IDENTIFIER OPENPARAN CLOSEPARAN
                 |	SUPER DOT IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	SUPER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN CLOSEPARAN
                 |	SUPER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	TYPEIDENTIFIER DOT SUPER DOT IDENTIFIER OPENPARAN CLOSEPARAN
                 |	TYPEIDENTIFIER DOT SUPER DOT IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN
                 |	TYPEIDENTIFIER DOT SUPER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN CLOSEPARAN
                 |	TYPEIDENTIFIER DOT SUPER DOT TYPEARGUMENTS IDENTIFIER OPENPARAN ARGUMENTLIST CLOSEPARAN

METHODREFERENCE: EXPRESSIONNAME DOUBLECOLON TYPEARGUMENTS IDENTIFIER
                |	PRIMARY DOUBLECOLON TYPEARGUMENTS IDENTIFIER
                |	REFERENCETYPE DOUBLECOLON TYPEARGUMENTS IDENTIFIER
                |	SUPER DOUBLECOLON TYPEARGUMENTS IDENTIFIER
                |	TYPEIDENTIFIER DOT SUPER DOUBLECOLON TYPEARGUMENTS IDENTIFIER
                |	CLASSTYPE DOUBLECOLON TYPEARGUMENTS NEW
                |	ARRAYTYPE DOUBLECOLON NEW
                |   EXPRESSIONNAME DOUBLECOLON IDENTIFIER
                |	PRIMARY DOUBLECOLON IDENTIFIER
                |	REFERENCETYPE DOUBLECOLON IDENTIFIER
                |	SUPER DOUBLECOLON IDENTIFIER
                |	TYPEIDENTIFIER DOT SUPER DOUBLECOLON IDENTIFIER
                |	CLASSTYPE DOUBLECOLON NEW

ARRAYCREATIONEXPRESSION: NEW PRIMITIVETYPE DIMEXPRS DIMS
                        |	NEW CLASSORINTERFACETYPE DIMEXPRS DIMS
                        |	NEW PRIMITIVETYPE DIMS ARRAYINITIALIZER
                        |	NEW CLASSORINTERFACETYPE DIMS ARRAYINITIALIZER
                        |   NEW PRIMITIVETYPE DIMEXPRS 
                        |	NEW CLASSORINTERFACETYPE DIMEXPRS 
                        |   NEW PRIMITIVETYPE DIMS
                        |	NEW CLASSORINTERFACETYPE DIMS
                        |   NEW PRIMITIVETYPE 
                        |	NEW CLASSORINTERFACETYPE 

ARRAYINITIALIZER    :  OPENCURLY ARRAYINITIALIZER1 CLOSECURLY
                    |   OPENCURLY CLOSECURLY

ARRAYINITIALIZER1   :  VARIABLEINITIALIZERLIST 
                    |   COMMA
                    |   VARIABLEINITIALIZERLIST COMMA

DIMEXPRS: DIMEXPR
        |   DIMEXPRS DIMEXPR


/* lookhere*/ 
DIMEXPR: OPENSQUARE EXPRESSION CLOSESQUARE;

VARIABLEINITIALIZERLIST :   VARIABLEINITIALIZER
                        |   VARIABLEINITIALIZERLIST COMMA VARIABLEINITIALIZER




/* =================== */

ARRAYACCESS: EXPRESSIONNAME OPENSQUARE EXPRESSION CLOSESQUARE
            |	PRIMARYNONEWARRAY OPENSQUARE EXPRESSION CLOSESQUARE

CONDITIONALEXPRESSION: CONDITIONALOREXPRESSION
                      |	CONDITIONALOREXPRESSION QUESTIONMARK EXPRESSION COLON CONDITIONALEXPRESSION

CONDITIONALOREXPRESSION: CONDITIONALANDEXPRESSION
                        |	CONDITIONALOREXPRESSION OROR CONDITIONALANDEXPRESSION

CONDITIONALANDEXPRESSION: INCLUSIVEOREXPRESSION
                         |	CONDITIONALANDEXPRESSION ANDAND INCLUSIVEOREXPRESSION

INCLUSIVEOREXPRESSION: EXCLUSIVEOREXPRESSION
                      |	INCLUSIVEOREXPRESSION OR EXCLUSIVEOREXPRESSION

EXCLUSIVEOREXPRESSION: ANDEXPRESSION
                      |	EXCLUSIVEOREXPRESSION XOR ANDEXPRESSION

ANDEXPRESSION: EQUALITYEXPRESSION
              |	ANDEXPRESSION AND EQUALITYEXPRESSION

EQUALITYEXPRESSION: RELATIONALEXPRESSION
                   |	EQUALITYEXPRESSION EQUALSEQUALS RELATIONALEXPRESSION
                   |	EQUALITYEXPRESSION NOTEQUALS RELATIONALEXPRESSION

RELATIONALEXPRESSION: SHIFTEXPRESSION
                     |	RELATIONALEXPRESSION ANGULARLEFT SHIFTEXPRESSION
                     |	RELATIONALEXPRESSION ANGULARRIGHT SHIFTEXPRESSION
                     |	RELATIONALEXPRESSION ANGULARRIGHT EQUALS SHIFTEXPRESSION
                     |	RELATIONALEXPRESSION ANGULARLEFT EQUALS SHIFTEXPRESSION
                     |	INSTANCEOFEXPRESSION

SHIFTEXPRESSION: ADDITIVEEXPRESSION
                |	SHIFTEXPRESSION ANGULARLEFTANGULARLEFT ADDITIVEEXPRESSION
                |	SHIFTEXPRESSION ANGULARRIGHTANGULARRIGHT ADDITIVEEXPRESSION
                |	SHIFTEXPRESSION ANGULARRIGHTANGULARRIGHTANGULARRIGHT ADDITIVEEXPRESSION

ADDITIVEEXPRESSION: MULTIPLICATIVEEXPRESSION
                   |	ADDITIVEEXPRESSION PLUS MULTIPLICATIVEEXPRESSION
                   |	ADDITIVEEXPRESSION MINUS MULTIPLICATIVEEXPRESSION

MULTIPLICATIVEEXPRESSION: UNARYEXPRESSION
                         |	MULTIPLICATIVEEXPRESSION MULTIPLY UNARYEXPRESSION
                         |	MULTIPLICATIVEEXPRESSION DIVIDE UNARYEXPRESSION
                         |	MULTIPLICATIVEEXPRESSION MOD UNARYEXPRESSION

UNARYEXPRESSION: PREINCREMENTEXPRESSION
                |	PREDECREMENTEXPRESSION
                |	PLUS UNARYEXPRESSION
                |	MINUS UNARYEXPRESSION
                |	UNARYEXPRESSIONNOTPLUSMINUS

PREINCREMENTEXPRESSION: PLUSPLUS UNARYEXPRESSION

PREDECREMENTEXPRESSION: MINUSMINUS UNARYEXPRESSION

UNARYEXPRESSIONNOTPLUSMINUS: POSTFIXEXPRESSION
                            |	COMPLEMENT UNARYEXPRESSION
                            |	NOT UNARYEXPRESSION
                            
POSTFIXEXPRESSION: PRIMARY
                  |	EXPRESSIONNAME
                  |	POSTINCREMENTEXPRESSION
                  |	POSTDECREMENTEXPRESSION

POSTINCREMENTEXPRESSION: POSTFIXEXPRESSION PLUSPLUS

POSTDECREMENTEXPRESSION: POSTFIXEXPRESSION MINUSMINUS

INSTANCEOFEXPRESSION: RELATIONALEXPRESSION INSTANCEOF REFERENCETYPE
                     
/* UNANNTYPE: UNANNPRIMITIVETYPE
          |	UNANNREFERENCETYPE */

UNANNTYPE: PRIMITIVETYPE
          |	UNANNREFERENCETYPE

/* UNANNPRIMITIVETYPE: NUMERICTYPE
                   |	BOOLEAN */

/* UNANNREFERENCETYPE: UNANNCLASSORINTERFACETYPE
                   |	UNANNTYPEVARIABLE
                   |	UNANNARRAYTYPE */


/* UNANNREFERENCETYPE: UNANNCLASSORINTERFACETYPE
                   |	UNANNARRAYTYPE */

UNANNREFERENCETYPE: CLASSORINTERFACETYPE
                    |	UNANNARRAYTYPE

/* UNANNCLASSORINTERFACETYPE: CLASSTYPE */

/* UNANNCLASSTYPE: TYPEIDENTIFIER TYPEARGUMENTS
                |   TYPEIDENTIFIER 
               |	UNANNCLASSORINTERFACETYPE DOT TYPEIDENTIFIER TYPEARGUMENTS
               |	UNANNCLASSORINTERFACETYPE DOT TYPEIDENTIFIER  */

/* UNANNINTERFACETYPE: UNANNCLASSTYPE */

/* UNANNTYPEVARIABLE: TYPEIDENTIFIER  */



/* UNANNARRAYTYPE: UNANNPRIMITIVETYPE DIMS
               |	UNANNCLASSORINTERFACETYPE DIMS
               |	TYPEIDENTIFIER DIMS */

UNANNARRAYTYPE: PRIMITIVETYPE DIMS
               |	CLASSORINTERFACETYPE DIMS
               /* |	TYPEIDENTIFIER DIMS */

METHODDECLARATION:  METHODHEADER METHODBODY
                    |   SUPER1 METHODHEADER METHODBODY
                    |   SUPER2 METHODHEADER METHODBODY
                    |   SUPER3 METHODHEADER METHODBODY
                    |   METHODMODIFIERS METHODHEADER METHODBODY

// METHODMODIFIERS :   METHODMODIFIER
//                 |   METHODMODIFIERS METHODMODIFIER
//                 |   SUPERMODIFIER
//                 |   METHODMODIFIERS SUPERMODIFIER

// METHODMODIFIER:  ABSTRACT | SYNCHRONIZED| NATIVE | STRICTFP

METHODHEADER: RESULT METHODDECLARATOR THROWS
            |   RESULT METHODDECLARATOR 
             |	TYPEPARAMETERS RESULT METHODDECLARATOR THROWS
             |  TYPEPARAMETERS RESULT METHODDECLARATOR 

RESULT: UNANNTYPE
       |	VOID

THROWS: THROW EXCEPTIONTYPELIST

EXCEPTIONTYPELIST: EXCEPTIONTYPE    
                |   EXCEPTIONTYPELIST COMMA EXCEPTIONTYPE

EXCEPTIONTYPE: CLASSTYPE

METHODDECLARATOR: IDENTIFIER OPENPARAN CLOSEPARAN 
                |   IDENTIFIER OPENPARAN CLOSEPARAN DIMS
                |   IDENTIFIER OPENPARAN FORMALPARAMETERLIST CLOSEPARAN DIMS
                |   IDENTIFIER OPENPARAN FORMALPARAMETERLIST CLOSEPARAN 
                |   IDENTIFIER RECEIVERPARAMETER COMMA OPENPARAN CLOSEPARAN 
                |   IDENTIFIER RECEIVERPARAMETER COMMA OPENPARAN CLOSEPARAN DIMS
                |   IDENTIFIER RECEIVERPARAMETER COMMA OPENPARAN FORMALPARAMETERLIST CLOSEPARAN DIMS
                |   IDENTIFIER RECEIVERPARAMETER COMMA OPENPARAN FORMALPARAMETERLIST CLOSEPARAN 

RECEIVERPARAMETER:  UNANNTYPE THIS
                |   UNANNTYPE IDENTIFIER DOT THIS

FORMALPARAMETERLIST: FORMALPARAMETER 
                    |   FORMALPARAMETERLIST COMMA FORMALPARAMETER

FORMALPARAMETER:  UNANNTYPE VARIABLEDECLARATORID
                |	VARIABLEARITYPARAMETER
                |   VARIABLEMODIFIERS UNANNTYPE VARIABLEDECLARATORID

VARIABLEMODIFIERS   :   VARIABLEMODIFIER
                    |   VARIABLEMODIFIERS VARIABLEMODIFIER

VARIABLEARITYPARAMETER  :  UNANNTYPE TRIPLEDOT IDENTIFIER
                        |   VARIABLEMODIFIERS UNANNTYPE TRIPLEDOT IDENTIFIER

VARIABLEMODIFIER:   FINAL

METHODBODY: BLOCK
           |	SEMICOLON

INSTANCEINITIALIZER: BLOCK

STATICINITIALIZER: STATIC BLOCK

BLOCK: OPENCURLY BLOCKSTATEMENTS CLOSECURLY
    |   OPENCURLY  CLOSECURLY

BLOCKSTATEMENTS: BLOCKSTATEMENT 
                |  BLOCKSTATEMENTS BLOCKSTATEMENT 

BLOCKSTATEMENT: LOCALCLASSORINTERFACEDECLARATION
               |	LOCALVARIABLEDECLARATIONSTATEMENT
               |	STATEMENT
 
 /* here interface ignored */
LOCALCLASSORINTERFACEDECLARATION: CLASSDECLARATION

LOCALVARIABLEDECLARATIONSTATEMENT: LOCALVARIABLEDECLARATION SEMICOLON

LOCALVARIABLEDECLARATION: VARIABLEMODIFIERS LOCALVARIABLETYPE VARIABLEDECLARATORLIST
                        |   LOCALVARIABLETYPE VARIABLEDECLARATORLIST

LOCALVARIABLETYPE: UNANNTYPE
                  |	VAR

/* Statement */

STATEMENT: STATEMENTWITHOUTTRAILINGSUBSTATEMENT
          |	LABELEDSTATEMENT
          |	IFTHENSTATEMENT
          |	IFTHENELSESTATEMENT
          |	WHILESTATEMENT
          |	FORSTATEMENT

STATEMENTWITHOUTTRAILINGSUBSTATEMENT: BLOCK
                                     |	EMPTYSTATEMENT
                                     |	EXPRESSIONSTATEMENT
                                     |	ASSERTSTATEMENT
                                     |	BREAKSTATEMENT
                                     |	CONTINUESTATEMENT
                                     |	RETURNSTATEMENT
                                     |	THROWSTATEMENT
                                     |	YIELDSTATEMENT

EMPTYSTATEMENT: SEMICOLON

EXPRESSIONSTATEMENT: STATEMENTEXPRESSION SEMICOLON

STATEMENTEXPRESSION: ASSIGNMENT
                    |	PREINCREMENTEXPRESSION
                    |	PREDECREMENTEXPRESSION
                    |	POSTINCREMENTEXPRESSION
                    |	POSTDECREMENTEXPRESSION
                    |	METHODINVOCATION
                    |	CLASSINSTANCECREATIONEXPRESSION

ASSERTSTATEMENT: ASSERT EXPRESSION SEMICOLON
                |	ASSERT EXPRESSION COLON EXPRESSION SEMICOLON

BREAKSTATEMENT: BREAK SEMICOLON
                |   BREAK IDENTIFIER SEMICOLON

CONTINUESTATEMENT: CONTINUE SEMICOLON
                |   CONTINUE IDENTIFIER SEMICOLON

RETURNSTATEMENT: RETURN EXPRESSION SEMICOLON
                |   RETURN SEMICOLON

THROWSTATEMENT: THROW EXPRESSION SEMICOLON

YIELDSTATEMENT: YIELD EXPRESSION SEMICOLON

LABELEDSTATEMENT: IDENTIFIER COLON STATEMENT

IFTHENSTATEMENT: IF OPENPARAN EXPRESSION CLOSEPARAN STATEMENT

IFTHENELSESTATEMENT: IF OPENPARAN EXPRESSION CLOSEPARAN STATEMENTNOSHORTIF ELSE STATEMENT

IFTHENELSESTATEMENTNOSHORTIF: IF OPENPARAN EXPRESSION CLOSEPARAN  STATEMENTNOSHORTIF ELSE STATEMENTNOSHORTIF

STATEMENTNOSHORTIF: STATEMENTWITHOUTTRAILINGSUBSTATEMENT
                   |	LABELEDSTATEMENTNOSHORTIF
                   |	IFTHENELSESTATEMENTNOSHORTIF
                   |	WHILESTATEMENTNOSHORTIF
                   |	FORSTATEMENTNOSHORTIF

LABELEDSTATEMENTNOSHORTIF: IDENTIFIER COLON STATEMENTNOSHORTIF

WHILESTATEMENTNOSHORTIF: WHILE OPENPARAN EXPRESSION CLOSEPARAN STATEMENTNOSHORTIF

FORSTATEMENTNOSHORTIF: BASICFORSTATEMENTNOSHORTIF
                      |	ENHANCEDFORSTATEMENTNOSHORTIF


WHILESTATEMENT: WHILE OPENPARAN EXPRESSION CLOSEPARAN STATEMENT

FORSTATEMENT: BASICFORSTATEMENT
             |	ENHANCEDFORSTATEMENT

BASICFORSTATEMENT: FOR OPENPARAN SEMICOLON SEMICOLON CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN SEMICOLON SEMICOLON FORUPDATE CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN SEMICOLON EXPRESSION SEMICOLON CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN SEMICOLON EXPRESSION SEMICOLON FORUPDATE CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN FORINIT SEMICOLON SEMICOLON CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN FORINIT SEMICOLON SEMICOLON FORUPDATE CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN FORINIT SEMICOLON EXPRESSION SEMICOLON CLOSEPARAN STATEMENT
                  |	FOR OPENPARAN FORINIT SEMICOLON EXPRESSION SEMICOLON FORUPDATE CLOSEPARAN STATEMENT

BASICFORSTATEMENTNOSHORTIF: FOR OPENPARAN SEMICOLON SEMICOLON CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN SEMICOLON SEMICOLON FORUPDATE CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN SEMICOLON EXPRESSION SEMICOLON CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN SEMICOLON EXPRESSION SEMICOLON FORUPDATE CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN FORINIT SEMICOLON SEMICOLON CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN FORINIT SEMICOLON SEMICOLON FORUPDATE CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN FORINIT SEMICOLON EXPRESSION SEMICOLON CLOSEPARAN STATEMENTNOSHORTIF
                  |	FOR OPENPARAN FORINIT SEMICOLON EXPRESSION SEMICOLON FORUPDATE CLOSEPARAN STATEMENTNOSHORTIF

ENHANCEDFORSTATEMENT: FOR OPENPARAN LOCALVARIABLEDECLARATION COLON EXPRESSION CLOSEPARAN STATEMENT

ENHANCEDFORSTATEMENTNOSHORTIF: FOR OPENPARAN LOCALVARIABLEDECLARATION COLON EXPRESSION CLOSEPARAN STATEMENTNOSHORTIF

FORINIT: STATEMENTEXPRESSIONLIST
        |	LOCALVARIABLEDECLARATION

FORUPDATE: STATEMENTEXPRESSIONLIST

STATEMENTEXPRESSIONLIST: STATEMENTEXPRESSION 
                        |   STATEMENTEXPRESSIONLIST COMMA STATEMENTEXPRESSION 

CONSTRUCTORDECLARATION:     CONSTRUCTORDECLARATOR THROWS CONSTRUCTORBODY
                        |   CONSTRUCTORDECLARATOR CONSTRUCTORBODY
                        |   SUPER1 CONSTRUCTORDECLARATOR THROWS CONSTRUCTORBODY  
                        |   SUPER1 CONSTRUCTORDECLARATOR CONSTRUCTORBODY 

// CONSTRUCTORMODIFIERS    :   SUPERMODIFIER
//                         |   CONSTRUCTORMODIFIERS SUPERMODIFIER

/* CONSTRUCTORMODIFIER :   PUBLIC | PRIVATE | PROTECTED */

CONSTRUCTORDECLARATOR: SIMPLETYPENAME OPENPARAN  CLOSEPARAN
                    |   SIMPLETYPENAME OPENPARAN FORMALPARAMETERLIST CLOSEPARAN
                    |   SIMPLETYPENAME OPENPARAN RECEIVERPARAMETER COMMA CLOSEPARAN
                    |   SIMPLETYPENAME OPENPARAN RECEIVERPARAMETER COMMA FORMALPARAMETERLIST CLOSEPARAN
                    |   TYPEPARAMETERS SIMPLETYPENAME OPENPARAN  CLOSEPARAN
                    |   TYPEPARAMETERS SIMPLETYPENAME OPENPARAN FORMALPARAMETERLIST CLOSEPARAN
                    |   TYPEPARAMETERS SIMPLETYPENAME OPENPARAN RECEIVERPARAMETER COMMA CLOSEPARAN
                    |   TYPEPARAMETERS SIMPLETYPENAME OPENPARAN RECEIVERPARAMETER COMMA FORMALPARAMETERLIST CLOSEPARAN

SIMPLETYPENAME: TYPEIDENTIFIER

CONSTRUCTORBODY: OPENCURLY EXPLICITCONSTRUCTORINVOCATION BLOCKSTATEMENTS CLOSECURLY
                |   OPENCURLY EXPLICITCONSTRUCTORINVOCATION CLOSECURLY
                |   OPENCURLY BLOCKSTATEMENTS CLOSECURLY
                |   OPENCURLY  CLOSECURLY

EXPLICITCONSTRUCTORINVOCATION: THIS OPENPARAN CLOSEPARAN SEMICOLON
                            |    THIS OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   TYPEARGUMENTS THIS OPENPARAN  CLOSEPARAN SEMICOLON
                            |   TYPEARGUMENTS THIS OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   SUPER OPENPARAN CLOSEPARAN SEMICOLON
                            |    SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   TYPEARGUMENTS SUPER OPENPARAN  CLOSEPARAN SEMICOLON
                            |   TYPEARGUMENTS SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   EXPRESSIONNAME DOT SUPER OPENPARAN CLOSEPARAN SEMICOLON
                            |   EXPRESSIONNAME DOT SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   EXPRESSIONNAME DOT TYPEARGUMENTS SUPER OPENPARAN  CLOSEPARAN SEMICOLON
                            |   EXPRESSIONNAME DOT TYPEARGUMENTS SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |  PRIMARY SUPER OPENPARAN CLOSEPARAN SEMICOLON
                            |   PRIMARY SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON
                            |   PRIMARY TYPEARGUMENTS SUPER OPENPARAN  CLOSEPARAN SEMICOLON
                            |   PRIMARY TYPEARGUMENTS SUPER OPENPARAN ARGUMENTLIST CLOSEPARAN SEMICOLON

SUPER1 : PUBLIC | PRIVATE | PROTECTED
        | SUPER1 PUBLIC 
        | SUPER1 PRIVATE 
        | SUPER1 PROTECTED
    
SUPER2 : SUPER1 STATIC
        | SUPER1 FINAL
        | SUPER2 STATIC
        | SUPER2 FINAL
        | SUPER2 PUBLIC
        | SUPER2 PRIVATE
        | SUPER2 PROTECTED

SUPER3 : SUPER2 ABSTRACT
        | SUPER2 STRICTFP
        | SUPER3 ABSTRACT
        | SUPER3 STRICTFP
        | SUPER3 PUBLIC
        | SUPER3 PRIVATE
        | SUPER3 PROTECTED
        | SUPER3 STATIC
        | SUPER3 FINAL

FIELDMODIFIERS: SUPER3 TRANSIENT
            |   SUPER3 VOLATILE
            |  FIELDMODIFIERS TRANSIENT
            |  FIELDMODIFIERS VOLATILE
            | FIELDMODIFIERS PUBLIC
            | FIELDMODIFIERS PRIVATE
            | FIELDMODIFIERS PROTECTED
            | FIELDMODIFIERS STATIC
            | FIELDMODIFIERS FINAL


METHODMODIFIERS : SUPER3 SYNCHRONIZED
                | SUPER3 NATIVE
                | METHODMODIFIERS SYNCHRONIZED
                | METHODMODIFIERS NATIVE
                | METHODMODIFIERS ABSTRACT
                | METHODMODIFIERS STRICTFP
                | METHODMODIFIERS PUBLIC
                | METHODMODIFIERS PRIVATE
                | METHODMODIFIERS PROTECTED
                | METHODMODIFIERS STATIC
                | METHODMODIFIERS FINAL


%%


void yyerror(char *s){
    printf("error at line %d ,%s\n",cnt["LINE"],s);
}

int main(){
    yyparse();
    cout<<dat[0]<<"\n";
    for(auto i:cnt){
        cout<<i.first<<" "<<i.second<<"\n";
    }
    int n=dat.size();
    for(int i=1;i<n;i++){
        cout<<dat[i]<<"\n";
    }

}