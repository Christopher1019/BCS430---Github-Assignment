package ast;

public abstract class Expression extends Node {
    public abstract String toTree(String indent);
}