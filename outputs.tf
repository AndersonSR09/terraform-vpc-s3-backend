output "vpc_id" {
  value = aws_vpc.vpc_git.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "subpub1_id" {
  value = aws_subnet.subpub.id
}

output "route_table_id" {
  value = aws_route_table.art.id
}

output "subpub2_id" {
  value = aws_subnet.subpub_2.id
}

output "rtb_priv_id" {
  value = aws_route_table.rtb_priv.id
}

output "subpriv_1_id" {
  value = aws_subnet.subpriv.id
}

output "subpriv_2_id" {
  value = aws_subnet.subpriv2.id
}