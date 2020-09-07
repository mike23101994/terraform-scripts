
resource "aws_ebs_snapshot" "nile-ec2-snapshot" {

  count       = var.ebs_snapshot ? length(var.vol_ids) : 0
  volume_id   =  var.vol_ids[count.index]
  # volume_id     = element(module.ec2_mod_for_ebs_snapshot[0].ebs_volume_id, 0 )
  description = var.snapshot_description

  tags = {
    Name = var.tag_name_snap
  }

  # timeouts{
  #   create            = var.timeouts_create
  #   delete            = var.timeouts_delete
  # }
}

## Provides snapshot copy of ebs  ##

resource "aws_ebs_snapshot_copy" "ebs_snapshot_copy" {

  count              =  var.ebs_snapshot ? length(var.vol_ids) : 0
  source_snapshot_id = aws_ebs_snapshot.nile-ec2-snapshot[count.index].id
  # source_snapshot_id   = aws_ebs_snapshot.nile-ec2-snapshot[0].id
  source_region      = var.snapshot_region
  encrypted          = var.snapshot_encrypted
#   kms_key_id         = aws_kms_key.example.arn

  tags = {
    Name = var.tag_name_snap_copy
  }
}


# module "ec2_mod_for_ebs_snapshot" {
#   count = var.ebs_snapshot ? 1 : 0
#   source =  "./module_ec2"
# }