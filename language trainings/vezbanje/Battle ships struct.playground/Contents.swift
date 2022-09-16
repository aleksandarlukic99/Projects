import UIKit

func battleShips() {
    var player = Player()
    var bot = Player()
    player.playerBoats()
    bot.playerBoats()
    shoting(player: "Aca", bot: "Bot", playerBoard: &player.board, botBoard: &bot.board, playerPoint: &player.playerPoints, botPoint: &bot.playerPoints, pointsToWin: 19)
    print("-------> Player board: <-------")
    player.arrangedBoard(board: player.board)
    print("|-----------------------------|")
    print("-------> Bot board: <----------")
    player.arrangedBoard(board: bot.board)
    if player.playerPoints == 19 {
        print("Player wins in \(counter) rounds! Player points: \(player.playerPoints), bot points: \(bot.playerPoints).")
    } else if bot.playerPoints == 19 {
        print("Bot wins in \(counter) rounds! Player points: \(player.playerPoints), bot points: \(bot.playerPoints)")
    }
}
var counter = 0

func shoting(player: String, bot: String, playerBoard: inout [[Int]], botBoard: inout [[Int]], playerPoint: inout Int, botPoint: inout Int, pointsToWin: Int) {
    let row = Int.random(in: 0...9)
    let column = Int.random(in: 0...9)
    if playerPoint < pointsToWin && botPoint < pointsToWin {
        if botBoard[row][column] == 1 {
            botBoard[row][column] = 2
            playerPoint += 1
            counter += 1
            print("\(player) hits! At: \(row), \(column)")
            shoting(player: bot, bot: player, playerBoard: &botBoard, botBoard: &playerBoard, playerPoint: &botPoint, botPoint: &playerPoint, pointsToWin: pointsToWin)
        } else if botBoard[row][column] == 0 {
            botBoard[row][column] = 3
            print("\(player) miss!  At: \(row), \(column)")
            counter += 1
            shoting(player: bot, bot: player, playerBoard: &botBoard, botBoard: &playerBoard, playerPoint: &botPoint,botPoint: &playerPoint, pointsToWin: pointsToWin)
        } else {
            shoting(player: player, bot: bot, playerBoard: &playerBoard, botBoard: &botBoard, playerPoint: &playerPoint ,botPoint: &botPoint, pointsToWin: pointsToWin)
        }
    }
}



struct Player  {
    
    var board = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]


