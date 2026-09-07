package ast;

public class Identifier extends Expression {
    public String name;

    public Identifier(String name, SourceSpan span) {
        this.name = name;
        this.span = span;
    }

    public String toTree(String indent) {
        return indent + "Identifier(" + name + ")\n";
    }
}