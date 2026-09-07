package ast;

public class PrintStatement extends Statement {
    public Expression expression;

    public PrintStatement(Expression expression) {
        this.expression = expression;
    }

    public String toTree(String indent) {
        return indent + "Print\n" + expression.toTree(indent + "  ");
    }
}