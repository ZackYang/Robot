# frozen_string_literal: true

describe Map::TableTop do
  describe '#initialize' do
    context 'when options have no dimensions data' do
      let(:map) { described_class.new }

      it 'returns a 5 by 5 matrix whose all elements are true' do
        expect(map.matrix.row_size).to eq(5)
        expect(map.matrix.column_size).to eq(5)
        expect(map.matrix.to_a.flatten).to be_all(true)
      end
    end

    context 'when options have 2x6 dimensions' do
      let(:map) { described_class.new(height: 2, width: 6) }

      it 'returns a 2 by 6 matrix whose all elements are true' do
        expect(map.matrix.row_size).to eq(2)
        expect(map.matrix.column_size).to eq(6)
        expect(map.matrix.to_a.flatten).to be_all(true)
      end
    end
  end

  context 'when map is 3x7 table top' do
    let(:map) { described_class.new(height: 3, width: 7) }

    context 'when 0, 6 is blocked' do
      before { map.block(6, 0) }

      describe '#block' do
        it 'makes 0, 6 blocked' do
          expect(map.matrix[6, 0]).to be_falsey
        end
      end

      describe '#available?' do
        context 'when the location is out of border' do
          it 'returns false' do
            expect(map).not_to be_available(8, 0)
          end
        end

        context 'when the location has nagative integer' do
          it 'returns false' do
            expect(map).not_to be_available(-1, 0)
          end
        end

        context 'when the location is in border' do
          context 'when the location is true' do
            it 'returns false' do
              expect(map.available?(1, 1)).to eq(true)
            end
          end

          context 'when the location is blocked' do
            it 'returns false' do
              expect(map.available?(6, 0)).to eq(false)
            end
          end
        end
      end
    end
  end
end
