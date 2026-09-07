package ast;

public abstract class Statement extends Node {
    public abstract String toTree(String indent);
}