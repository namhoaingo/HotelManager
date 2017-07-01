

struct Test{
    static var internalProperty: String = "Static"
    
    var nonStatic: String = "Not Static"
    }



let c = Test()
c.nonStatic

Test.internalProperty
