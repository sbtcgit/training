import Text.Printf
import Data.List

data Eintrag = Eintrag { satz :: String
                        , wdh :: Int
                        , weight :: Float
                        } deriving(Show)

data Übung = Übung { gerät :: String
                    , eintragM :: Eintrag
                    , eintragS :: Eintrag
                    } deriving(Show)

data TrainingsTag = TrainingsTag { datum :: Int
                                  , übungen :: [Übung]
                                } deriving(Show)
{-
let ein1 = Eintrag "3x8" 10 25.0
let ein2 = Eintrag "3x10" 20 15.0
let ueb = Übung "Hantel" ein1 ein2
let day = TrainingsTag 20181022 [ueb,ueb,ueb]
let day2 = TrainingsTag 20191022 ([] :: [übungen])
 -- wie gibt man weitere übungen in einen trainingstag?
-}
addUebung :: Übung -> TrainingsTag -> TrainingsTag
addUebung übung (TrainingsTag datum übungen) = TrainingsTag datum (übungen ++ [übung])

{-
let ein1 = Eintrag "3x8" 10 25.0
Main.print ein1
putStrLn (Main.print ein1)
-}
printEin :: Eintrag -> String
printEin eintrag = "| " ++ (satz eintrag) ++ " | "
          ++ show (wdh eintrag) ++ " Wdh | "
          ++ show (weight eintrag) ++ "kg |"

printUeb :: Übung -> String
printUeb uebung = "| " ++ (gerät uebung) ++ " | "
                  ++ printEin (eintragM uebung)
                  ++ printEin (eintragS uebung)
                  ++ "\n"

--display TrainingsTag
printDay :: TrainingsTag -> String
printDay trainingstag = show( datum trainingstag )
                        ++ "\n"
                        ++ "--------------------------------------------------------------\n"
                        ++ intercalate "" (map printUeb (übungen trainingstag))
