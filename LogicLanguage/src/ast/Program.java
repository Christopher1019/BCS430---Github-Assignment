package ast;

import java.util.List;

public class Program extends Node {
    public List<Statement> statements;

    public Program(List<Statement> statements) {
        this.statements = statements;
    }

    public String toTree(String indent) {
        StringBuilder sb = new StringBuilder(indent + "Program\n");
        for (Statement s : statements) sb.append(s.toTree(indent + "  "));
        return sb.toString();
    }
}