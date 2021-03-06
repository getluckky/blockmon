-- -----------------------------------------------------------------------
--
--   Company: INVEA-TECH a.s.
--
--   Project: IPFIX design
--
-- -----------------------------------------------------------------------
--
--   (c) Copyright 2011 INVEA-TECH a.s.
--   All rights reserved.
--
--   Please review the terms of the license agreement before using this
--   file. If you are not an authorized user, please destroy this
--   source code file and notify INVEA-TECH a.s. immediately that you
--   inadvertently received an unauthorized copy.
--
-- -----------------------------------------------------------------------
--

--
-- dec1fn.vhd: Decoder 1 from n
-- Copyright (C) 2003 CESNET
-- Author(s): Martinek Tomas <martinek@liberouter.org>
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in
--    the documentation and/or other materials provided with the
--    distribution.
-- 3. Neither the name of the Company nor the names of its contributors
--    may be used to endorse or promote products derived from this
--    software without specific prior written permission.
--
-- This software is provided ``as is'', and any express or implied
-- warranties, including, but not limited to, the implied warranties of
-- merchantability and fitness for a particular purpose are disclaimed.
-- In no event shall the company or contributors be liable for any
-- direct, indirect, incidental, special, exemplary, or consequential
-- damages (including, but not limited to, procurement of substitute
-- goods or services; loss of use, data, or profits; or business
-- interruption) however caused and on any theory of liability, whether
-- in contract, strict liability, or tort (including negligence or
-- otherwise) arising in any way out of the use of this software, even
-- if advised of the possibility of such damage.
--
-- $Id: dec1fn.vhd 9364 2009-07-14 07:06:35Z xplese01 $
--
-- TODO:
--
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use work.math_pack.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity dec1fn is
   generic(
      ITEMS       : integer := 8
   );
   port(
      ADDR        : in  std_logic_vector(log2(ITEMS)-1 downto 0);
      DO          : out std_logic_vector(ITEMS-1 downto 0)
   );
end entity dec1fn;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of dec1fn is


begin

process(ADDR)
begin
   DO    <= (others => '0');

   for i in 0 to (ITEMS-1) loop
      if (conv_std_logic_vector(i, log2(ITEMS)) = ADDR) then
         DO(i) <= '1';
      end if;
   end loop;
end process;

end architecture behavioral;

