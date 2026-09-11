class Expression a where
  evaluate :: a -> Double
  display :: a -> String

newtype Number = Number Double

instance Expression Number where
  evaluate (Number value) = value
  display (Number value) = show value

data Add left right = Add left right

instance (Expression left, Expression right) =>
    Expression (Add left right) where
  evaluate (Add left right) =
    evaluate left + evaluate right

  display (Add left right) =
    "(" ++ display left ++ " + " ++ display right ++ ")"

data Multiply left right = Multiply left right

instance (Expression left, Expression right) =>
    Expression (Multiply left right) where
  evaluate (Multiply left right) =
    evaluate left * evaluate right

  display (Multiply left right) =
    "(" ++ display left ++ " * " ++ display right ++ ")"

main :: IO ()
main = do
  let example =
        Multiply
          (Add (Number 1) (Number 2))
          (Number 3)

  putStrLn ("Expression: " ++ display example)
  putStrLn ("Result: " ++ show (evaluate example))