//Indeksi, dva spojena menjaju jedan broj
    var firstRow = 0
    var firstColumn = 0
    var secondRow = 0
    var secondColumn = 0
    var thirdRow = 0
    var thirdColumn = 0
    var fourthRow = 0
    var fourthColumn = 0
    var fifthRow = 0
    var fifthColumn = 0
    
    var counter = 0
    var playerPoints = 0

    func arrangedBoard(board: [[Int]]) {
        for row in board {
            print(row)
        }
    }

    func randomHorizontalOrVertical() -> String {
        let string = ["horizontal", "vertical"].randomElement()
        return string!
    }

    func randomNumber() -> Int {
        let number = Int.random(in: 0...9)
        return number
    }

    func isFieldEmpty(board: [[Int]], row: Int, column: Int) -> Bool {
        if board[row][column] == 0 {
            return true
        } else {
            return false
        }
    }

        mutating func firstField() {
        firstRow = randomNumber()
        firstColumn = randomNumber()
        if isFieldEmpty(board: board, row: firstRow, column: firstColumn) {
            board[firstRow][firstColumn] = 1
        } else {
            firstField()
        }
    }

        mutating func addSecondField(horizontalOrVertical: String) {
        if horizontalOrVertical == "horizontal" {
            if firstColumn == 0 {
                secondColumn = firstColumn + 1
            } else if firstColumn == 9 {
                secondColumn = firstColumn - 1
            } else {
                secondColumn = [firstColumn - 1, firstColumn + 1].randomElement()!
            }
            if isFieldEmpty(board: board, row: firstRow, column: secondColumn) {
                board[firstRow][secondColumn] = 1
            } else {
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
            }
        } else if horizontalOrVertical == "vertical" {
            if firstRow == 0 {
                secondRow = firstRow + 1
            } else if firstRow == 9 {
                secondRow = firstRow - 1
            } else {
                secondRow = [firstRow - 1, firstRow + 1].randomElement()!
            }
            if isFieldEmpty(board: board, row: secondRow, column: firstColumn) {
                board[secondRow][firstColumn] = 1
            } else {
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
            }
        }
    }

        mutating func addThirdField(horizontalOrVertical: String) {
        if horizontalOrVertical == "horizontal" {
            if firstColumn == 0 || secondColumn == 0 {
                if firstColumn == 0 {
                    thirdColumn = secondColumn + 1
                } else {
                    thirdColumn = firstColumn + 1
                }
            } else if firstColumn == 9 || secondColumn == 9 {
                if firstColumn == 9 {
                    thirdColumn = secondColumn - 1
                } else {
                    thirdColumn = firstColumn - 1
                }
            } else {
                if firstColumn > secondColumn {
                    thirdColumn = [secondColumn - 1, firstColumn + 1].randomElement()!
                } else if secondColumn > firstColumn {
                    thirdColumn = [firstColumn - 1, secondColumn + 1].randomElement()!
                }
            }
            if isFieldEmpty(board: board, row: firstRow, column: thirdColumn) {
                board[firstRow][thirdColumn] = 1
            } else {
                board[firstRow][secondColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
            }
        } else if horizontalOrVertical == "vertical" {
            if firstRow == 0 || secondRow == 0 {
                if firstRow == 0 {
                    thirdRow = secondRow + 1
                } else {
                    thirdRow = firstRow + 1
                }
            } else if firstRow == 9 || secondRow == 9 {
                if firstRow == 9 {
                    thirdRow = secondRow - 1
                } else {
                    thirdRow = firstRow - 1
                }
            } else {
                if firstRow > secondRow {
                    thirdRow = [secondRow - 1, firstRow + 1].randomElement()!
                } else if secondRow > firstRow {
                    thirdRow = [firstRow - 1, secondRow + 1].randomElement()!
                }
            }
            if isFieldEmpty(board: board, row: thirdRow, column: firstColumn) {
                board[thirdRow][firstColumn] = 1
            } else {
                board[secondRow][firstColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
            }
        }
    }

        mutating func addFourthField(horizontalOrVertical: String) {
        if horizontalOrVertical == "horizontal" {
            if firstColumn == 0 || secondColumn == 0 || thirdColumn == 0 {
                if firstColumn == 0 {
                    if secondColumn == 1 {
                        fourthColumn = thirdColumn + 1
                    } else if thirdColumn == 1 {
                        fourthColumn = secondColumn + 1
                    }
                } else if secondColumn == 0 {
                    if firstColumn == 1 {
                        fourthColumn = thirdColumn + 1
                    } else if thirdColumn == 1 {
                        fourthColumn = firstColumn + 1
                    }
                } else if thirdColumn == 0 {
                    if firstColumn == 1 {
                        fourthColumn = secondColumn + 1
                    } else if secondColumn == 1 {
                        fourthColumn = firstColumn + 1
                    }
                }
            } else if firstColumn == 9 || secondColumn == 9 || thirdColumn == 9 {
                if firstColumn == 9 {
                    if secondColumn == 8 {
                        fourthColumn = thirdColumn - 1
                    } else if thirdColumn == 8 {
                        fourthColumn = secondColumn - 1
                    }
                } else if secondColumn == 9 {
                    if firstColumn == 8 {
                        fourthColumn = thirdColumn - 1
                    } else if thirdColumn == 8 {
                        fourthColumn = firstColumn - 1
                    }
                } else if thirdColumn == 9 {
                    if firstColumn == 8 {
                        fourthColumn = secondColumn - 1
                    } else if secondColumn == 8 {
                        fourthColumn = firstColumn - 1
                    }
                }
            } else {
                if firstColumn > secondColumn && firstColumn > thirdColumn {
                    if secondColumn > thirdColumn {
                        fourthColumn = [firstColumn + 1, thirdColumn - 1].randomElement()!
                    } else {
                        fourthColumn = [firstColumn + 1, secondColumn - 1].randomElement()!
                    }
                } else if secondColumn > firstColumn && secondColumn > thirdColumn {
                    if firstColumn > thirdColumn {
                        fourthColumn = [secondColumn + 1, thirdColumn - 1].randomElement()!
                    } else {
                        fourthColumn = [secondColumn + 1, firstColumn - 1].randomElement()!
                    }
                } else {
                    if firstColumn > secondColumn {
                        fourthColumn = [thirdColumn + 1, secondColumn - 1].randomElement()!
                    } else {
                        fourthColumn = [thirdColumn + 1, firstColumn - 1].randomElement()!
                    }
                }
            }
            if isFieldEmpty(board: board, row: firstRow, column: fourthColumn) {
                board[firstRow][fourthColumn] = 1
            } else {
                board[firstRow][thirdColumn] = 0
                board[firstRow][secondColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
                addFourthField(horizontalOrVertical: horizontalOrVertical)
                }
            }
        else if horizontalOrVertical == "vertical" {
            if firstRow == 0 || secondRow == 0 || thirdRow == 0 {
                if firstRow == 0 {
                    if secondRow == 1 {
                        fourthRow = thirdRow + 1
                    } else if thirdRow == 1 {
                        fourthRow = secondRow + 1
                    }
                } else if secondRow == 0 {
                    if firstRow == 1 {
                        fourthRow = thirdRow + 1
                    } else if thirdRow == 1 {
                        fourthRow = firstRow + 1
                    }
                } else if thirdRow == 0 {
                    if firstRow == 1 {
                        fourthRow = secondRow + 1
                    } else if secondRow == 1 {
                        fourthRow = firstRow + 1
                    }
                }
            } else if firstRow == 9 || secondRow == 9 || thirdRow == 9 {
                if firstRow == 9 {
                    if secondRow == 8 {
                        fourthRow = thirdRow - 1
                    } else if thirdRow == 8 {
                        fourthRow = secondRow - 1
                    }
                } else if secondRow == 9 {
                    if firstRow == 8 {
                        fourthRow = thirdRow - 1
                    } else if thirdRow == 8 {
                        fourthRow = firstRow - 1
                    }
                } else if thirdRow == 9 {
                    if firstRow == 8 {
                        fourthRow = secondRow - 1
                    } else if secondRow == 8 {
                        fourthRow = firstRow - 1
                    }
                }
            } else {
                if firstRow > secondRow && firstRow > thirdRow {
                    if secondRow > thirdRow {
                        fourthRow = [firstRow + 1, thirdRow - 1].randomElement()!
                    } else {
                        fourthRow = [firstRow + 1, secondRow - 1].randomElement()!
                    }
                } else if secondRow > firstRow && secondRow > thirdRow {
                    if firstRow > thirdRow {
                        fourthRow = [secondRow + 1, thirdRow - 1].randomElement()!
                    } else {
                        fourthRow = [secondRow + 1, firstRow - 1].randomElement()!
                    }
                } else {
                    if firstRow > secondRow {
                        fourthRow = [thirdRow + 1, secondRow - 1].randomElement()!
                    } else {
                        fourthRow = [thirdRow + 1, firstRow - 1].randomElement()!
                    }
                }
            }
            if isFieldEmpty(board: board, row: fourthRow, column: firstColumn) {
                board[fourthRow][firstColumn] = 1
            } else {
                board[thirdRow][firstColumn] = 0
                board[secondRow][firstColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
                addFourthField(horizontalOrVertical: horizontalOrVertical)
            }
        }
    }

        mutating func addFifthField(horizontalOrVertical: String) {
        if horizontalOrVertical == "horizontal" {
            if firstColumn == 0 || secondColumn == 0 || thirdColumn == 0 || fourthColumn == 0 {
                if firstColumn == 0 {
                    if secondColumn == 1 {
                        if thirdColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        }
                    } else if thirdColumn == 1 {
                        if secondColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = secondColumn + 1
                        }
                    } else if fourthColumn == 1 {
                        if secondColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        } else if thirdColumn == 2 {
                            fifthColumn = secondColumn + 1
                        }
                    }
                } else if secondColumn == 0 {
                    if firstColumn == 1 {
                        if thirdColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        }
                    } else if thirdColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    } else if fourthColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        } else if thirdColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    }
                } else if thirdColumn == 0 {
                    if firstColumn == 1 {
                        if secondColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = secondColumn + 1
                        }
                    } else if secondColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = fourthColumn + 1
                        } else if fourthColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    } else if fourthColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = secondColumn + 1
                        } else if secondColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    }
                }  else if fourthColumn == 0 {
                    if firstColumn == 1 {
                        if secondColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        } else if thirdColumn == 2 {
                            fifthColumn = secondColumn + 1
                        }
                    } else if secondColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = thirdColumn + 1
                        } else if thirdColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    } else if thirdColumn == 1 {
                        if firstColumn == 2 {
                            fifthColumn = secondColumn + 1
                        } else if secondColumn == 2 {
                            fifthColumn = firstColumn + 1
                        }
                    }
                }
            } else if firstColumn == 9 || secondColumn == 9 || thirdColumn == 9 || fourthColumn == 9 {
                if firstColumn == 9 {
                    if secondColumn == 8 {
                        if thirdColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        }
                    } else if thirdColumn == 8 {
                        if secondColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = secondColumn - 1
                        }
                    } else if fourthColumn == 8 {
                        if secondColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        } else if thirdColumn == 7 {
                            fifthColumn = secondColumn - 1
                        }
                    }
                } else if secondColumn == 9 {
                    if firstColumn == 8 {
                        if thirdColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        }
                    } else if thirdColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    } else if fourthColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        } else if thirdColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    }
                } else if thirdColumn == 9 {
                    if firstColumn == 8 {
                        if secondColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = secondColumn - 1
                        }
                    } else if secondColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = fourthColumn - 1
                        } else if fourthColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    } else if fourthColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = secondColumn - 1
                        } else if secondColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    }
                }  else if fourthColumn == 9 {
                    if firstColumn == 8 {
                        if secondColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        } else if thirdColumn == 7 {
                            fifthColumn = secondColumn - 1
                        }
                    } else if secondColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = thirdColumn - 1
                        } else if thirdColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    } else if thirdColumn == 8 {
                        if firstColumn == 7 {
                            fifthColumn = secondColumn - 1
                        } else if secondColumn == 7 {
                            fifthColumn = firstColumn - 1
                        }
                    }
                }
            } else {
                if firstColumn > secondColumn && firstColumn > thirdColumn && firstColumn > fourthColumn {
                    if secondColumn > thirdColumn && secondColumn > fourthColumn {
                        if thirdColumn > fourthColumn {
                            fifthColumn = [firstColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > thirdColumn {
                            fifthColumn = [firstColumn + 1, thirdColumn - 1].randomElement()!
                        }
                    } else if thirdColumn > secondColumn && thirdColumn > fourthColumn {
                        if secondColumn > fourthColumn {
                            fifthColumn = [firstColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > secondColumn {
                            fifthColumn = [firstColumn + 1, secondColumn - 1].randomElement()!
                        }
                    } else if fourthColumn > secondColumn && fourthColumn > thirdColumn {
                        if secondColumn > thirdColumn {
                            fifthColumn = [firstColumn + 1, thirdColumn - 1].randomElement()!
                        } else if thirdColumn > secondColumn {
                            fifthColumn = [firstColumn + 1, secondColumn - 1].randomElement()!
                        }
                    }
                } else if secondColumn > firstColumn && secondColumn > thirdColumn && secondColumn > fourthColumn {
                    if firstColumn > thirdColumn && firstColumn > fourthColumn {
                        if thirdColumn > fourthColumn {
                            fifthColumn = [secondColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > thirdColumn {
                            fifthColumn = [secondColumn + 1, thirdColumn - 1].randomElement()!
                        }
                    } else if thirdColumn > firstColumn && thirdColumn > fourthColumn {
                        if firstColumn > fourthColumn {
                            fifthColumn = [secondColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > firstColumn {
                            fifthColumn = [secondColumn + 1, firstColumn - 1].randomElement()!
                        }
                    } else if fourthColumn > firstColumn && fourthColumn > thirdColumn {
                        if firstColumn > thirdColumn {
                            fifthColumn = [secondColumn + 1, thirdColumn - 1].randomElement()!
                        } else if thirdColumn > firstColumn {
                            fifthColumn = [secondColumn + 1, firstColumn - 1].randomElement()!
                        }
                    }
                } else if thirdColumn > firstColumn && thirdColumn > secondColumn && thirdColumn > fourthColumn {
                    if firstColumn > secondColumn && firstColumn > fourthColumn {
                        if secondColumn > fourthColumn {
                            fifthColumn = [thirdColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > secondColumn {
                            fifthColumn = [thirdColumn + 1, secondColumn - 1].randomElement()!
                        }
                    } else if secondColumn > firstColumn && secondColumn > fourthColumn {
                        if firstColumn > fourthColumn {
                            fifthColumn = [thirdColumn + 1, fourthColumn - 1].randomElement()!
                        } else if fourthColumn > firstColumn {
                            fifthColumn = [thirdColumn + 1, firstColumn - 1].randomElement()!
                        }
                    } else if fourthColumn > firstColumn && fourthColumn > secondColumn {
                        if firstColumn > secondColumn {
                            fifthColumn = [thirdColumn + 1, secondColumn - 1].randomElement()!
                        } else if secondColumn > firstColumn {
                            fifthColumn = [thirdColumn + 1, firstColumn - 1].randomElement()!
                        }
                    }
                } else if fourthColumn > firstColumn && fourthColumn > secondColumn && fourthColumn > thirdColumn {
                    if firstColumn > secondColumn && firstColumn > thirdColumn {
                        if secondColumn > thirdColumn {
                            fifthColumn = [fourthColumn + 1, thirdColumn - 1].randomElement()!
                        } else if thirdColumn > secondColumn {
                            fifthColumn = [fourthColumn + 1, secondColumn - 1].randomElement()!
                        }
                    } else if secondColumn > firstColumn && secondColumn > thirdColumn {
                        if firstColumn > thirdColumn {
                            fifthColumn = [fourthColumn + 1, thirdColumn - 1].randomElement()!
                        } else if thirdColumn > firstColumn {
                            fifthColumn = [fourthColumn + 1, firstColumn - 1].randomElement()!
                        }
                    } else if thirdColumn > firstColumn && thirdColumn > secondColumn {
                        if firstColumn > secondColumn {
                            fifthColumn = [fourthColumn + 1, secondColumn - 1].randomElement()!
                        } else if secondColumn > firstColumn {
                            fifthColumn = [fourthColumn + 1, firstColumn - 1].randomElement()!
                        }
                    }
                }
            }
            if isFieldEmpty(board: board, row: firstRow, column: fifthColumn) {
                board[firstRow][fifthColumn] = 1
            } else {
                board[firstRow][fourthColumn] = 0
                board[firstRow][thirdColumn] = 0
                board[firstRow][secondColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
                addFourthField(horizontalOrVertical: horizontalOrVertical)
                addFifthField(horizontalOrVertical: horizontalOrVertical)
            }
        } else if horizontalOrVertical == "vertical" {
            if firstRow == 0 || secondRow == 0 || thirdRow == 0 || fourthRow == 0 {
                if firstRow == 0 {
                    if secondRow == 1 {
                        if thirdRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = thirdRow + 1
                        }
                    } else if thirdRow == 1 {
                        if secondRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = secondRow + 1
                        }
                    } else if fourthRow == 1 {
                        if secondRow == 2 {
                            fifthRow = thirdRow + 1
                        } else if thirdRow == 2 {
                            fifthRow = secondRow + 1
                        }
                    }
                } else if secondRow == 0 {
                    if firstRow == 1 {
                        if thirdRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = thirdRow + 1
                        }
                    } else if thirdRow == 1 {
                        if firstRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    } else if fourthRow == 1 {
                        if firstRow == 2 {
                            fifthRow = thirdRow + 1
                        } else if thirdRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    }
                } else if thirdRow == 0 {
                    if firstRow == 1 {
                        if secondRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = secondRow + 1
                        }
                    } else if secondRow == 1 {
                        if firstRow == 2 {
                            fifthRow = fourthRow + 1
                        } else if fourthRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    } else if fourthRow == 1 {
                        if firstRow == 2 {
                            fifthRow = secondRow + 1
                        } else if secondRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    }
                }  else if fourthRow == 0 {
                    if firstRow == 1 {
                        if secondRow == 2 {
                            fifthRow = thirdRow + 1
                        } else if thirdRow == 2 {
                            fifthRow = secondRow + 1
                        }
                    } else if secondRow == 1 {
                        if firstRow == 2 {
                            fifthRow = thirdRow + 1
                        } else if thirdRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    } else if thirdRow == 1 {
                        if firstRow == 2 {
                            fifthRow = secondRow + 1
                        } else if secondRow == 2 {
                            fifthRow = firstRow + 1
                        }
                    }
                }
            } else if firstRow == 9 || secondRow == 9 || thirdRow == 9 || fourthRow == 9 {
                if firstRow == 9 {
                    if secondRow == 8 {
                        if thirdRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = thirdRow - 1
                        }
                    } else if thirdRow == 8 {
                        if secondRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = secondRow - 1
                        }
                    } else if fourthRow == 8 {
                        if secondRow == 7 {
                            fifthRow = thirdRow - 1
                        } else if thirdRow == 7 {
                            fifthRow = secondRow - 1
                        }
                    }
                } else if secondRow == 9 {
                    if firstRow == 8 {
                        if thirdRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = thirdRow - 1
                        }
                    } else if thirdRow == 8 {
                        if firstRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    } else if fourthRow == 8 {
                        if firstRow == 7 {
                            fifthRow = thirdRow - 1
                        } else if thirdRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    }
                } else if thirdRow == 9 {
                    if firstRow == 8 {
                        if secondRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = secondRow - 1
                        }
                    } else if secondRow == 8 {
                        if firstRow == 7 {
                            fifthRow = fourthRow - 1
                        } else if fourthRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    } else if fourthRow == 8 {
                        if firstRow == 7 {
                            fifthRow = secondRow - 1
                        } else if secondRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    }
                }  else if fourthRow == 9 {
                    if firstRow == 8 {
                        if secondRow == 7 {
                            fifthRow = thirdRow - 1
                        } else if thirdRow == 7 {
                            fifthRow = secondRow - 1
                        }
                    } else if secondRow == 8 {
                        if firstRow == 7 {
                            fifthRow = thirdRow - 1
                        } else if thirdRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    } else if thirdRow == 8 {
                        if firstRow == 7 {
                            fifthRow = secondRow - 1
                        } else if secondRow == 7 {
                            fifthRow = firstRow - 1
                        }
                    }
                }
            } else {
                if firstRow > secondRow && firstRow > thirdRow && firstRow > fourthRow {
                    if secondRow > thirdRow && secondRow > fourthRow {
                        if thirdRow > fourthRow {
                            fifthRow = [firstRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > thirdRow {
                            fifthRow = [firstRow + 1, thirdRow - 1].randomElement()!
                        }
                    } else if thirdRow > secondRow && thirdRow > fourthRow {
                        if secondRow > fourthRow {
                            fifthRow = [firstRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > secondRow {
                            fifthRow = [firstRow + 1, secondRow - 1].randomElement()!
                        }
                    } else if fourthRow > secondRow && fourthRow > thirdRow {
                        if secondRow > thirdRow {
                            fifthRow = [firstRow + 1, thirdRow - 1].randomElement()!
                        } else if thirdRow > secondRow {
                            fifthRow = [firstRow + 1, secondRow - 1].randomElement()!
                        }
                    }
                } else if secondRow > firstRow && secondRow > thirdRow && secondRow > fourthRow {
                    if firstRow > thirdRow && firstRow > fourthRow {
                        if thirdRow > fourthRow {
                            fifthRow = [secondRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > thirdRow {
                            fifthRow = [secondRow + 1, thirdRow - 1].randomElement()!
                        }
                    } else if thirdRow > firstRow && thirdRow > fourthRow {
                        if firstRow > fourthRow {
                            fifthRow = [secondRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > firstRow {
                            fifthRow = [secondRow + 1, firstRow - 1].randomElement()!
                        }
                    } else if fourthRow > firstRow && fourthRow > thirdRow {
                        if firstRow > thirdRow {
                            fifthRow = [secondRow + 1, thirdRow - 1].randomElement()!
                        } else if thirdRow > firstRow {
                            fifthRow = [secondRow + 1, firstRow - 1].randomElement()!
                        }
                    }
                } else if thirdRow > firstRow && thirdRow > secondRow && thirdRow > fourthRow {
                    if firstRow > secondRow && firstRow > fourthRow {
                        if secondRow > fourthRow {
                            fifthRow = [thirdRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > secondRow {
                            fifthRow = [thirdRow + 1, secondRow - 1].randomElement()!
                        }
                    } else if secondRow > firstRow && secondRow > fourthRow {
                        if firstRow > fourthRow {
                            fifthRow = [thirdRow + 1, fourthRow - 1].randomElement()!
                        } else if fourthRow > firstRow {
                            fifthRow = [thirdRow + 1, firstRow - 1].randomElement()!
                        }
                    } else if fourthRow > firstRow && fourthRow > secondRow {
                        if firstRow > secondRow {
                            fifthRow = [thirdRow + 1, secondRow - 1].randomElement()!
                        } else if secondRow > firstRow {
                            fifthRow = [thirdRow + 1, firstRow - 1].randomElement()!
                        }
                    }
                } else if fourthRow > firstRow && fourthRow > secondRow && fourthRow > thirdRow {
                    if firstRow > secondRow && firstRow > thirdRow {
                        if secondRow > thirdRow {
                            fifthRow = [fourthRow + 1, thirdRow - 1].randomElement()!
                        } else if thirdRow > secondRow {
                            fifthRow = [fourthRow + 1, secondRow - 1].randomElement()!
                        }
                    } else if secondRow > firstRow && secondRow > thirdRow {
                        if firstRow > thirdRow {
                            fifthRow = [fourthRow + 1, thirdRow - 1].randomElement()!
                        } else if thirdRow > firstRow {
                            fifthRow = [fourthRow + 1, firstRow - 1].randomElement()!
                        }
                    } else if thirdRow > firstRow && thirdRow > secondRow {
                        if firstRow > secondRow {
                            fifthRow = [fourthRow + 1, secondRow - 1].randomElement()!
                        } else if secondRow > firstRow {
                            fifthRow = [fourthRow + 1, firstRow - 1].randomElement()!
                        }
                    }
                }
            }
            if isFieldEmpty(board: board, row: fifthRow, column: firstColumn) {
                board[fifthRow][firstColumn] = 1
            } else {
                board[fourthRow][firstColumn] = 0
                board[thirdRow][firstColumn] = 0
                board[secondRow][firstColumn] = 0
                board[firstRow][firstColumn] = 0
                firstField()
                addSecondField(horizontalOrVertical: horizontalOrVertical)
                addThirdField(horizontalOrVertical: horizontalOrVertical)
                addFourthField(horizontalOrVertical: horizontalOrVertical)
                addFifthField(horizontalOrVertical: horizontalOrVertical)
            }
        }
    }




    mutating func smallBoat(){
        let horizontalOrVertical = randomHorizontalOrVertical()
        firstField()
        addSecondField(horizontalOrVertical: horizontalOrVertical)
        addThirdField(horizontalOrVertical: horizontalOrVertical)
    }

    mutating func mediumBoat(){
        let horizontalOrVertical = randomHorizontalOrVertical()
        firstField()
        addSecondField(horizontalOrVertical: horizontalOrVertical)
        addThirdField(horizontalOrVertical: horizontalOrVertical)
        addFourthField(horizontalOrVertical: horizontalOrVertical)
    }

    mutating func bigBoat(){
        let horizontalOrVertical = randomHorizontalOrVertical()
        firstField()
        addSecondField(horizontalOrVertical: horizontalOrVertical)
        addThirdField(horizontalOrVertical: horizontalOrVertical)
        addFourthField(horizontalOrVertical: horizontalOrVertical)
        addFifthField(horizontalOrVertical: horizontalOrVertical)
        }

    mutating func playerBoats() {
        smallBoat()
        smallBoat()
        mediumBoat()
        mediumBoat()
        bigBoat()
    }
}

battleShips()
