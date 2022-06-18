# 7.5 Golang Intro
## Home Work

#### ***Task_1***
```go
    package main
  
    import "fmt"
    
    import "math"
    
    func main() {
        fmt.Print("Enter value in foot: ")
        var input float64
        
        fmt.Scanf("%f", &input)
        output := input * float64(0.3048)
        fmt.Println(output)    
    } 
```

#### ***Task_2***
```go
    package main
        
    import "fmt"
    
    func main() {
        x := []int{48,2, 96,86,3,68,57,82,63,70,37,34,83,27,19,97,9,17,1}
        current := 0
        fmt.Println ("Список значений : ", x)
        for i, value := range x {
            if (i == 0) {
                current = value 
            } else {
                if (value < current){
                    current = value
                }
            }
        }
        fmt.Println("Минимальное число : ", current)
    }  
```

#### ***Task_3***
```go
    package main
        
    import "fmt"
    
    
    func main() {
        
        for i := 1; i <= 100; i++ {
            if ((i-1)%10) ==0 {
                    fmt.Print(i-1," -> ")
            }            
                    
            if (i%3) == 0 {
                fmt.Print(i,", ")
                }
            if (i%10) ==0 {
                fmt.Println()
            }
        }
    }
```