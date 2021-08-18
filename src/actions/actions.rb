module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state) 
        #Verificar que la siguiente casilla sea valida
        if position_is_valid?(steta, next_position)
        else
        end_game(state)
        end
    end

    private 

    def calc_next_position(state)
        curr_position = state.snake.positions.first
        case state.next_direction
        when UP
            #decrementar fila
            return Model::Coord.new(
                curr_position.row - 1,
                curr_position.col
            )
        when RIGH
            #incrementar col 
            return Model ::Coord.new(
                 curr_position.row,
                 curr_position.col + 1
            )
        when DOWN
            #incrementar fila
            return Model::Coord.new(
                curr_position.row + 1,
                curr_position.col 
            )
        when LEFT 
            #decrementar col
            return Model::Coord.new(
                curr_position.row,
                curr_position.col - 1
            )
        end
    end

    def position_is_valid?(state,position)
        #verificar que este en la grilla
        is_invalid = ((position.row >= state.grid.rows ||position.row < 0)
        || (position.col >= state.grid.cols || position.col < 0))
        return false if is_invalid
        #verificar que no este superponiendo a la serpiente
        return !(state.snake.positions.include? position)
    end

    def move_snake_to(state, next_position)
        new_positions = [next_position] + state.sanke.positions[0 ... - 1]
        state.snake.positions = new_positions
    end

    def end_game(state)
        state.game_finished = true
        state 
    end
end
