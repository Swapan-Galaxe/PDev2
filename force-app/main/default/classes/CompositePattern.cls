public class CompositePattern
{
    public interface Expression {
        Expression add(Expression expr);
        Expression set(String name, Boolean value);
        Boolean evaluate();
    }
    
    public abstract class Composite implements Expression{
        public List<Expression> children {get; private set;} 
        public Composite(){ this.children = new List<Expression>(); }
        public Expression add(Expression expr){
            children.add(expr); return this;
        }
        public Expression set(String name, Boolean value){
            for(Expression expr : children) expr.set(name,value);
            return this;
        }
        public abstract Boolean evaluate();
        public Boolean hasChildren{get{ return !children.isEmpty(); }}
    }
    
        public class AndComposite extends Composite{
        public override Boolean evaluate(){
            for(Expression expr : children) if(!expr.evaluate()) return false;
            return true;
        }
    }
    
        public class OrComposite extends Composite{
        public override Boolean evaluate(){
            for(Expression expr : children) if(expr.evaluate()) return true;
            return false;
        }
    }
    
        public class Variable implements Expression{
        public String  name  {get;private set;}
        public Boolean value {get;private set;}
        public Variable(String name){ this.name = name; }
        public Expression add(Expression expr){ return this; }
        public Expression set(String name, Boolean value){ 
            if(this.name != null && this.name.equalsIgnoreCase(name))
                this.value = value;
            return this; 
        }
        public Boolean evaluate(){ return value; }
    }

}