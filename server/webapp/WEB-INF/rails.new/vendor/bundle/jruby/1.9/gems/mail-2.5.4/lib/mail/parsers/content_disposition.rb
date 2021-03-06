# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module ContentDisposition
    include Treetop::Runtime

    def root
      @root ||= :content_disposition
    end

    include RFC2822

    include RFC2045

    module ContentDisposition0
      def CFWS1
        elements[0]
      end

      def parameter
        elements[2]
      end

      def CFWS2
        elements[3]
      end
    end

    module ContentDisposition1
      def disposition_type
        elements[0]
      end

      def param_hashes
        elements[1]
      end
    end

    module ContentDisposition2
      def parameters
        param_hashes.elements.map do |param|
          param.parameter.param_hash
        end
      end
    end

    def _nt_content_disposition
      start_index = index
      if node_cache[:content_disposition].has_key?(index)
        cached = node_cache[:content_disposition][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_disposition_type
      s0 << r1
      if r1
        s2, i2 = [], index
        loop do
          i3, s3 = index, []
          r4 = _nt_CFWS
          s3 << r4
          if r4
            if has_terminal?(";", false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(";")
              r5 = nil
            end
            s3 << r5
            if r5
              r6 = _nt_parameter
              s3 << r6
              if r6
                r7 = _nt_CFWS
                s3 << r7
              end
            end
          end
          if s3.last
            r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
            r3.extend(ContentDisposition0)
          else
            @index = i3
            r3 = nil
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        s0 << r2
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ContentDisposition1)
        r0.extend(ContentDisposition2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:content_disposition][start_index] = r0

      r0
    end

    module DispositionType0
    end

    module DispositionType1
    end

    def _nt_disposition_type
      start_index = index
      if node_cache[:disposition_type].has_key?(index)
        cached = node_cache[:disposition_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      if has_terminal?('\G[iI]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      s1 << r2
      if r2
        if has_terminal?('\G[nN]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        s1 << r3
        if r3
          if has_terminal?('\G[lL]', true, index)
            r4 = true
            @index += 1
          else
            r4 = nil
          end
          s1 << r4
          if r4
            if has_terminal?('\G[iI]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            s1 << r5
            if r5
              if has_terminal?('\G[nN]', true, index)
                r6 = true
                @index += 1
              else
                r6 = nil
              end
              s1 << r6
              if r6
                if has_terminal?('\G[eE]', true, index)
                  r7 = true
                  @index += 1
                else
                  r7 = nil
                end
                s1 << r7
              end
            end
          end
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(DispositionType0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        i8, s8 = index, []
        if has_terminal?('\G[aA]', true, index)
          r9 = true
          @index += 1
        else
          r9 = nil
        end
        s8 << r9
        if r9
          if has_terminal?('\G[tT]', true, index)
            r10 = true
            @index += 1
          else
            r10 = nil
          end
          s8 << r10
          if r10
            if has_terminal?('\G[tT]', true, index)
              r11 = true
              @index += 1
            else
              r11 = nil
            end
            s8 << r11
            if r11
              if has_terminal?('\G[aA]', true, index)
                r12 = true
                @index += 1
              else
                r12 = nil
              end
              s8 << r12
              if r12
                if has_terminal?('\G[cC]', true, index)
                  r13 = true
                  @index += 1
                else
                  r13 = nil
                end
                s8 << r13
                if r13
                  if has_terminal?('\G[hH]', true, index)
                    r14 = true
                    @index += 1
                  else
                    r14 = nil
                  end
                  s8 << r14
                  if r14
                    if has_terminal?('\G[mM]', true, index)
                      r15 = true
                      @index += 1
                    else
                      r15 = nil
                    end
                    s8 << r15
                    if r15
                      if has_terminal?('\G[eE]', true, index)
                        r16 = true
                        @index += 1
                      else
                        r16 = nil
                      end
                      s8 << r16
                      if r16
                        if has_terminal?('\G[nN]', true, index)
                          r17 = true
                          @index += 1
                        else
                          r17 = nil
                        end
                        s8 << r17
                        if r17
                          if has_terminal?('\G[tT]', true, index)
                            r18 = true
                            @index += 1
                          else
                            r18 = nil
                          end
                          s8 << r18
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s8.last
          r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
          r8.extend(DispositionType1)
        else
          @index = i8
          r8 = nil
        end
        if r8
          r0 = r8
        else
          r19 = _nt_extension_token
          if r19
            r0 = r19
          else
            if has_terminal?('', false, index)
              r20 = instantiate_node(SyntaxNode,input, index...(index + 0))
              @index += 0
            else
              terminal_parse_failure('')
              r20 = nil
            end
            if r20
              r0 = r20
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end

      node_cache[:disposition_type][start_index] = r0

      r0
    end

    def _nt_extension_token
      start_index = index
      if node_cache[:extension_token].has_key?(index)
        cached = node_cache[:extension_token][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_ietf_token
      if r1
        r0 = r1
      else
        r2 = _nt_custom_x_token
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:extension_token][start_index] = r0

      r0
    end

    module Parameter0
      def attr
        elements[1]
      end

      def val
        elements[3]
      end

    end

    module Parameter1
      def param_hash
        {attr.text_value => val.text_value}
      end
    end

    def _nt_parameter
      start_index = index
      if node_cache[:parameter].has_key?(index)
        cached = node_cache[:parameter][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r2 = _nt_CFWS
      if r2
        r1 = r2
      else
        r1 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r1
      if r1
        r3 = _nt_attribute
        s0 << r3
        if r3
          if has_terminal?("=", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("=")
            r4 = nil
          end
          s0 << r4
          if r4
            r5 = _nt_value
            s0 << r5
            if r5
              r7 = _nt_CFWS
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Parameter0)
        r0.extend(Parameter1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:parameter][start_index] = r0

      r0
    end

    def _nt_attribute
      start_index = index
      if node_cache[:attribute].has_key?(index)
        cached = node_cache[:attribute][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        r1 = _nt_token
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:attribute][start_index] = r0

      r0
    end

    module Value0
      def text_value
        quoted_content.text_value
      end
    end

    def _nt_value
      start_index = index
      if node_cache[:value].has_key?(index)
        cached = node_cache[:value][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_quoted_string
      r1.extend(Value0)
      if r1
        r0 = r1
      else
        s2, i2 = [], index
        loop do
          i3 = index
          r4 = _nt_token
          if r4
            r3 = r4
          else
            if has_terminal?('\G[\\x3d]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            if r5
              r3 = r5
            else
              @index = i3
              r3 = nil
            end
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        if s2.empty?
          @index = i2
          r2 = nil
        else
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        end
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:value][start_index] = r0

      r0
    end

  end

  class ContentDispositionParser < Treetop::Runtime::CompiledParser
    include ContentDisposition
  end

end
