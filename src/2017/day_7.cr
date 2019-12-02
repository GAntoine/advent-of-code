module AdventOfCode
  class SeventhDay
    def self.part_one(file_path)
      branches = File.read_lines(file_path)
                     .select { |l| /\-\>/.match l }

      keys = branches.map { |b| b.split.first }
      branches.each do |branch|
        keys -= branch.split(" -> ").last.split(", ")
      end

      keys.first
    end

    def self.part_two(file_path)
      final_weight = 0
      branches = File.read_lines(file_path)
      nodes = branches.select { |l| /\-\>/.match l }
      leafs = branches.reject { |l| /\-\>/.match l }

      weight_dict = branches.map do |b|
        [
          b.split.first.to_s,
          b.split[1][1..-2].to_i,
        ]
      end.to_h

      child_dict = nodes.map do |b|
        [
          b.split.first,
          b.split(" -> ").last.split(", "),
        ]
      end.to_h

      leafs.each { |l| child_dict[l.split.first] = [] of String }

      nodes.each do |node|
        node_name = node.split.first
        children = [child_dict[node_name]].flatten

        child_weights = children.map do |child|
          {child => get_node_weight(child, weight_dict, child_dict)}
        end

        by_weight = child_weights.group_by { |k| k.values.first }
        if by_weight.size > 1
          broken_weight = by_weight.select { |w, v| v.size == 1 }.keys.first
          target_weight = by_weight.reject { |w, v| v.size == 1 }.keys.first
          broken_key = by_weight[broken_weight].first.keys.first

          difference = target_weight - broken_weight
          final_weight = weight_dict[broken_key].to_i + difference
          break
        end
      end

      final_weight
    end

    def self.get_node_weight(node, w_dict, c_dict)
      children = [c_dict[node]].flatten
      w_dict[node].to_i + children.reduce(0) do |acc, child|
        acc + get_node_weight(child, w_dict, c_dict)
      end
    end
  end
end
