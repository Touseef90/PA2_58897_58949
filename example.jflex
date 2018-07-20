import java.util.*;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

%%

%class test
%standalone
%line
%column

String = \"[^\"\\\n\r]*\"
Keywords = "abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extends"|"final"|"finally"|"float"|"for"|"goto"|"if"|"implements"|"import"|"instanceof"|"int"|"interface"|"long"|"native"|"new"|"package"|"private"|"protected"|"public"|"return"|"try"|"static"|"super"|"switch"|"synchronized"|"this"|"throw"|"throws"|"transien"|"try"|"void"|"volatile"|"while"
Identifier = [A-Za-z_] [A-Za-z_$0-9]*
DecimalInt = [1-9][0-9]*
Float = [0-9]+ \. [0-9]+
Symbol = "="|"+"|"-"|"*"|"/"|"%"|"++"|"--"|"!"|"=="|"!="|">"|">="|"<"|"<="|"&&"|"||"|"("|")"|"{"|"}"|"["|"]"

%{
 List<String> val = new ArrayList();
%}

%eof{
  String fileName = "output.txt";
  try {
    PrintWriter outputStream = new PrintWriter(fileName);
    for(int i=0; i<val.size(); i++){
      outputStream.println(val.get(i));
    }
    outputStream.close();
  } catch (FileNotFoundException e) {
    e.printStackTrace();
  }

%eof}

%%

{String} {String str = "String : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(str);
System.out.printf(str);
}

{Keywords} {String kwr = "Keyword : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(kwr);
System.out.printf(kwr);
}

{Identifier} {String idn = "Identifier : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(idn);
System.out.printf(idn);
}

{DecimalInt} {String din = "Interger : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(din);
System.out.printf(din);
}

{Float} {String flo = "Float : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(flo);
System.out.printf(flo);
}

{Symbol} {String sym = "Symbol : "+yytext()+" at line "+yyline+", column "+yycolumn+"\n";
val.add(sym);
System.out.printf(sym);
}

\n { /* Do not do anyhing */}

. { /* Do not do anyhing */}
